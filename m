Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctJpS-0006tp-D7
 for linux-mtd@lists.infradead.org; Wed, 29 Mar 2017 20:04:31 +0000
Subject: Re: [RFC][PATCH] UBI: Make MTD_UBI_FASTMAP non-experimental
To: Jesper Nilsson <jesper.nilsson@axis.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20170329153836.GB29118@axis.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <434195d8-d638-240d-8d63-50d033ea453a@nod.at>
Date: Wed, 29 Mar 2017 22:04:00 +0200
MIME-Version: 1.0
In-Reply-To: <20170329153836.GB29118@axis.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jesper,

Am 29.03.2017 um 17:38 schrieb Jesper Nilsson:
> MTD_UBI_FASTMAP has been set as experimental since it
> was merged back in 2012.
> 
> There hasn't been much change in the format,
> so we can consider the feature stable and start
> being careful about breaking the format.
> (This is somewhat of a pre-requisite for anyone actually
> using the feature in the real world and depending on it)
> 
> Drop the experimental note and the warning text about
> the on-flash format not being finalized.

I fully agree, we can drop this note. But we have to add another
one.
While Fastmap is a nice feature to speed-up the attach time it
comes with a cost. It makes UBI less robust. I saw issues
on NAND chips which misbehaved slightly where UBI was able to
recover when using a full scan but not when Fastmap was used.
The UBI full scan code is paranoid and can sort out problems
very early, with Fastmap enabled you lose this valuable property.

So, users should enable Fastmap only when they absolutely need
a very fast attach time and be very sure that the NAND works as
expected.

Thanks,
//richard
