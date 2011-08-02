Received: from na3sys009aob106.obsmtp.com ([74.125.149.76]
	helo=na3sys009aog106.obsmtp.com)
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QoHan-0006XV-Rb
	for linux-mtd@lists.infradead.org; Tue, 02 Aug 2011 16:13:19 +0000
Received: by mail-ew0-f47.google.com with SMTP id 5so4115915ewy.20
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Aug 2011 09:13:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <B85A65D85D7EB246BE421B3FB0FBB593024DE78781@dbde02.ent.ti.com>
References: <1311241163-4576-1-git-send-email-sudhakar.raj@ti.com>
	<CAPcSpELvskFmRxEyBcZVGOqW8nKthk-1AbLXG4c4pUs_XQ2xmA@mail.gmail.com>
	<B85A65D85D7EB246BE421B3FB0FBB593024DE78781@dbde02.ent.ti.com>
Date: Tue, 2 Aug 2011 12:13:11 -0400
Message-ID: <CAPcSpE+BgEKR6s4QrEo1N5TAj8mdbnF_CWHvfEKtT9ceG6QnJg@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: davinci: Add cpufreq support
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: "Nori, Sekhar" <nsekhar@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>, "Rajashekhara,
	Sudhakar" <sudhakar.raj@ti.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sekhar,

On Tue, Aug 2, 2011 at 12:00 PM, Nori, Sekhar <nsekhar@ti.com> wrote:
> Hi Ben,
>
> On Tue, Aug 02, 2011 at 18:32:39, Ben Gardiner wrote:
>> Hi Sudhakar,
>>
>> On Thu, Jul 21, 2011 at 5:39 AM, Rajashekhara, Sudhakar
>> <sudhakar.raj@ti.com> wrote:
>> > This patch adds cpufreq support for NAND driver. During cpufreq
>> > transition, 'davinci_aemif_setup_timing()' function will be called
>> > to reconfigure that AEMIF timings for the new frequency.
>>
>> I can see that this will work fine for dacinci_nand -- and it is a
>> welcomed feature also -- thank you for the effort to push this
>> upstream.
>>
>> Seeing this support added directly to davinci_nand driver made me
>> think -- now this driver has another reference to platform-specific
>> functions in arch/arm/mach-davinci/aemif.c. Recently the c6x project
>> pushed a fix to remove references to a platform specific include. Not
>> that you are re-introducing this include but in a more general sense:
>> perhaps the features/functions of the AEMIF _bus_ should be removed
>> from the davinci_nand driver?
>
> Good point! arch/arm/mach-davinci/aemif.c should be moved to drivers/
> Because AEMIF is present on C6x and OMAP architectures as well and
> not limited to DaVinci.

Thanks, glad to help.

> I am not sure if there are any existing "memory interface" drivers.
> Moving to drivers/misc/ may be a good point to start.
>
> Making AEMIF a new bus type is an interesting idea as well.

I don't really know what the best fit is; but I imagine a bus type
driver is suitable since it best reflects the actual hierarchy of
devices and hence should yield the best runtime power management...

Whether or not it is a bus type driver, I think the AEMIF driver when
migrated should ideally be taking the timings and other AEMIF
configuration parameters (bus width, extended wait, stobe mode) as
platform data instead of the direct register writes from
board-da850-evm.c. This suggests one driver instance per chip-select.

Note that I am not volunteering to do the AEMIF driver development
here :) Although I do have some patches in development that would be
affected by the merge of such a feature.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca
