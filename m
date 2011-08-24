Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QwDCA-0004M0-Kl
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2011 13:08:39 +0000
Received: by gxk2 with SMTP id 2so1025270gxk.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Aug 2011 06:08:31 -0700 (PDT)
Subject: Re: [PATCH 1/5] mtd: do not assume oobsize is power of 2
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 24 Aug 2011 16:10:18 +0300
In-Reply-To: <1314145056-5233-1-git-send-email-computersforpeace@gmail.com>
References: <1314145056-5233-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314191425.9480.274.camel@sauron>
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

On Tue, 2011-08-23 at 17:17 -0700, Brian Norris wrote:
> Previous generations of MTDs all used OOB sizes that were powers of 2,
> (e.g., 64, 128). However, newer generations of flash, especially NAND,
> use irregular OOB sizes that are not powers of 2 (e.g., 218, 224, 448).
> This means we cannot use masks like "mtd->oobsize - 1" to assume that we
> will get a proper bitmask for OOB operations.
> 
> These masks are really only intended to hide the "page" portion of the
> offset, leaving any OOB offset intact, so a masking with the writesize
> (which *is* always a power of 2) is valid and makes more sense.
> 
> This has been tested for read/write of NAND devices (nanddump/nandwrite)
> using nandsim and actual NAND flash.
> 
> Cc: stable@kernel.org [2.6.30+]
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

I removed -stable Cc, because this is not a bug-fix, and I feel this is
a bit risky for -stable. And pushed, thanks.

Pushed also all the other patches, and amended the MEMOOBSEL removal
patch.

-- 
Best Regards,
Artem Bityutskiy
