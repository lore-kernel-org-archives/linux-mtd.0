Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIOXT-00059V-36
 for linux-mtd@lists.infradead.org; Thu, 23 Jul 2015 22:00:27 +0000
Received: by padck2 with SMTP id ck2so2702119pad.0
 for <linux-mtd@lists.infradead.org>; Thu, 23 Jul 2015 15:00:05 -0700 (PDT)
Date: Thu, 23 Jul 2015 15:00:01 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Andrea Scian <rnd4@dave-tech.it>, beanhuo@micron.com
Cc: beanhuo@micron.com, Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: nand: use a lower value for badblockbits when
 working with MLC NAND
Message-ID: <20150723220001.GF8876@google.com>
References: <1425643938-24749-1-git-send-email-rnd4@dave-tech.it>
 <1425643938-24749-2-git-send-email-rnd4@dave-tech.it>
 <20150315100752.3458ccfe@bbrezillon>
 <551E8D21.7050507@dave-tech.it> <55B15BA6.5050600@dave-tech.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55B15BA6.5050600@dave-tech.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 23, 2015 at 11:24:54PM +0200, Andrea Scian wrote:
> Il 21/07/2015 16:50, Bean Huo 霍斌斌 (beanhuo) ha scritto:
> > Hi,
> > What is status of this patch? I think 4 bits is make sense for all
> > MLC nand,
> > Bit flips on bad block mark should not be regarded as a bad block.
> >
> 
> I think that there was something wrong with your email, because I
> didn't see it in MTD ML archives, probably it has been blocked for
> some reason.

X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers

I would let it through the moderation filter, but it would screw with
everybody's threading, and the entire contents are there in the quote
anyway.

Bean: please fix your mailer.

Regards,
Brian
