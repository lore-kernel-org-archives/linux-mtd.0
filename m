Received: from smtp20.doorway.no ([212.4.49.47])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MfxE8-0002RY-Nn
	for linux-mtd@lists.infradead.org; Tue, 25 Aug 2009 14:42:28 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Error creating FAT32 over Nand flash
Date: Tue, 25 Aug 2009 16:42:19 +0200
Message-ID: <1DC0FF5051B91B4D88A15F21F1A27F4176B50D@dware1013.doorway.loc>
In-Reply-To: <D6830EA55F9F4A9FBCD742B09BE98D9F@ivan>
References: <6CF41D77BA9F4BC5856D0031BA902A85@ivan>
	<D6830EA55F9F4A9FBCD742B09BE98D9F@ivan>
From: "Eirik Aanonsen" <eaa@wprmedical.com>
To: "Ivan Li" <lijinlei1@163.com>,
	<linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Some progress for it: I found the sector number mentioned in error
> message resides in BAD block.
> Is there any fix for that?
>=20
> ----- Original Message -----....
> > I have some problems with creating FAT32 fs over nand flash.
....

Read up on what filesystems you can use directly on a nand flash:
http://www.linux-mtd.infradead.org/faq/general.html#L_ext2_mtd

Reguards
Eirik Aanonsen
