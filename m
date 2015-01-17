Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YCZ1h-0004oW-0p
 for linux-mtd@lists.infradead.org; Sat, 17 Jan 2015 19:27:18 +0000
Message-ID: <54BAB774.3010102@nod.at>
Date: Sat, 17 Jan 2015 20:26:44 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: default bitflip-reporting threshold to 75%
 of correction strength
References: <54B38745.70007@atmel.com>	<1421095889-12717-1-git-send-email-computersforpeace@gmail.com>
 <20150117200137.71c1aca0@bbrezillon>
In-Reply-To: <20150117200137.71c1aca0@bbrezillon>
Content-Type: text/plain; charset=windows-1252
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

Am 17.01.2015 um 20:01 schrieb Boris Brezillon:
> Just sharing my experience with MLC NANDs requiring read-retry: the
> number of reported bitflips often raise ecc_strength value (at least
> with the current read-retry approach).
> This patch will definitely make UBI move NAND blocks over and over
> again considering the threshold has been raised and the block is not
> reliable anymore.

Within the last 6 months I had to face a lot of strange UBI/MTD issues.
All showed one "flaw" in UBI, namely that it was designed with good SLC
NANDs in mind.
Even some modern SLC NANDs show bad behavior like read disturb after
less than 100000 reads.
I think it is time to bite the bullet and improve UBI wrt. MLC NAND.
This is not an easy task as it needs some hardware to play with and
time/budget. But I think it is worth the effort.

Thanks,
//richard
