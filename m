Received: from wa-out-1112.google.com ([209.85.146.178])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JA05x-0000b9-5A
	for linux-mtd@lists.infradead.org; Wed, 02 Jan 2008 09:41:05 +0000
Received: by wa-out-1112.google.com with SMTP id v33so9016004wah.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 Jan 2008 01:37:10 -0800 (PST)
Message-ID: <bae050c10801020137t141ceaf7i19ba5297411feb7c@mail.gmail.com>
Date: Wed, 2 Jan 2008 17:37:09 +0800
From: Nancy <nancydreaming@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: Does UBI support MLC nand flash?
In-Reply-To: <bae050c10801020136s4a6c95a2h9826479f27a75503@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10801011742s762cd289ta9aae5881e294598@mail.gmail.com>
	<002601c84cfa$7886bc10$1fa9580a@swcenter.sec.samsung.co.kr>
	<bae050c10801012213p2c7d630r6efcf5c1f77b78df@mail.gmail.com>
	<003c01c84d10$9cb210b0$1fa9580a@swcenter.sec.samsung.co.kr>
	<bae050c10801020133h3b121b2ft47911a0d84921868@mail.gmail.com>
	<bae050c10801020136s4a6c95a2h9826479f27a75503@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thank you, Mr. Kyungmin Park
But we do not use JFFS2, if UBI supports MLC nand well, we decide to
use UBIFS instead of current YAFFS2.

We use "nandwrite" for nandflash content's burning. That's more faster
and easiser than do the same job under filesystem support(mount, cp
....)

MTD code change a lot in 2.6 kernel. In old verion of MTD, we added a
MEMWRITEPAGE ioctl to call nand_write_ecc(nand_base.c) whose parameter
"eccbuf" can be offered for fs use. But in the latest version of MTD
code, I can't find a function call meet our needs.

If UBI do not support MLC, we will still use our old one. Faking VFAT
fs info( erase count and virtual block number) must write to oob area,
and ...that's MLC nand, nandwrite.c have to be change.

Oh, MLC nand's badblock tag is  in the last page of earseblock's oob.
some related code have to be changed too.

I write this only for the interface designer reconsider it.

Thanks for all the people who reply me :-)
