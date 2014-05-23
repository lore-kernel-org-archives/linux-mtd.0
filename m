Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wnkf8-00012w-Hf
 for linux-mtd@lists.infradead.org; Fri, 23 May 2014 08:17:10 +0000
Message-ID: <537F03C8.3070101@ti.com>
Date: Fri, 23 May 2014 11:16:08 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Tony Lindgren
 <tony@atomide.com>, Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [RFC PATCH 00/16] OMAP: GPMC: Restructure OMAP GPMC driver (NAND)
 : DT binding change proposal
References: <1400671264-10702-1-git-send-email-rogerq@ti.com>
 <20140521160818.GA1150@arch.cereza> <537DB17A.6060608@ti.com>
 <CABxcv=nbgGhVN+XYO8s=mYOpoLU9-kWuEqc+FLMaSbWS7BJNyQ@mail.gmail.com>
 <20140522144600.GA1785@arch.cereza>
In-Reply-To: <20140522144600.GA1785@arch.cereza>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Robert Nelson <robertcnelson@gmail.com>, Jingoo Han <jg1.han@samsung.com>,
 nsekhar@ti.com, Linux Kernel <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, "Gupta,
 Pekon" <pekon@ti.com>, Grant Likely <grant.likely@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ezequiel & Javier,

On 05/22/2014 05:46 PM, Ezequiel Garcia wrote:
> On 22 May 01:51 PM, Javier Martinez Canillas wrote:
>> On Thu, May 22, 2014 at 10:12 AM, Roger Quadros <rogerq@ti.com> wrote:
>>>> On 21 May 02:20 PM, Roger Quadros wrote:
>>>>>
>>>>> For DT boot:
>>>>> - The GPMC controller node should have a chip select (CS) node for each used
>>>>>   chip select. The CS node must have a child device node for each device
>>>>>   attached to that chip select. Properties for that child are GPMC agnostic.
>>>>>
>>>>>   i.e.
>>>>>      gpmc {
>>>>>              cs0 {
>>>>>                      nand0 {
>>>>>                      }
>>>>>              };
>>>>>
>>>>>              cs1 {
>>>>>                      nor0 {
>>>>>                      }
>>>>>              }
>>>>>              ...
>>>>>      };
>>>>>
>>>>
>>>> While I agree that the GPMC driver is a bit messy, I'm not sure it's possible
>>>> to go through such a complete devicetree binding re-design (breaking backwards
>>>> compatibility) now that the binding is already in production.
>>>
>>> Why not? especially if the existing bindings are poorly dones. Is anyone using these
>>> bindings burning the DT into ROM and can't change it when they update the kernel?
>>>
>>
>> While I do agree that your DT bindings are much better than the
>> current ones, there is a policy that DT bindings are an external API
>> and once are released with a kernel are set in stone and can't be
>> changed.
>>
> 
> Exactly. The DT binding is considered an ABI. Thus, invariant across kernel
> versions. Users can't be coherced into a DTB update after a kernel update.
> 
> That said, I don't really care if you break compatilibity in this case.
> Rather, I'm suggesting that you make sure this change is going to be accepted
> upstream, before doing any more work. The DT maintainers are reluctant to do
> so.

Appreciate your concern.

Would be really nice if you can review patches 1-12. They have nothing to do with DT changes.
Thanks.

cheers,
-roger

> 
> On the other side, I guess you will also break bisectability while breaking
> backward compatibility. Doesn't sound very nice.
> 
