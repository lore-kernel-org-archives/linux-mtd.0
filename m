Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L7Qtl-0004Vd-3A
	for linux-mtd@lists.infradead.org; Tue, 02 Dec 2008 08:46:25 +0000
Subject: Re: UBIFS error CRC calculation on avr32 CPU
From: Artem Bityutskiy <dedekind@infradead.org>
To: Eirik Aanonsen <eaa@wprmedical.com>
In-Reply-To: <2DE39384A09B744FA1E53FD4BF78D430535DE3@dware1013.doorway.loc>
References: <f17812d70811301949s6dc4bcddt791822f8d4ff223c@mail.gmail.com>
	<2DE39384A09B744FA1E53FD4BF78D430535DE3@dware1013.doorway.loc>
Content-Type: text/plain; charset=utf-8
Date: Tue, 02 Dec 2008 10:44:23 +0200
Message-Id: <1228207463.5029.15.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: kernel@avr32linux.org, linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-12-01 at 13:33 +0100, Eirik Aanonsen wrote:
> Hi
>=20
> I get this problem running my ubi/ubifs on a partition in my system.
> The error occurs when I try to move one file to a new location and there
> seems to be something wrong with the file. The file contains binary data
> and is 9.3MB large. Can anyone help me locate this error or point me in
> the right direction?
>=20
> My system is a ap7002(arch =3D=3D avr32) with 32MByte SRAM, 8MByte NOR fl=
ash
> and 2GByte NAND flash(ubi).
>=20
> Cmd:
> ----
> /mnt/slave # mv wpr_004.wfp ../master/data/
>=20
> UBIFS error (pid 471): ubifs_check_node: bad CRC: calculated 0x582d0a64,
> read 0x4932021b
> UBIFS error (pid 471): ubifs_check_node: bad node at LEB 159:302512
> UBIFS error (pid 471): ubifs_read_node: expected node type 1
> UBIFS error (pid 471): do_readpage: cannot read page 24 of inode 34213,
> error -117
> mv: read error: Input/output error

Hmm,

could you please enable UBIFS debugging and reproduce this. If there is
no interesting/insighting information, could you please also enable
UBIFS messages and send them. Please, glance here:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
