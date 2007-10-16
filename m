Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Ihsd5-0001xc-V7
	for linux-mtd@lists.infradead.org; Tue, 16 Oct 2007 21:03:06 +0100
Date: Tue, 16 Oct 2007 21:55:22 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Charles Manning <manningc2@actrix.gen.nz>
Subject: Re: mtd support for large NAND
Message-ID: <20071016195521.GN583@lazybastard.org>
References: <200710110911.58596.manningc2@actrix.gen.nz>
	<49eab5c80710120136m557b0df1ye3bd4e04d345d222@mail.gmail.com>
	<20071016104727.GH583@lazybastard.org>
	<200710170847.46250.manningc2@actrix.gen.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200710170847.46250.manningc2@actrix.gen.nz>
Cc: falls huang <falls.huang@gmail.com>,
	=?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 17 October 2007 08:47:46 +1300, Charles Manning wrote:
> On Tuesday 16 October 2007 23:47:27 Jörn Engel wrote:
> > On Fri, 12 October 2007 16:36:09 +0800, falls huang wrote:
> > >   How can I simulate a large nandflash(>4G) in linux PC ? I want to
> > > take a look at it, but I don't have any develop-board that has 4G
> >
> > Something like this would work:
> >
> > $ truncate 5GiB foo
> > $ qemu -s -no-kqemu -hda rootfs -hdb foo -kernel arch/i386/boot/bzImage \
> >        -append "ro root=/dev/hda block2mtd.block2mtd=/dev/hdb"
> >
> > Instead of truncate you can also use dd:
> > $ dd if=/dev/zero of=foo bs=1 seek=5368709119
> 
> Plus modifying mtd to handle partitions greater than the u32 size limit.

I believe Falls Huang wanted to do just that and needed a test setup.
But I may be wrong.

Jörn

-- 
Linux [...] existed just for discussion between people who wanted
to show off how geeky they were.
-- Rob Enderle
