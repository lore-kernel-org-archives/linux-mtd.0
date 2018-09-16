Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g1f4B-00006y-LS
 for linux-mtd@lists.infradead.org; Sun, 16 Sep 2018 21:58:57 +0000
From: Richard Weinberger <richard@nod.at>
To: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: OpenWrt Development List <openwrt-devel@lists.openwrt.org>,
 linux-mtd@lists.infradead.org
Subject: Re: UBIFS issues within kernel 4.14.69?
Date: Sun, 16 Sep 2018 23:58:42 +0200
Message-ID: <3246931.C87L8AhBv1@blindfold>
In-Reply-To: <14d0c8dc-111d-57e1-e86b-ca28544933b3@ncentric.com>
References: <d3f55a2a-dd98-1bc6-272a-9a7b9a318b76@ncentric.com>
 <1680286.R2LEE90rvs@blindfold>
 <14d0c8dc-111d-57e1-e86b-ca28544933b3@ncentric.com>
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

Am Sonntag, 16. September 2018, 22:11:07 CEST schrieb Koen Vandeputte:
> Hi Richard,
> 
> Apologies for the late reply.
> It was a busy weekend with the kids ..
> 
> I'm very pleased to read you already have a good idea of what is going 
> on here.
> 
> Can I conclude you will provide a patch upstream to revert this specific 
> commit?

Correct.

> Please keep me in CC in case you do, so I can backport it properly into 
> OpenWrt on the next kernel bump. (until it is present in a future stable)

Done.

Thanks,
//richard
