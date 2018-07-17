Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffWRU-0007Cb-HI
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 20:19:29 +0000
Received: by mail-lj1-x241.google.com with SMTP id y17-v6so2086127ljy.8
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jul 2018 13:19:18 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Shreeya Patel <shreeya.patel23498@gmail.com>,
 Arvind Yadav <arvind.yadav.cs@gmail.com>, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3] mtd: rawnand: ams-delta: use GPIO lookup table
Date: Tue, 17 Jul 2018 22:20:00 +0200
Message-ID: <1706255.htvcsQMCeE@z50>
In-Reply-To: <20180717213736.3cd0a747@bbrezillon>
References: <20180525222046.11200-1-jmkrzyszt@gmail.com>
 <20180709193850.20191-1-jmkrzyszt@gmail.com>
 <20180717213736.3cd0a747@bbrezillon>
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

Hi Boris,

On Tuesday, July 17, 2018 9:37:36 PM CEST Boris Brezillon wrote:
> ...
> Sorry, but we can't apply this patch now because of the dependency on
> those 2 commits. I guess it's not a big issue if we defer it to 4.20.
> Alternatively, we could consider queuing it to mtd/fixes after 4.19-rc1
> is out, but we'll need a good reason to do that (like a regression
> that this patch is supposed to fix). Note for your future contributions:
> for this kind of cross-subsystem changes, it's better to let everything
> go through a single tree (usually done by sending all patches in a
> single series and explaining the dependencies between the patches in
> the cover letter),

Good advice, Sine I have in my queue a patch for OMAP that depends on this 
one, and still another one with the same dependency issues, I'll take the path 
you suggest and resend those three as a series to be merged via OMAP.

Thanks,
Janusz
