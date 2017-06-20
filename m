Received: from 16.mo6.mail-out.ovh.net ([87.98.139.208])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNRkA-0005Xn-2N
 for linux-mtd@lists.infradead.org; Tue, 20 Jun 2017 22:35:32 +0000
Received: from player774.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 51BA3ED796
 for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2017 00:35:06 +0200 (CEST)
Subject: Re: [PATCH 3/4] mtd: spi-nor: aspeed: configure chip window on AHB bus
To: Marek Vasut <marek.vasut@gmail.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>
References: <1492689397-4704-1-git-send-email-clg@kaod.org>
 <1492689397-4704-4-git-send-email-clg@kaod.org>
 <1ef778ad-30e1-d80a-aaf9-e987c9e23fed@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <69c382da-8e6a-dc1f-45cd-540bd2885826@wedev4u.fr>
Date: Wed, 21 Jun 2017 00:34:58 +0200
MIME-Version: 1.0
In-Reply-To: <1ef778ad-30e1-d80a-aaf9-e987c9e23fed@gmail.com>
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

Le 20/04/2017 à 15:30, Marek Vasut a écrit :
> On 04/20/2017 01:56 PM, Cédric Le Goater wrote:
>> The segment registers of the SMC controller provide a way to configure
>> the mapping windows of the chips on the AHB bus. The settings are
>> required to be correct when the controller operates in Command mode,
>> which is the case for DMAs and the LPC mapping.
>>
>> This tries to set the segment registers of each chip depending on the
>> size of the flash device and depending on the previous segment
>> settings, in order to have a contiguous window across multiple chips.
>>
>> Unfortunately, the AST2500 SPI controller has a bug and it is not
>> possible to configure a full 128MB window for a chip of the same
>> size. The window size needs to be restricted to 120MB. This issue only
>> applies to CE0.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>
> 

Applied to the spi-nor/next branch of l2-mtd

Thanks!
