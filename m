Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eOSo2-0001zA-DY
 for linux-mtd@lists.infradead.org; Mon, 11 Dec 2017 18:28:00 +0000
From: Richard Weinberger <richard@nod.at>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH] UBI: fastmap: Erase outdated anchor PEBs during attach
Date: Mon, 11 Dec 2017 19:28:03 +0100
Message-ID: <137554412.qvCz3NY3RC@blindfold>
In-Reply-To: <20171205150120.26045-1-s.hauer@pengutronix.de>
References: <20171205150120.26045-1-s.hauer@pengutronix.de>
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

Am Dienstag, 5. Dezember 2017, 16:01:20 CET schrieb Sascha Hauer:
> The fastmap update code might erase the current fastmap anchor PEB
> in case it doesn't find any new free PEB. When a power cut happens
> in this situation we must not have any outdated fastmap anchor PEB
> on the device, because that would be used to attach during next
> boot.
> The easiest way to make that sure is to erase all outdated fastmap
> anchor PEBs synchronously during attach.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
