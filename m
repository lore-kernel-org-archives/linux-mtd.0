Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178m5l-0006Ih-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 19:04:37 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D014ECF40@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: RE: Kernel oops after sync command in jffs2 
Date: Fri, 17 May 2002 14:04:35 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

I think I found a possible source for the oops I reported previously =
this
week.

When the oops happen, the do_erase_oneblock() function if =
cfi_cmdset_0002.c
complains that DQ5 has been asserted to "1" while the flash was still
erasing, meaning that a program command has been attempted. =20

So I examined the chip driver to see if there were a gap in the mutual
exclusion of the chip access.  I found that function cfi_amdstd_write() =
send
unlock bypass command to the flash without verifying if the flash is =
ready
first, if cfi->fast_prog is true.  I tryied to disable fast_prog in
cfi_probe.c, and the oops did not happen again.  It sound like it were =
the
problem, although I am not 100% sure yet.

I will send you the oops trace along with the callback trace if it ever
shows up again.

Fr=E9d=E9ric Giasson

|-----Original Message-----
|From: David Woodhouse [mailto:dwmw2@infradead.org]
|Sent: Thursday, May 16, 2002 1:35 PM
|To: Frederic Giasson
|Cc: 'linux-mtd@lists.infradead.org'
|Subject: Re: Kernel oops after sync command in jffs2=20
|
|
|
|Show oops? Decoded.
|
|--
|dwmw2
|
|
