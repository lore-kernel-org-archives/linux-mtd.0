Subject: Re: [PATCH v3 5/5] mtd: spi-nor: cadence-quadspi: Add runtime PM
 support
To: matthew.gerlach@linux.intel.com
Cc: Vignesh R <vigneshr@ti.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20170924105924.23923-1-vigneshr@ti.com>
 <20170924105924.23923-6-vigneshr@ti.com>
 <3a1160f9-a0ae-c84c-d209-af97c3c3b0f6@gmail.com>
 <4ee69ea4-14cc-4305-bf3f-8fe76d43bf6b@ti.com>
 <fa700cdf-f0b5-779b-4f38-3138a7612cc2@gmail.com>
 <038919d3-ff32-d0a7-4c0a-3be16436052d@ti.com>
 <e4ad5d80-9093-b667-f0a5-d3105be4e8cf@gmail.com>
 <alpine.DEB.2.20.1709251538420.2472@mgerlach-VirtualBox>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <fdfe29bf-ff46-7542-8e36-e8e45e1ca85f@gmail.com>
Date: Tue, 26 Sep 2017 01:49:46 +0200
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1709251538420.2472@mgerlach-VirtualBox>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/26/2017 12:41 AM, matthew.gerlach@linux.intel.com wrote:
> 
> 
> On Sun, 24 Sep 2017, Marek Vasut wrote:
> 
>> On 09/24/2017 03:27 PM, Vignesh R wrote:
>>>
>>>
>>> On 9/24/2017 6:42 PM, Marek Vasut wrote:
>>>> On 09/24/2017 03:08 PM, Vignesh R wrote:
>>>>>
>>>>>
>>>>> On 9/24/2017 5:31 PM, Marek Vasut wrote:
>>>>>> On 09/24/2017 12:59 PM, Vignesh R wrote:
>>>>>>> Add pm_runtime* calls to cadence-quadspi driver. This is required to
>>>>>>> switch on QSPI power domain on TI 66AK2G SoC during probe.
>>>>>>>
>>>>>>> Signed-off-by: Vignesh R <vigneshr@ti.com>
>>>>>>
>>>>>> Are you planning to add some more fine-grained PM control later?
>>>>>
>>>>> Yes, I will need to add fine-grained PM control at some point. But,
>>>>> for
>>>>> now SoC does not really support low power mode or runtime power saving
>>>>> option.
>>>>> The fact that driver still uses clk_prepare_*() calls to
>>>>> enable/disable
>>>>> clocks instead of pm_*() calls makes it a bit tricky though.
>>>>>
>>>>> Just figured out I forgot to add cleanup code in error handling
>>>>> path of
>>>>> probe(). Will fix that and send a v4.
>>>>
>>>> OK, fine. Cleanups are welcome. The SoCFPGA doesn't do much runtime PM
>>>> either, so it's fine for now.
>>>>
>>>
>>> Ok thanks! Do you know if pm_runtime_get_sync() can enable clocks for
>>> QSPI on SoCFPGA or if clk_prepare_enable() is needed? Just trying to see
>>> if its possible to get rid of clk_*() calls in favor of pm_*() calls.
>>
>> Not of the top of my head, sorry. +CC Matthew, he should know.
> 
> I am not an expert at the clock framework nor the power management, but I
> did ask around a bit.  No one I asked was planning to change the clk_*()
> calls to pm_*() call, but the feedback was that it would be a good idea.

The question is, if we do the replacement, will it break on socfpga ?
A quick test might be useful.

-- 
Best regards,
Marek Vasut
