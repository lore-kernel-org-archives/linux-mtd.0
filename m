Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1czqGN-0001x1-Ry
 for linux-mtd@lists.infradead.org; Sun, 16 Apr 2017 19:55:13 +0000
Received: by mail-wr0-x244.google.com with SMTP id l44so18228117wrc.2
 for <linux-mtd@lists.infradead.org>; Sun, 16 Apr 2017 12:54:51 -0700 (PDT)
Subject: Re: [PATCH 10/10] mtd: spi-nor: aspeed: optimize read mode
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linux-mtd@lists.infradead.org
References: <1491497808-25487-1-git-send-email-clg@kaod.org>
 <1491497808-25487-11-git-send-email-clg@kaod.org>
 <7d80fbb3-81d9-3ac0-6bb9-47d2d4cf0855@gmail.com>
 <e27b9f19-947f-ab72-056d-d71812e69356@kaod.org>
 <6f7f424c-2a3f-4b6d-f7aa-bfae749de0b3@gmail.com>
 <1492206032.25766.7.camel@kernel.crashing.org>
 <26f0d520-bfe3-cc26-d3d5-3185813b7ffb@gmail.com>
 <1492207894.25766.20.camel@kernel.crashing.org>
 <c5d30733-20c8-275a-03b1-9b446b5bcc71@gmail.com>
 <1492209763.25766.27.camel@kernel.crashing.org>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Joel Stanley <joel@jms.id.au>,
 Rob Herring <robh+dt@kernel.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <7e68c652-54d6-e5cb-b261-e201f418954a@gmail.com>
Date: Sun, 16 Apr 2017 20:46:43 +0200
MIME-Version: 1.0
In-Reply-To: <1492209763.25766.27.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/15/2017 12:42 AM, Benjamin Herrenschmidt wrote:
> On Sat, 2017-04-15 at 00:25 +0200, Marek Vasut wrote:
>> That sounds like a good option, yes. And if it's just forcing fixed
>> speed, that's awesome, but I think there are more values that might need
>> to be passed ... I think that's what Cedric can answer.
> 
> Yes, fixed and delay. Not a huge deal.

OK, that works.

> Also a module parameter makes it hard to specify different settings for
> different instances of the device/flash. IE, there can be multiple
> flash controllers and each of them can have multiple chip selects.
> 
> The DT is the only sane way for that.

:-)

>>> That becomes akin to what we do with Ethernet PHYs for example :)
>>
>> Even better, I recall seeing some speed DT props in the SPI binding
>> docs, so we already have those in place.
> 
> Right though the gate delay is rather IP block specific but that's
> not a huge issue.

Yep.

-- 
Best regards,
Marek Vasut
