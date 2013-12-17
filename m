Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vt2Tq-0003mg-Va
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 21:47:07 +0000
Date: Tue, 17 Dec 2013 18:46:49 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4] mtd/nand: don't use {read,write}_buf for 8-bit
 transfers
Message-ID: <20131217214648.GB8319@localhost>
References: <20131127073512.GB13929@norris.computersforpeace.net>
 <1386278524-25669-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20131217054825.GE12034@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131217054825.GE12034@norris-Latitude-E6410>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Pekon Gupta <pekon@ti.com>, kernel@pengutronix.de,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 16, 2013 at 09:48:25PM -0800, Brian Norris wrote:
[..]
> 
> I don't have a good x16 setup yet, but I believe Ezequiel did some
> testing on v3 (is this a "Tested-by"?). I'll probably try this out on my
> x8 setups when I get a chance sometime this week.
> 

No, I couldn't do a proper test of this one, although I remembered a
tested a branch based on this patch.

The problem was I couldn't find time to figure out how to test the GetFeatures
and SetFeatures command. Hints?

I can try to give it a test this weekend.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
