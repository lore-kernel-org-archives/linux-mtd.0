Received: from 3.mo6.mail-out.ovh.net ([178.33.253.26])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNR3y-0004z7-A1
 for linux-mtd@lists.infradead.org; Tue, 20 Jun 2017 21:51:57 +0000
Received: from player774.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id C22F0E7EA8
 for <linux-mtd@lists.infradead.org>; Tue, 20 Jun 2017 23:51:20 +0200 (CEST)
Subject: Re: [PATCH v4] spi-nor: Add Winbond w25m512jv
To: Joel Stanley <joel@jms.id.au>, Marek Vasut <marek.vasut@gmail.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-mtd@lists.infradead.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <20170620144843.23913-1-joel@jms.id.au>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <f04265cf-1f70-d54a-2c9e-cbe8b6881953@wedev4u.fr>
Date: Tue, 20 Jun 2017 23:51:15 +0200
MIME-Version: 1.0
In-Reply-To: <20170620144843.23913-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 20/06/2017 à 16:48, Joel Stanley a écrit :
> From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> 
> Similar to the other ones, different size. The "JV" suffix is in
> the datasheet, I haven't seen mentions of a different one.
> 
> The the datasheet indicates DUAL and QUAD are supported.
> 
>  http://www.winbond.com/resource-files/w25m512jv%20revc%2001062017.pdf
> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Applied to the spi-nor/next branch of l2-mtd

Thanks!
