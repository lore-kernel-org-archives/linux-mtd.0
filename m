Received: from mail.mediatrix.com ([205.237.248.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157GI0-0004gz-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 13:50:28 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D995483@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'David Woodhouse' <dwmw2@infradead.org>, Abraham vd Merwe
	 <abraham@2d3d.co.za>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: RE: erasesize 
Date: Tue, 5 Jun 2001 08:49:24 -0400 
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

	I have a question too about the erase->len ( erasesize ).  I have a
flash chip with variable block sizes, and I am using cfi_cmdset_0002.  =
Where
should that ->len be set?  When I printk the value held by erase->len =
just
before calling do_erase_oneblock() in cfi_amdstd_erase_varsize(), I get =
a
dummy value.  I suspect that it should be set according to the
mtd_erase_region_info structure, but it is not done.=20

	Does anyone has a clue about it? =20

Thanks!

Fr=E9d=E9ric Giasson  =20






-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Tuesday, June 05, 2001 8:30 AM
To: Abraham vd Merwe
Cc: MTD for Linux
Subject: Re: erasesize=20



abraham@2d3d.co.za said:
>  What should I set erasesize to when the flash chips have multiple
> erase sizes (and therefor I use eraseregions to get erasesize info)?
> Is 0 acceptable or should I set it to something else - it doesn't
> really make sense to put any value in this after all...

See the other Intel driver. Set the erase size to the 'major' erase =
size=20
for the device, then fill in the appropriate structure to represent the =

other regions.

--
dwmw2



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
