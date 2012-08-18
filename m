Received: from dalsmrelay2.nai.com ([205.227.136.216])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T2sBG-00084f-FD
 for linux-mtd@lists.infradead.org; Sat, 18 Aug 2012 23:11:48 +0000
Message-ID: <50302125.9070103@snapgear.com>
Date: Sun, 19 Aug 2012 09:11:33 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: fix wrong usage of ioremap_nocache() in
 uclinux.c map driver
References: <1342676566-25651-1-git-send-email-gerg@snapgear.com>
 <1345209400.27859.86.camel@sauron.fi.intel.com>
In-Reply-To: <1345209400.27859.86.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, uclinux-dev@uclinux.org,
 Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On 08/17/2012 11:16 PM, Artem Bityutskiy wrote:
> On Thu, 2012-07-19 at 15:42 +1000, gerg@snapgear.com wrote:
>> From: Greg Ungerer <gerg@uclinux.org>
>>
>> The uclinux.c mapping driver uses ioremap_nocache() to map its physical
>> mapping address to a system virtual address. Problem is that the region
>> it is mapping is not device memory. It is ordinary system RAM. On most
>> non-MMU systems this doesn't matter, and the mapping is always a 1:1
>> translation of the address. On paged memory systems on some architectures
>> the page table mappings are not compatible between normal RAM and device
>> memory.
>
> I cannot compile m68k because of the following errors:
>
> arch/m68k/platform/coldfire/clk.c:54:13: error: redefinition of 'clk_get'
> include/linux/clk.h:281:27: note: previous definition of 'clk_get' was here
> arch/m68k/platform/coldfire/clk.c:68:5: error: redefinition of 'clk_enable'
> include/linux/clk.h:295:19: note: previous definition of 'clk_enable' was here
> arch/m68k/platform/coldfire/clk.c:80:6: error: redefinition of 'clk_disable'
> include/linux/clk.h:300:20: note: previous definition of 'clk_disable' was here
> arch/m68k/platform/coldfire/clk.c:90:6: error: redefinition of 'clk_put'
> include/linux/clk.h:291:20: note: previous definition of 'clk_put' was here
> arch/m68k/platform/coldfire/clk.c:97:15: error: redefinition of 'clk_get_rate'
> include/linux/clk.h:302:29: note: previous definition of 'clk_get_rate' was here
> arch/m68k/platform/coldfire/clk.c:150:13: error: redefinition of 'devm_clk_get'
> include/linux/clk.h:286:27: note: previous definition of 'devm_clk_get' was here
> make[2]: *** [arch/m68k/platform/coldfire/clk.o] Error 1
>
> so I cannot compile-test this patch. Do you have a work-around patch for
> that compilation issue?

Yes, apply this patch:

   http://marc.info/?l=linux-m68k&m=134397575425772&w=2

It will be going to Linus this week.

Regards
Greg


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
