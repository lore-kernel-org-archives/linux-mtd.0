Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dzin1-0005Lo-43
 for linux-mtd@lists.infradead.org; Wed, 04 Oct 2017 12:28:41 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Ryan Meulenkamp <Ryan.Meulenkamp@nedap.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: Shrink UBIFS
Date: Wed, 04 Oct 2017 14:28:46 +0200
Message-ID: <12883157.QBeLzUQkuA@blindfold>
In-Reply-To: <1507119835666.14660@nedap.com>
References: <1506598982834.31024@nedap.com>
 <1506932833.14367.529.camel@gmail.com> <1507119835666.14660@nedap.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Mittwoch, 4. Oktober 2017, 14:23:56 CEST schrieb Ryan Meulenkamp:
> So, I stranded on the following: after performing the resize action,
> I get a nice strain of errors telling me that the node type is bad:
> (255 but expected <1 to 9>). I suspect this is because the block is
> erased but UBIFS did not expect it to be. Is this a problem with
> garbage collection of the index nodes? I don't understand how
> index nodes are garbage collected, and where they end up.

How can we know? :-)

But yes, seems like an UBIFS structure points to an erased region.

Thanks,
//richard

-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
