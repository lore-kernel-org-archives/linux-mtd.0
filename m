Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ALTb-0006z5-00
	for <linux-mtd@lists.infradead.org>; Wed, 22 May 2002 03:03:43 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D014ECF49@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: RE: Kernel oops after sync command in jffs2 
Date: Tue, 21 May 2002 22:03:34 -0400
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

Your fix in mtdconcat.c solves the OOPS.  However, erase is still =
failing. =20

The 'called while erasing!' message means that I put a trace in the map
driver write16() function to tell me if write16()is called when a =
global
variable is set.  This global variable indicates that do_erase_oneword =
has
sent the erase sector command and is currently polling for the erase
operation to complete.

I tried removing DQ5 check while do_erase_oneblock() is polling the =
flash to
know when the erase is completed.  DQ5 rises if one of the 2 following
conditions occurs: the flash device received a write command for a bank =
that
is still erasing or a timeout internal to the flash device itself has
expired while the flash was still erasing. =20
Theorically, the software timeout in do_erase_oneblock (timeo) should =
expire
before the flash's internal timeout, which eliminates the second =
condition.
If the first condition *really* occurs, then the function which issued =
a
write command to the flash should fail, and I should be able to track =
it
down this way.  What I suspect is that DQ5 is somehow not *really* =
raising
and the polling algorithm in do_erase_oneblock() reports an error =
anyways.
If my test succeeds this time with DQ5 polling disabled, I will inform =
you.
Otherwise, I will keep on searching the cause of DQ5 raising.

Fr=E9d=E9ric Giasson


|-----Original Message-----
|From: David Woodhouse [mailto:dwmw2@infradead.org]
|Sent: Tuesday, May 21, 2002 5:08 PM
|To: Frederic Giasson
|Cc: 'linux-mtd@lists.infradead.org'
|Subject: Re: Kernel oops after sync command in jffs2=20
|
|
|> mtxmap_write16() called when erasing!
|> waiting for erase to complete timed out.
|> Erase at 0x00030000 failed immediately: errno -5
|> Oops: kernel access of bad area, sig: 11
|
|> C00BCEFC:	concat_erase_callback()
|> C00BD26C:	concat_erase()
|
|Thanks. mtdconcat.c shouldn't have been calling the erase completion=20
|callback _and_ returning failure. Can you update it and try again?
|
|T'would still be interesting to know _why_ the erase failed=20
|though. What=20
|does the 'called while erasing!' message mean?
|
|--
|dwmw2
|
|
