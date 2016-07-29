Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bT3W5-0002NS-Pn
 for linux-mtd@lists.infradead.org; Fri, 29 Jul 2016 08:51:38 +0000
Subject: Re: [PATCH] UBI: Fix null pointer on error log
To: Camille Constans <camille.constans@parrot.com>, dedekind1@gmail.com,
 dwmw2@infradead.org, computersforpeace@gmail.co,
 linux-mtd@lists.infradead.org
References: <1469781852-12253-1-git-send-email-camille.constans@parrot.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <579B1901.9080004@nod.at>
Date: Fri, 29 Jul 2016 10:51:13 +0200
MIME-Version: 1.0
In-Reply-To: <1469781852-12253-1-git-send-email-camille.constans@parrot.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Camille,

Am 29.07.2016 um 10:44 schrieb Camille Constans:
> It fixes UBI: Extend UBI layer debug/messaging capabilities
> As with this commit ubi_err macro is now:
> 
> #define ubi_err(ubi, fmt, ...) pr_err("UBI-%d error: %s: " fmt "\n", \
> 				      ubi->ubi_num, __func__, ##__VA_ARGS__)
> 
> It leads to a null pointer when used before allocating ubi.

sorry but a fix for this is already queued:
http://www.spinics.net/lists/stable/msg137428.html

Thanks,
//richard
