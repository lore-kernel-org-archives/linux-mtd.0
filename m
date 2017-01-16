Received: from 8.mo5.mail-out.ovh.net ([178.32.116.78])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTAKC-0004rZ-DA
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 16:40:06 +0000
Received: from player760.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 27DD36C93D
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2017 17:39:40 +0100 (CET)
Subject: Re: [PATCH 3/3] mtd: spi-nor: add SPI_NOR_DUAL_READ to mx66l51235l
To: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
References: <1484573225-19095-1-git-send-email-clg@kaod.org>
 <1484573225-19095-4-git-send-email-clg@kaod.org>
 <57b7480d-4b5a-c420-d790-b22445eec723@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Robert Lippert <roblip@gmail.com>, Robert Lippert <rlippert@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <77542f12-781d-73a4-4b72-01a00c5abdd0@kaod.org>
Date: Mon, 16 Jan 2017 17:39:22 +0100
MIME-Version: 1.0
In-Reply-To: <57b7480d-4b5a-c420-d790-b22445eec723@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Marek,

On 01/16/2017 05:15 PM, Marek Vasut wrote:
> On 01/16/2017 02:27 PM, Cédric Le Goater wrote:
>> From: Robert Lippert <roblip@gmail.com>
> 
> 1) Commit message missing
> 2) This is unrelated to the rest of the series, send separately please

ok. I will do that. Rob, I will take ownership if you don't mind.

Thanks,

C.
