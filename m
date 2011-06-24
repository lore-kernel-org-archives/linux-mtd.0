Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qa5AH-0004HY-Fs
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 12:07:14 +0000
Received: by bwz1 with SMTP id 1so2932052bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2011 05:07:08 -0700 (PDT)
Subject: Re: mkfs.jffs2 min erase block size: 4 vs 8 KiB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 24 Jun 2011 15:07:02 +0300
In-Reply-To: <BANLkTi=G+HxWtLgj6wUSQAY1FfjTFC8JjQ@mail.gmail.com>
References: <BANLkTi=G+HxWtLgj6wUSQAY1FfjTFC8JjQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1308917226.7715.6.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-22 at 01:02 -0400, Mike Frysinger wrote:
> the current mkfs.jffs2 util has in its --eraseblock handling:
> /* If it's less than 8KiB, they're not allowed */
> if (erase_block_size < 0x2000) {
>     fprintf(stderr, "Erase size 0x%x too small. Increasing to 8KiB minimum\n",
>         erase_block_size);
>     erase_block_size = 0x2000;
> }
> 
> but i cant seem to find documentation on where this comes from.  it's
> not uncommon to have SPI flashes with 4KiB erase sectors, and removing
> this sanity check and allowing 4 KiB seems to produce an image that
> works OK.
> 
> am i missing something ?  or should i send a patch to drop this check ?

I do not believe JFFS2 is able to work with such small erase blocks. In
JFFS2 (and in UBIFS as well) an eraseblock is the basic garbage
collection unit, and nodes cannot cross eraseblock boundaries. And the
maximum node size is 4KiB of data plus few bytes of node header. So 4KiB
won't even fit the largest data node, e.g., containing uncompressible
data.

Even 8KiB is bad, because the amount of wasted space will be large -
JFFS2 will waste the rest of the eraseblock if it does not fit the node.
So the smaller EB is, the more wasted space you have.

For SPI flashes the way out is to emulate larger eraseblock sizes on MTD
level. I'd recommend at least 32 KiB.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
