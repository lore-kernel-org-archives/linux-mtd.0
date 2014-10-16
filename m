Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xecun-0000cQ-Mg
 for linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 04:43:54 +0000
Message-ID: <543F4CF0.8080404@free-electrons.com>
Date: Thu, 16 Oct 2014 06:43:28 +0200
From: Michael Opdenacker <michael.opdenacker@free-electrons.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] mtd: orion_nand: fix error code path in probe
References: <1413296198-29486-1-git-send-email-michael.opdenacker@free-electrons.com>
 <20141014213503.GD5331@lunn.ch> <20141015213953.GB23155@arch.hh.imgtec.org>
In-Reply-To: <20141015213953.GB23155@arch.hh.imgtec.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: jg1.han@samsung.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew, Ezequiel,

Many thanks for your review!

On 10/15/2014 11:39 PM, Ezequiel Garcia wrote:
> On 14 Oct 11:35 PM, Andrew Lunn wrote:
>
>> Hi Michael
>>
>> It is quite a common pattern to use:
>>
>>         res = platform_get_resource(dev, IORESOURCE_MEM, 0);
>>         c->membase = devm_ioremap_resource(&dev->dev, res);
>>         if (IS_ERR(c->membase))
>> 	   return PTR_ERR(c->membase)
>>
>> which is more compact.

I like it, thanks for the suggestion!

>>
> Be careful with this. devm_ioremap and devm_ioremap_resource are not
> the same thing, as the former requests the region as well.
>
> It can break things if the region is shared across several drivers.
> I don't think this is the case, so in fact adding the request is correct,
> but it's a more intrusive change than just "code cleanup".

Right. If I understand correctly, requesting the region should always be
done anyway, so this should be a welcome change.

What Andrew suggests also changes the return value: -ENOMEM instead of
-EIO, though it should be more standard. This could have side effects too!

I'll post a V2 right away.

Thanks again!

Cheers,

Michael.

-- 
Michael Opdenacker, CEO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
+33 484 258 098
