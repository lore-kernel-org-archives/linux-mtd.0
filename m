Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SkJVR-0007i7-FO
 for linux-mtd@lists.infradead.org; Thu, 28 Jun 2012 18:31:54 +0000
Received: by wgbds1 with SMTP id ds1so1725037wgb.18
 for <linux-mtd@lists.infradead.org>; Thu, 28 Jun 2012 11:31:51 -0700 (PDT)
Date: Thu, 28 Jun 2012 21:31:46 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [RFC] nand_btt : use nand chip->block_bad
Message-ID: <20120628213146.7d929204@halley>
In-Reply-To: <1340898442-1585-1-git-send-email-matthieu.castet@parrot.com>
References: <1340898442-1585-1-git-send-email-matthieu.castet@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Matthieu,

On Thu, 28 Jun 2012 17:47:22 +0200 Matthieu CASTET <matthieu.castet@parrot.com> wrote:
>  	for (i = startblock; i < numblocks;) {
>  		int ret;
>  
>  		BUG_ON(bd->options & NAND_BBT_NO_OOB);
>  
> -		if (bd->options & NAND_BBT_SCANALLPAGES)
> -			ret = scan_block_full(mtd, bd, from, buf, readlen,
> -					      scanlen, len);
> -		else
> -			ret = scan_block_fast(mtd, bd, from, buf, len);
> -
> +		ret = this->block_bad(mtd, from, 1);
>  		if (ret < 0)
>  			return ret;
>  

Hmm, seems elegant, nand_bbt is not supposed to be elegant, what are we
missing here? ;-))

- I think nand_chip ops are not supposed to be called directly from
  outside nand driver (nand_base et al); instead the mtd interfaces
  should be used.
  OTOH, one might consider nand_bbt to be part of nand_base driver...

- The new scheme lacks the potential error correction offered by the
  mtd_read_oob call (invoked from the original scan functions).
  OTOH, currently, AFAIK, it is only offered by an out-of-tree driver.

- The original scheme allows validating against an arbitrary
  nand_bbt_descr, whereas 'block_bad' reads the 'badblockpos' byte.
  Don't know if this is a real issue (need to look at the descriptors
  used); and probably, 'block_bad' can be augmented to use a given
  descriptor.

- To preserve all functionality, we need to augment 'block_bad'
  implementors to support NAND_BBT_SCANALLPAGES (e.g. nand_block_bad
  lacks this).

And maybe there are some more nand_bbt secrets...

Regards,
Shmulik
