Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XW5Jp-0006wg-80
 for linux-mtd@lists.infradead.org; Mon, 22 Sep 2014 15:14:25 +0000
Message-ID: <54203CB6.8080702@ti.com>
Date: Mon, 22 Sep 2014 18:13:58 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 0/5] nand: OMAP collected fixes
References: <1411231996-6387-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <541FDC2F.4020103@ti.com> <54201B3B.50007@vanguardiasur.com.ar>
In-Reply-To: <54201B3B.50007@vanguardiasur.com.ar>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/22/2014 03:51 PM, Ezequiel Garcia wrote:
> 
> 
> On 09/22/2014 09:22 AM, Roger Quadros wrote:
>> Hi Ezequiel,
>>
>> On 09/20/2014 07:53 PM, Ezequiel Garcia wrote:
>>> I've collected all the changes recently discussed in a whole patchset.
>>> If you are just reading this for the first time please take a look at:
>>>
>>> [1] http://www.spinics.net/lists/linux-omap/msg110965.html
>>> [2] http://www.spinics.net/lists/linux-omap/msg110958.html 
>>>
>>> As requested by Roger, the omap_elm is a 'bool' driver now. The plan
>>> is to merge it inside omap2_nand, but my queue is really filled, so
>>> if anyone feels like doing, please be my guest.
>>>
>>> Although I'm hoping this to be the last round, feedback and testing
>>> is welcome.
>>
>> Patches 3 and 4 still have checkpatch issues.
>>
> 
> I think you didn't look at them in detail. Unless I'm missing something,
> it's just warning about MAINTAINERS update:
> 
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #16:
>  drivers/mtd/{devices/elm.c => nand/omap_elm.c} | 0
> 
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #13:
>  drivers/mtd/nand/{omap2.c => omap2_nand.c} | 0
> 
> This driver is not in MAINTAINERS. If you want to start maintaining it,
> it'd be good to add you to MAINTAINERS so people Cc you properly on patches.
> 

Sorry for the noise. I was re-generating the patch without the rename detection flag
causing errors which are present in the original file itself.

cheers,
-roger
