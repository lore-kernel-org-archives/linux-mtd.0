Received: from mail.davidb.org ([66.93.32.219])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J9xo5-0007HG-GV
	for linux-mtd@lists.infradead.org; Wed, 02 Jan 2008 07:14:38 +0000
Date: Tue, 1 Jan 2008 23:11:14 -0800
From: David Brown <davidb@davidb.org>
To: Nancy <nancydreaming@gmail.com>
Subject: Re: Does UBI support MLC nand flash?
Message-ID: <20080102071114.GA9207@old.davidb.org>
References: <bae050c10801011742s762cd289ta9aae5881e294598@mail.gmail.com>
	<002601c84cfa$7886bc10$1fa9580a@swcenter.sec.samsung.co.kr>
	<bae050c10801012213p2c7d630r6efcf5c1f77b78df@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <bae050c10801012213p2c7d630r6efcf5c1f77b78df@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 02, 2008 at 02:13:07PM +0800, Nancy wrote:

>I notice mtd-utils "nandwrite.c" does write each page's oob area
>twice, write oob(filesystem area) once, and then call "pwrite" to
>write pagedata including oob (ecc part). I don't think that will work
>right on MLC nand.

The underlying driver will have to support cached writes for this to work.
It's listed as a TODO in nand_base.c, at least in the stable kernel.

Dave
