Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fKJWw-0003iN-UT
 for linux-mtd@lists.infradead.org; Sun, 20 May 2018 08:17:29 +0000
From: Richard Weinberger <richard@nod.at>
To: Stefan M Schaeckeler <sschaeck@cisco.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: mtdoops: optionally dump boottime
Date: Sun, 20 May 2018 10:17:05 +0200
Message-ID: <2141312.dtCrDzBczl@blindfold>
In-Reply-To: <20180520033940.GA35444@sjc-ads-587.cisco.com>
References: <20180520033940.GA35444@sjc-ads-587.cisco.com>
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

Stefan,

Am Sonntag, 20. Mai 2018, 05:39:40 CEST schrieb Stefan M Schaeckeler:
> Optionally dump boottime on the mtd device in the form of
> 
> <0>[   0.000000] Boot time mm/dd/yyyy hh:mm:ss
> 
> Time-stamps of oops messages are in seconds since boottime. Recording also
> the boottime helps correlating oopses with other events having occured at
> the same time. This correlation will be otherwise lost after (multiple)
> reboots.

I get the use-case, but why is this only for mtdoops?
IMHO this needs to go into generic code such that all kmsg dumpers can
benefit from it.

Thanks,
//richard
