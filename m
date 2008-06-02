Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K33Lu-0007xm-HX
	for linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 06:17:06 +0000
Subject: Re: ubifs, ubiblk(formatted with vfat) and yaffs2 test
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <bae050c10806012229n78668cf3rf71c44bd396a7fba@mail.gmail.com>
References: <bae050c10806012229n78668cf3rf71c44bd396a7fba@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Jun 2008 09:18:17 +0300
Message-Id: <1212387497.31023.172.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Fixed abused mail subject]

On Mon, 2008-06-02 at 13:29 +0800, Nancy wrote:
>     Thank you for sharing your test report!
>     For ubiblk,  cp; sync;  is not enough, cause ubiblk hold back a LEB
> in ram until another logical block number LEB wants to use the
> writecache(in ubiblk) or an block device layer "release" call will
> drive the LEB in writecache to be written on Nand Flash.
>     For FAT, when it write some files, usually, it modify FAT table
> first, then goes the file contends, finally still need to change
> something in FAT table or whatever it is which belongs to the
> Filesystem meta data. That means, the last LEB hold back in ram
> contains the most important data (filesystem meta data). If there
> comes unclean reboot. That may lost lots of data. Though UBI tolerant
> unclean reboot. In this case, you should use tool "dosfsck
> /dev/ubiblockN -a" before you mount ubiblock again. And see what you
> have lost!
>     To be safe, you should do : cp...; sync; flushcache /dev/ubiblockN
>     I'm not sure block device layer's Ioctl "BLKFLSBUF" use in this
> way. Is there any command like sync, not just sync the buffer cache,
> but also the buffer in dirver layer( call that ioctl :-)

Sorry, but these things are absolutely unacceptable and mean your
implementation is broken.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
