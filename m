Received: from mail.mediatrix.com ([205.237.248.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157dWp-0006BZ-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2001 14:39:19 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D99548D@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: Abraham vd Merwe <abraham@2d3d.co.za>, MTD for Linux
	 <linux-mtd@lists.infradead.org>
Subject: RE: mtd_info->write 
Date: Wed, 6 Jun 2001 09:38:15 -0400 
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

There is validation, in do_write_oneword ( cfi_cmdset_0002.c ), there =
is
pooling to see if data has changed.

Fr=E9d=E9ric Giasson
=20




-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Wednesday, June 06, 2001 9:41 AM
To: Frederic Giasson
Cc: Abraham vd Merwe; MTD for Linux
Subject: Re: mtd_info->write=20



fgiasson@mediatrix.com said:
> That's right, but a read back validation has to show the error.

There is no such read back validation in any of the MTD code, is there?
If you write to a region which already contains data, then read back =
and=20
compare with the data you wrote, you're likely to see differences.

Film at 11. :)

--
dwmw2
