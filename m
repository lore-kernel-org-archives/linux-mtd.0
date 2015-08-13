Message-ID: <55CC86C1.8000107@ti.com>
Date: Thu, 13 Aug 2015 15:00:01 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Tony Lindgren <tony@atomide.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <ezequiel@vanguardiasur.com.ar>, <javier@dowhile0.org>,
 <fcooper@ti.com>, <nsekhar@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 00/22] memory: omap-gpmc: mtd: nand: Support GPMC NAND
 on non-OMAP platforms
References: <1438938752-31010-1-git-send-email-rogerq@ti.com>
 <20150811124829.GM4215@atomide.com> <55CC43B1.4020409@ti.com>
 <20150813083616.GZ4215@atomide.com>
In-Reply-To: <20150813083616.GZ4215@atomide.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 13/08/15 11:36, Tony Lindgren wrote:
> * Roger Quadros <rogerq@ti.com> [150813 00:17]:
>> On 11/08/15 15:48, Tony Lindgren wrote:
>>>
>>> OK. Yeah let's make sure no regressions are caused by this.. We also
>>> still have the omap3 legacy booting around, have you checked that it
>>> keeps on working?
>>
>> I don't have any omap3 board with legacy support with me. I have omap3-beagle
>> but looks like legacy boot is dropped for it already.
>>
>> I'll try to revert the patch that drops beagle support and test it on that one.
> 
> OK yeah that should work just fine.
> 

Just verified that with the change in patch 6 it works on omap3-beagle legacy boot.
I have fixed some checkpatch issues in this series as well. Will post a v3
after you have gone one pass over this series.

cheers,
-roger
