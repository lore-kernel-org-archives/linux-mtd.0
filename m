Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ceqJr-00034n-I2
 for linux-mtd@lists.infradead.org; Fri, 17 Feb 2017 21:44:01 +0000
Received: by mail-wr0-x242.google.com with SMTP id q39so6494161wrb.2
 for <linux-mtd@lists.infradead.org>; Fri, 17 Feb 2017 13:43:38 -0800 (PST)
Subject: Re: mtd: spi-nor: hisi-sfc compatibility report
To: Marty Plummer <netz.kernel@gmail.com>
References: <20170215040646.hscl2kuc5nuvbel3@tha-monstah.mydomain>
 <e90185e2-db9e-0f1f-df44-1015f8950b36@gmail.com>
 <20170216162854.hagnxukontcgkykn@tha-monstah.mydomain>
Cc: linux-mtd@lists.infradead.org, cyrille.pitchen@atmel.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <77ad543d-3436-0151-c22c-23966cb6f34d@gmail.com>
Date: Fri, 17 Feb 2017 22:28:07 +0100
MIME-Version: 1.0
In-Reply-To: <20170216162854.hagnxukontcgkykn@tha-monstah.mydomain>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/16/2017 05:28 PM, Marty Plummer wrote:
> On Wed, Feb 15, 2017 at 10:05:33PM +0100, Marek Vasut wrote:
>> On 02/15/2017 05:06 AM, Marty Plummer wrote:
>>> Greetings.
>>>
>>> Just wanted to report that the hisi-sfc spi nor driver is compatible
>>> with the Hi3521av100 SoC from Hisilicon. Odd that no hisilicon or huawei
>>> emails are listed as a maintainer for it.
>>>
>>
>> What does scripts/get-maintainer.pl show ?
>>
>> -- 
>> Best regards,
>> Marek Vasut
> 
> Cyrille Pitchen <cyrille.pitchen@atmel.com> (maintainer:SPI NOR SUBSYSTEM)
> Marek Vasut <marek.vasut@gmail.com> (maintainer:SPI NOR SUBSYSTEM)
> David Woodhouse <dwmw2@infradead.org> (maintainer:MEMORY TECHNOLOGY DEVICES (MTD))
> Brian Norris <computersforpeace@gmail.com> (maintainer:MEMORY TECHNOLOGY DEVICES (MTD))
> Boris Brezillon <boris.brezillon@free-electrons.com> (maintainer:MEMORY TECHNOLOGY DEVICES (MTD))
> Richard Weinberger <richard@nod.at> (maintainer:MEMORY TECHNOLOGY DEVICES (MTD))
> linux-mtd@lists.infradead.org (open list:SPI NOR SUBSYSTEM)
> linux-kernel@vger.kernel.org (open list)
> 
> ^ exactly this.

Crap ... that's kinda surprising. I would've expected to see the two
hisilicon contributors I see in the git log to pop up there . Can you
add them and send a patch please ?

-- 
Best regards,
Marek Vasut
