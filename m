Received: from msgbas1x.cos.agilent.com ([192.25.240.36])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AwPw4-0005FZ-1b
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2004 18:08:36 +0000
Received: from relcos1.cos.agilent.com (relcos1.cos.agilent.com
	[130.29.152.239])
	by msgbas1x.cos.agilent.com (Postfix) with ESMTP id E74912411E
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Feb 2004 11:08:33 -0700 (MST)
Received: from wcosbh23.cos.agilent.com (wcosbh23.cos.agilent.com
	[130.29.152.145])
	by relcos1.cos.agilent.com (Postfix) with ESMTP id D1266115
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Feb 2004 11:08:33 -0700 (MST)
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Feb 2004 11:08:33 -0700
Message-ID: <3236F92B82933347807DFF6A8BA632801430A5@wcosmb04.cos.agilent.com>
From: <xiaogeng_jin@agilent.com>
To: <linux-mtd@lists.infradead.org>
Subject: FW: Why CFI_DEVICETYPE_X8 in cfi_send_gen_cmd()?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Somehow, this email got denied. Isn't my outlook broken?

So I just forward to the list. Sorry for the duplicate emails.

> -----Original Message-----
> From: JIN,XIAOGENG (A-Americas,ex1)=20
> Sent: Wednesday, February 25, 2004 4:02 PM
> To: 'David Vrabel'; linux-mtd list
> Subject: RE: Why CFI_DEVICETYPE_X8 in cfi_send_gen_cmd()?
>=20
>=20
> Thank you very much for your reply. Some further questions. ;)
>=20
> > > In cfi_cmdset_0002.c, there is a piece of comment stating that the
> > > CFI_DEVICETYPE_X8 is needed even when cfi->device_type !=3D
> > > CFI_DEVICETYPE_X8. Why is it the case?
> >=20
> > It appears to be to handle the case of x16 chips in x8 mode. =20
> > In such a=20
> > case the device width is 2, interleave is 1 and buswidth is 1.=20
> > Therefore, cfi_build_cmd_addr() will not generate the=20
> correct unlock=20
> > addresses. (i.e., there's no integral solution to 0xaaa =3D addr *=20
> > device_width (2) * interleave (1) which is the required=20
> > unlock address.)
>=20
> Could you please explain why the cfi->addr_unlock1 is 0x1555=20
> in the case of CFI_DEVICETYPE_X32? I got a little bit=20
> confused here. For example, Am29PL320D is AMD's first 32-bit=20
> flash memory. Assuming the buswidth is 4, interleave is 1,=20
> and the device width is 4, 0x555 is the unlock address=20
> according to the table of command definitions in the=20
> datasheet. Thus the cfi->addr_unlock1 should be 0x555 not=20
> 0x1555. We don't need to shift the unlock address in this=20
> example. Is the reasoning correct?
>=20
> > Not sure how to handle all possible arrangements of chips.
> >=20
> >     Dev. width | interleave  | buswidth |   addr1 |   addr2
> >     -------------------------------------------------------
> >I.   2          | 1           | 2        |   0xaaa |   0x554
> >II.  2          | 1           | 1        |   0xaaa |   0x555
> >III. 4          | 2           | 8        |  0x2aa8 |  0x1550
> >=20
> > (addr1 and addr2 are byte addresses -- the AMD datasheets typically=20
> > gives word addresses)
> >=20
> Hmmm...the case III cannot be handled by the current code,=20
> right? Then I can just treat it as a special case.
>=20
> > > So I replaced CFI_DEVICETYPE_X8 with cfi->device_type in both
> > > do_erase_oneblock() and do_write_oneword(). I tested and=20
> > found that erase
> > > can succeed but write still fails.
> >=20
> > Maybe you're using do_write_buffer(..) instead? There's a=20
> > comment near=20
> > it that says it may well be broken for interleaved chips, though.
> >=20
> I surely use do_write_oneword() not write_buffer(). Actually=20
> erase doesn't always succeed. Use the utility 'erase' coming=20
> from CVS, I tested erasing multiple blocks and found that=20
> only the 1st block is erased. For example, 'erase /dev/mtd1 0=20
> 2' only erases the first block (512KiB). However 'erase=20
> /dev/mtd1 0x80000' can erase the 2nd block in /dev/mtd1.
>=20
> But write still cannot write even a word.
>=20
> Is Am29PL320D so special that the current code cannot handle=20
> it? I think mtd stuff is generic enough. ???
>=20
> -Shawn.
>=20
