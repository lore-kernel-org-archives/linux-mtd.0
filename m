Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YB1Ts-0003MW-Qz
 for linux-mtd@lists.infradead.org; Tue, 13 Jan 2015 13:26:02 +0000
Message-ID: <54B51CCA.1090707@nod.at>
Date: Tue, 13 Jan 2015 14:25:30 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: default bitflip-reporting threshold to 75%
 of correction strength
References: <54B38745.70007@atmel.com>
 <1421095889-12717-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1421095889-12717-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Steve deRosier <derosier@gmail.com>, Josh Wu <josh.wu@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 12.01.2015 um 21:51 schrieb Brian Norris:
> The MTD API reports -EUCLEAN only if the maximum number of bitflips
> found in any ECC block exceeds a certain threshold. This is done to
> avoid excessive -EUCLEAN reports to MTD users, which may induce
> additional scrubbing of data, even when the ECC algorithm in use is
> perfectly capable of handling the bitflips.
> 
> This threshold can be controlled by user-space (via sysfs), to allow
> users to determine what they are willing to tolerate in their
> application. But it still helps to have sane defaults.
> 
> In recent discussion [1], it was pointed out that our default threshold
> is equal to the correction strength. That means that we won't actually
> report any -EUCLEAN (i.e., "bitflips were corrected") errors until there
> are almost too many to handle. It was determined that 3/4 of the
> correction strength is probably a better default.
> 
> [1] http://lists.infradead.org/pipermail/linux-mtd/2015-January/057259.html

I like this change but I have one question.

UBI will treat a block as bad if it shows bitflips (EUCLEAN) right
after erasure. For SLC NAND this works very well.
Does this also hold for MLC NAND? If one or two bit flips are okay
even for a freshly erased MLC NAND this change could cause UBI to
mark good blocks as bad depending on the ECC strength.

Thanks,
//richard
