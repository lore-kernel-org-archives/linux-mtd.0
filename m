Subject: Re: [PATCH 2/2] mtd: nand: omap2: Add check for old elm binding
To: Brian Norris <computersforpeace@gmail.com>, Teresa Remmet
 <t.remmet@phytec.de>
References: <1467711150-23356-1-git-send-email-t.remmet@phytec.de>
 <1467711150-23356-2-git-send-email-t.remmet@phytec.de>
 <20160710005614.GB29572@localhost> <20160713171303.GA136972@google.com>
CC: <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mtd@lists.infradead.org>, =?UTF-8?Q?Beno=c3=aet_Cousson?=
 <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <1cb6e1f9-b4b5-9097-5b02-96ac9559e8ae@ti.com>
Date: Mon, 1 Aug 2016 12:22:42 +0300
MIME-Version: 1.0
In-Reply-To: <20160713171303.GA136972@google.com>
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

On 13/07/16 20:13, Brian Norris wrote:
> On Sat, Jul 09, 2016 at 05:56:14PM -0700, Brian Norris wrote:
>> On Tue, Jul 05, 2016 at 11:32:30AM +0200, Teresa Remmet wrote:
>>> commit c9711ec5250b ("mtd: nand: omap: Clean up device tree support")
>>> removes the check for the old elm phandle binding.
>>
>> That seems like a silly breakage of backwards compatibility. Must have
>> overlooked that one, sorry.
>>
>>> Add it again to keep backward compatibility.
>>>
>>> Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
>>
>> I think we should probably take this for v4.7, since the breaking commit
>> was only merged in v4.7-rc1. OMAP folks, any comment?
> 
> Applied to linux-mtd.git. I plan to send this to Linus for v4.7, since
> it's a DT regression, unless someone has a good reason not to.
> 

Sorry for the late reply as I was on vacation.
Thanks for the patch Teresa and thank you Brian for taking it into v4.7 :).

cheers,
-roger
