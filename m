Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L7X0Z-0003c4-Gr
	for linux-mtd@lists.infradead.org; Tue, 02 Dec 2008 15:17:52 +0000
Subject: RE: UBIFS error CRC calculation on avr32 CPU
From: Artem Bityutskiy <dedekind@infradead.org>
To: Eirik Aanonsen <eaa@wprmedical.com>
In-Reply-To: <2DE39384A09B744FA1E53FD4BF78D430535E42@dware1013.doorway.loc>
References: <f17812d70811301949s6dc4bcddt791822f8d4ff223c@mail.gmail.com>
	<2DE39384A09B744FA1E53FD4BF78D430535DE3@dware1013.doorway.loc>
	<1228207463.5029.15.camel@sauron>
	<2DE39384A09B744FA1E53FD4BF78D430535E42@dware1013.doorway.loc>
Content-Type: text/plain; charset=utf-8
Date: Tue, 02 Dec 2008 17:15:33 +0200
Message-Id: <1228230933.13686.8.camel@sauron>
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

On Tue, 2008-12-02 at 13:59 +0100, Eirik Aanonsen wrote:
> Here is the result from the actual move:
> ----------------------------------------
>=20
> /mnt/slave # mv wpr_004.wfp ../master/
> UBIFS error (pid 529): ubifs_check_node: bad CRC: calculated 0x7dc26ea1, =
read 0x3f225006
> UBIFS error (pid 529): ubifs_check_node: bad node at LEB 184:236208
> Call trace:
>  [<90010694>] dump_stack+0x18/0x20
>  [<c0a5cde8>] ubifs_check_node+0x210/0x23c [ubifs]
>  [<c0a5cfe6>] ubifs_read_node+0x1d2/0x2d8 [ubifs]
>  [<c0a776bc>] ubifs_tnc_read_node+0x70/0x170 [ubifs]
>  [<c0a609a2>] ubifs_tnc_lookup+0x8a/0xb0 [ubifs]
>  [<c0a54c64>] do_readpage+0x1c8/0x434 [ubifs]
>  [<c0a54edc>] ubifs_readpage+0xc/0x18 [ubifs]
>  [<900352a4>] generic_file_aio_read+0x2dc/0x47c
>  [<9004b794>] do_sync_read+0x88/0xb4
>  [<9004bb4c>] vfs_read+0x62/0x8e
>  [<9004bcf2>] sys_read+0x2a/0x48
>  [<9000c132>] syscall_return+0x0/0x12
>=20
> UBIFS error (pid 529): ubifs_read_node: expected node type 1
> UBIFS error (pid 529): do_readpage: cannot read page 1074 of inode 34246,=
 error -117
> mv: read error: Input/output error
> /mnt/slave #
>=20

It looks like you indeed have corrupted data. Where the 'wpr_004.wfp'
file comes from? You wrote it previously? Or you used mkfs.ubifs?

> UBIFS warning (pid 500): mount_ubifs: 'LZO' compressor is set by superblo=
ck, but not compiled in

Hmm. Why you do not enable LZO compressor? How did you
create your file-system?

Also, did you try to enable UBIFS and UBI extra self-checks? Please,
try. Things will become very slow then, though, but this may give
some useful information.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
