Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0WNT-00042x-53
 for linux-mtd@lists.infradead.org; Tue, 18 Apr 2017 16:53:21 +0000
Received: by mail-wm0-x232.google.com with SMTP id r190so2222035wme.1
 for <linux-mtd@lists.infradead.org>; Tue, 18 Apr 2017 09:52:58 -0700 (PDT)
Subject: Re: [PATCH 10/10] mtd: spi-nor: aspeed: optimize read mode
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
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
 <a99e6d1e-2dd2-5672-3ff5-adaea69bee75@kaod.org>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Joel Stanley <joel@jms.id.au>,
 Rob Herring <robh+dt@kernel.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <a0b54c9f-a3b9-ee30-1fb2-6cb0a36b2eef@gmail.com>
Date: Tue, 18 Apr 2017 18:51:39 +0200
MIME-Version: 1.0
In-Reply-To: <a99e6d1e-2dd2-5672-3ff5-adaea69bee75@kaod.org>
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

On 04/18/2017 05:46 PM, Cédric Le Goater wrote:
> On 04/15/2017 12:42 AM, Benjamin Herrenschmidt wrote:
>> On Sat, 2017-04-15 at 00:25 +0200, Marek Vasut wrote:
>>> That sounds like a good option, yes. And if it's just forcing fixed
>>> speed, that's awesome, but I think there are more values that might need
>>> to be passed ... I think that's what Cedric can answer.
>>
>> Yes, fixed and delay. Not a huge deal.
> 
> Do we really need to specify the delays in the DT ? As we loop on 
> the different delay settings, if a setting is bogus, we can just 
> pick the following HCLK divider. No ? I don't think it is worth 
> adding black magic properties like this in the DT. We never had to 
> tune it manually AFAICT and anyway, we can always add that later 
> if needed. 
> 
> So, that would leave two properties :
> 
>   - safe divider for "normal/write/erase" commands
>   - speedy divider for "read" commands
> 
> If the property is not present, we would keep the low HW default, 
> which is /16. 
> 
> If there is such a property, the divider value would be considered 
> as a max. The range should be 1..5. Let's introduce "literal" values 
> like "min" and "max" for 1 and 5 ?  

Can we use the spi max frequency which is a standard property and be
done with it ?

> Do we care for the other HCLK settings < 5 for which we can not set
> any delay ?  

I cannot tell, you're the expert :)

>> Also a module parameter makes it hard to specify different settings for
>> different instances of the device/flash. IE, there can be multiple
>> flash controllers and each of them can have multiple chip selects.
>>
>> The DT is the only sane way for that.
> 
> Yes. Can we keep the global module parameter as a global chicken 
> switch to deactivate the algo ? It could be useful, some chips tend
> to freak out when hammered on a bit too much. 

Can we also use the spi-max-frequency here somehow ?

> Thanks,
> 
> C.
> 
> 
>>>> That becomes akin to what we do with Ethernet PHYs for example :)
>>>
>>> Even better, I recall seeing some speed DT props in the SPI binding
>>> docs, so we already have those in place.
>>
>> Right though the gate delay is rather IP block specific but that's
>> not a huge issue.
>>
>> Cheers,
>> Ben.
>>
> 


-- 
Best regards,
Marek Vasut
