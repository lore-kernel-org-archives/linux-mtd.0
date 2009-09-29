Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MsfL6-0001G6-V3
	for linux-mtd@lists.infradead.org; Tue, 29 Sep 2009 16:14:18 +0000
From: "Darwin Rambo" <drambo@broadcom.com>
To: "dedekind@infradead.org" <dedekind@infradead.org>
Date: Tue, 29 Sep 2009 09:13:55 -0700
Subject: RE: UBIFS and hardware ECC of all FF pages of MLC NAND
Message-ID: <B125D8217ABC4B43826503DE00A2D44910D7F2EAE3@SJEXCHCCR01.corp.ad.broadcom.com>
References: <B125D8217ABC4B43826503DE00A2D44910D7E85DFD@SJEXCHCCR01.corp.ad.broadcom.com>
	<4ABB7224.8000804@nokia.com> <4ABB921B.8090500@parrot.com>
	<1253862309.3778.25.camel@localhost>
	<B125D8217ABC4B43826503DE00A2D44910D7F2EA60@SJEXCHCCR01.corp.ad.broadcom.com>
	<1254238936.3778.109.camel@localhost>
In-Reply-To: <1254238936.3778.109.camel@localhost>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=koi8-r
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=20

> -----Original Message-----
> From: Artem Bityutskiy [mailto:dedekind@infradead.org]=20
> Sent: Tuesday, September 29, 2009 8:42 AM
> To: Darwin Rambo
> Cc: Matthieu CASTET; linux-mtd@lists.infradead.org; Adrian Hunter
> Subject: RE: UBIFS and hardware ECC of all FF pages of MLC NAND
>=20
> On Tue, 2009-09-29 at 06:26 -0700, Darwin Rambo wrote:
> > Artem,
> >=20
> > One thing you might add is a paranoid check for the OOB=20
> being set to 0xFF before=20
> > programming a page. If someone programs trailing pages in a=20
> block of 0xFF by mistake,=20
> > and puts a non-0xFF ECC in the OOB, then the UBIFS code=20
> would write to an already=20
> > written ECC, which I have found to corrupt other blocks=20
> ECCs on my part. It also gives=20
> > strange error messages and refuses to mount on reboot. The=20
> messages do not look like=20
> > they are related to the original ECC write problem so it is=20
> harder to debug.
>=20
> Do you mean extending the 'ubi_dbg_check_all_ff()' check and make it
> also read OOB to make sure there are only 0xFF bytes? Well,=20
> it might be
> useful, but I would prefer to get a patch from someone, rather than
> implementing this myself. :-)

That's what I meant. I am not very patch-aware but will consider trying.

>=20
> > With this particular error, you can see messages like below:
> >=20
> > UBIFS error (pid 245): ubifs_read_node: bad node type (255=20
> but expected 2)
> > UBIFS error (pid 245): ubifs_read_node: bad node at LEB 73:456392
> > UBI error: ubi_io_read: error -74 while reading 64 bytes=20
> from PEB 3:0, read 64 bytes
>=20
> Well, here I already see that the problem is on driver level because I
> cannot read data. Also, if your driver prints an error message in case
> of an uncorrectable ECC errors, this could help.

That's probably the easiest solution.

>=20
> > UBI warning: ubi_eba_init_scan: cannot reserve enough PEBs=20
> for bad PEB handling,
> >  reserved 17, need 19
> > UBI warning: ubi_eba_copy_leb: error -74 while reading data=20
> from PEB 3
> > UBI error: wear_leveling_worker: error -74 while moving PEB=20
> 3 to PEB 2
> > UBI warning: ubi_ro_mode: switch to read-only mode
> > UBI error: do_work: work failed with error code -74
> > UBI error: ubi_thread: ubi_bgt0d: work failed with error code -74
> > UBI error: ubi_io_read: error -74 while reading 516096=20
> bytes from PEB 3:8192, re
> > ad 516096 bytes
> > UBIFS error (pid 1): ubifs_scan: corrupt empty space at LEB 1:8192
> > UBIFS error (pid 1): ubifs_scanned_corruption: corrupted=20
> data at LEB 1:8192
> > UBIFS error (pid 1): ubifs_scan: LEB 1 scanning failed
> > UBI error: ubi_io_read: error -74 while reading 516096=20
> bytes from PEB 3:8192, read 516096 bytes
> > UBIFS error (pid 1): ubifs_recover_master_node: failed to=20
> recover master node
>=20
> ... snip ...
>=20
> > A better error message would say something like:
> > "UBI error: Data page incorrectly programmed to all 0xFFs=20
> with non-0xFF ECC."
>=20
> Probably, but that would happen only if you have debugging checks
> enabled, right?

Right.

>=20
> > Another suggestion is rather than creating large files=20
> stuffed with 0xFF pads the=20
> > end of some of the blocks, to have a ubinize option which=20
> creates a download header=20
> > in front of each block with block length and valid data=20
> length. Then the 0xFF's=20
> > wouldn't have to be carried around and the user would be=20
> less likely to program=20
> > 0xFF's by mistake. They would typically only program the=20
> useful data that is in=20
> > the file instead, and since they erased the block to=20
> program, the trailing 0xFFs
> > would be taken care of automatically. Of course, this would=20
> require custom flasher
> > changes to accommodate. Thanks.
>=20
> It is doable, but I can predict then other people will=20
> complain why the
> hack they cannot use simple nandwrite when flashing UBI=20
> images. And for
> many people who have HW which has no problems with writing=20
> 0xFFs - plane
> nandwrite is usable.

This is for an embedded system in which we serial download
initially, and then upgrade block by block over the network via ethernet
or wireless, so we don't use nandwrite at this time. I wasn't suggesting=20
changing the default behaviour of ubinize, just adding a=20
switch for embedded types and also to avoid accidental programming
of these regions. However, if it's too confusing, then  it may not be worth=
 it.

>=20
> But how much 0xFFs are there are? There should not be that=20
> many. We pad
> special areas like the UBIFS log, the UBI volume table, the=20
> UBIFS lprops
> area, the UBIFS master area with 0xFF, but that is it. Your _data_,
> i.e., the FS contents is not "stuffed with 0xFFs", it is only those
> special UBIFS areas.

Yes it is only special UBIFS areas.

It is a bigger problem with 512K erase blocks. In this case, my
6MB jffs2 image grows to over 14MB ubifs image due to padding. There are ab=
out 12=20
partial blocks with little data in the first few pages, and about 4 partial=
=20
blocks at the end. 16 partial blocks is about 8 MB of overhead on 6MB of
real content.=20

>=20
> So, does it really worth doing what you have suggested?=20
> Skipping 0xFFed
> works just fine. Will the images be really much smaller?

See above. Thanks.

Darwin

>=20
> --=20
> Best Regards,
> Artem Bityutskiy (=E1=D2=D4=A3=CD =E2=C9=D4=C0=C3=CB=C9=CA)
>=20
>=20
> =
