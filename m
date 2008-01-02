Received: from mail.davidb.org ([66.93.32.219])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J9xpo-0007Jp-Nn
	for linux-mtd@lists.infradead.org; Wed, 02 Jan 2008 07:16:16 +0000
Date: Tue, 1 Jan 2008 23:13:06 -0800
From: David Brown <mtd@davidb.org>
To: Nancy <nancydreaming@gmail.com>
Subject: Re: Does UBI support MLC nand flash?
Message-ID: <20080102071306.GA10292@old.davidb.org>
References: <bae050c10801011742s762cd289ta9aae5881e294598@mail.gmail.com>
	<002601c84cfa$7886bc10$1fa9580a@swcenter.sec.samsung.co.kr>
	<bae050c10801012213p2c7d630r6efcf5c1f77b78df@mail.gmail.com>
	<bae050c10801012219m71d7415du4379e5b5d5a54560@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <bae050c10801012219m71d7415du4379e5b5d5a54560@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 02, 2008 at 02:19:16PM +0800, Nancy wrote:
>oh, forgot to metion UBI.
>UBI has two headers for each LED/PED, they are not write at same time.
>Is that against MLC nand's no ramdom write and  write only once
>permission?

Yes.  Perhaps one could be written at the beginning of the block and one
always written at the end of the block.  It wastes more pages that way,
though.

If the second write is only to indicate that the block is invalid, it
_might_ be permissible to write it out of order, since the out of order
write might only corrupt data.  Depending on underlying device
implementation, it might also just not work, though.

Dave
