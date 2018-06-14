Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTMhm-00046V-4r
 for linux-mtd@lists.infradead.org; Thu, 14 Jun 2018 07:30:04 +0000
From: Richard Weinberger <richard@nod.at>
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: dedekind1@gmail.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 2/2] ubi: introduce ubi.nocheck parameter to skip CRC
 check when attaching ubi vol
Date: Thu, 14 Jun 2018 09:29:42 +0200
Message-ID: <1588647.N1yrutfcI7@blindfold>
In-Reply-To: <20180611102037.n5kkdq4mcoixmvti@qschulz>
References: <95e04a201ac4ef82e68ce8e0c4f548b193e51b55.1524214122.git-series.quentin.schulz@bootlin.com>
 <2085970.qGmQXvoWho@blindfold> <20180611102037.n5kkdq4mcoixmvti@qschulz>
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

Quentin,

Am Montag, 11. Juni 2018, 12:20:37 CEST schrieb Quentin Schulz:
> If we go for a per-image flag, adding nocheck to the ioctl makes sense,
> otherwise we have to find a way to select only one or more volumes for
> which the nocheck flag should be set. That being said, I'm not sure a
> per-image flag is the way we want to go.
> 
> What are your thoughts on this?

I like that approach a lot more, please send a patch. :-)
Having a volume flag will reduce complexity a lot.

Thanks,
//richard
