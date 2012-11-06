Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TVle7-0007y0-1t
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2012 16:05:00 +0000
Message-ID: <50993511.3020906@ti.com>
Date: Tue, 6 Nov 2012 11:04:33 -0500
From: Murali Karicheri <m-karicheri2@ti.com>
MIME-Version: 1.0
To: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [RFC PATCH 1/2] memory: davinci - add aemif controller platform
 driver
References: <1351873278-27325-1-git-send-email-m-karicheri2@ti.com>
 <1351873278-27325-2-git-send-email-m-karicheri2@ti.com>
 <50967307.5030500@gmail.com> <50982AC3.8030000@ti.com>
 <5098BFE1.3020906@ti.com>
In-Reply-To: <5098BFE1.3020906@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: davinci-linux-open-source@linux.davincidsp.com, santosh.shilimkar@ti.com,
 swarren@wwwdotorg.org, artem.bityutskiy@linux.intel.com,
 devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, grant.likely@secretlab.ca, b32955@freescale.com,
 wim@iguana.be, Rob Herring <robherring2@gmail.com>, rob@landley.net,
 gregkh@linuxfoundation.org, linux-mtd@lists.infradead.org, hs@denx.de,
 dwmw2@infradead.org, shubhrajyoti@ti.com, hdoyu@nvidia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/06/2012 02:44 AM, Sekhar Nori wrote:
> On 11/6/2012 2:38 AM, Murali Karicheri wrote:
>> On 11/04/2012 08:52 AM, Rob Herring wrote:
>>> OMAP GPMC
>> Could you send me a link please?
> https://www.google.com/search?q=RFC+OMAP+GPMC+DT+bindings
>
> The patches series is sent by Daniel Mack. v3 was the last version sent.
>
> Thanks,
> Sekhar
>
>
One of the question I have on this is what is the final location of the 
GPMC driver? The patch referred here is located inside the mach-omap2. 
This will not work for us as AEMIF driver is used across multiple 
architecture. range is also used in AEMIF bindings to refer the CS 
memory map. So there is no issue here. I will fix the documentation. Or 
Am I missing something?

Murali
