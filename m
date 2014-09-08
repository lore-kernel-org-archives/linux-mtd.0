Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQxQk-0004Hi-Lx
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 11:48:23 +0000
Message-ID: <540D976D.1050403@ti.com>
Date: Mon, 8 Sep 2014 14:47:57 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH 0/3] nand: omap2: Two and a half improvements
References: <1410033389-32357-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <540D691B.2060202@ti.com> <20140908113109.GC1676@arch.hh.imgtec.org>
In-Reply-To: <20140908113109.GC1676@arch.hh.imgtec.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Tony Lindgren <tony@atomide.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 =?ISO-8859-1?Q?Guido_Mart=EDnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/08/2014 02:31 PM, Ezequiel Garcia wrote:
> On 08 Sep 11:30 AM, Roger Quadros wrote:
> [..]
>>>
>>> And speaking of modules, the driver loads as "modprobe omap2". And it's not
>>> the only one with a clumsy name: "modprobe elm". I guess we cannot fix it now,
>>> but it would be great to be more careful with driver naming in the future.
>>
>> Why can't we fix it now? It seems nobody ever used it as a module before so now
>> is the right time to fix. Unless Tony has any objections.
>>
> 
> That would be great. "omap2-nand" or something like that would be optimal.

Other drivers seem to use and underscore e.g. pxa3xx_nand.c, orion_nand.c

so "omap2_nand" is fine by me.

> 
> Regarding the ELM driver, I agree with your suggestion in the other thread,
> we could just move it into drivers/mtd/nand and rework it to not be a module
> but just a pack of helpers for the NAND driver.
> 
> Do you think that would work?
> 

The ELM is in fact a separate IP block on the SoC with its own Clocking, reset mechanism
and memory resource. Clocking and reset is handled by OMAP hwmod framework, so it might not
be that easy to get rid of the ELM device driver and make it just a library.

For now just moving it to mtd/nand and naming it omap_elm (or omap4_elm since it was added in
OMAP4) is good enough IMO.

cheers,
-roger
