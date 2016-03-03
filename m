Received: from mail-ob0-x22b.google.com ([2607:f8b0:4003:c01::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abX2L-00070h-BX
 for linux-mtd@lists.infradead.org; Thu, 03 Mar 2016 17:27:42 +0000
Received: by mail-ob0-x22b.google.com with SMTP id rt7so26336659obb.3
 for <linux-mtd@lists.infradead.org>; Thu, 03 Mar 2016 09:27:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu_5vmxsigsCfsvcjFa-hhOP6vxnMavsQ45oKgMeYzgUSg@mail.gmail.com>
References: <1456508053-15015-1-git-send-email-ard.biesheuvel@linaro.org>
 <CAKv+Gu_8Fggh+hnVnj6pM6PbOysWFTNt=ot6nudLur9nzs2FVg@mail.gmail.com>
 <20160303171347.GY19428@n2100.arm.linux.org.uk>
 <CAKv+Gu_5vmxsigsCfsvcjFa-hhOP6vxnMavsQ45oKgMeYzgUSg@mail.gmail.com>
Date: Thu, 3 Mar 2016 09:27:19 -0800
Message-ID: <CAPcyv4ijokZMTNPsxVOafMUCT_CHyScTkCGbR94mcYOhQOKNqA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] fix memremap on ARM
From: Dan Williams <dan.j.williams@intel.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 linux-mtd@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 3, 2016 at 9:16 AM, Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:
> On 3 March 2016 at 18:13, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
>> On Thu, Mar 03, 2016 at 05:24:41PM +0100, Ard Biesheuvel wrote:
>>> If there are no remaining objections, may I suggest that Dan takes
>>> patch #1 and #2, and that I put the third patch into Russell's patch
>>> system? The only strict ordering requirement is that #1 is merged
>>> before #2 and #3 both hit mainline, and that is solved by taking #1
>>> and #2 in order.
>>
>> How does the dependency between 1 and 3 get satisfied?  Your comment
>> makes no sense to me.
>>
>
> Patch #3 introduces a function arch_memremap_wb() on the ARM side
> which will never get called unless patch #2 is also merged. Once both
> #2 and #3 are in, the memremap() call that #1 reverts will use
> MT_MEMORY_RW attributes rather than MT_DEVICE_CACHED, so #1 needs to
> go first, but #2 and #3 can go in in either order.
>
> In other words, there are no build dependencies between the patches,
> but to prevent pxa2xx-flash from using MT_MEMORY_RW attributes, it
> needs to go in before #2

Can we add a new MEMREMAP_ type for this case so that we don't need to
keep carrying the confusing ioremap_cache() which means different
things to different archs and silently falls back to uncached on some
archs.
