Received: from pop.scorch.co.nz ([203.167.210.162] helo=firstline.co.nz)
	by pentafluge.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IhsPo-00013F-0t
	for linux-mtd@lists.infradead.org; Tue, 16 Oct 2007 20:49:23 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: Re: mtd support for large NAND
Date: Wed, 17 Oct 2007 08:47:46 +1300
References: <200710110911.58596.manningc2@actrix.gen.nz>
	<49eab5c80710120136m557b0df1ye3bd4e04d345d222@mail.gmail.com>
	<20071016104727.GH583@lazybastard.org>
In-Reply-To: <20071016104727.GH583@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200710170847.46250.manningc2@actrix.gen.nz>
Cc: falls huang <falls.huang@gmail.com>,
	=?utf-8?q?J=C3=B6rn_Engel?= <joern@logfs.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 16 October 2007 23:47:27 J=C3=B6rn Engel wrote:
> On Fri, 12 October 2007 16:36:09 +0800, falls huang wrote:
> >   How can I simulate a large nandflash(>4G) in linux PC ? I want to
> > take a look at it, but I don't have any develop-board that has 4G
>
> Something like this would work:
>
> $ truncate 5GiB foo
> $ qemu -s -no-kqemu -hda rootfs -hdb foo -kernel arch/i386/boot/bzImage \
>        -append "ro root=3D/dev/hda block2mtd.block2mtd=3D/dev/hdb"
>
> Instead of truncate you can also use dd:
> $ dd if=3D/dev/zero of=3Dfoo bs=3D1 seek=3D5368709119

Plus modifying mtd to handle partitions greater than the u32 size limit.

=2D- Charles
