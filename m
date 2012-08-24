Received: from mail-vc0-f177.google.com ([209.85.220.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4wd3-00070q-0l
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 16:21:01 +0000
Received: by vcbfl15 with SMTP id fl15so881627vcb.36
 for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2012 09:20:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345823689.2848.329.camel@sauron.fi.intel.com>
References: <1345309236-25806-1-git-send-email-shijie8@gmail.com>
 <1345823689.2848.329.camel@sauron.fi.intel.com>
Date: Fri, 24 Aug 2012 12:20:58 -0400
Message-ID: <CAMiH66E5LXC8dZrnxJ13amgcimtAj3XG9neKy-gwPGv_1YvkxQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: mtdpart: break it as soon as we parse out the
 partitions
From: Huang Shijie <shijie8@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 24, 2012 at 11:54 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sat, 2012-08-18 at 13:00 -0400, Huang Shijie wrote:
>> We may cause a memory leak when the @types has more then one parser.
>>
>> Take the `default_mtd_part_types` for example. The default_mtd_part_types has
>> two parsers now: `cmdlinepart` and `ofpart`.
>>
>> Assume the following case:
>> The kernel command line sets the partitions like:
>>       #gpmi-nand:20m(boot),20m(kernel),1g(rootfs),-(user)
>> But the devicetree file(such as arch/arm/boot/dts/imx28-evk.dts) also sets
>> the same partitions as the kernel command line does.
>>
>> In the current code, the partitions parsed out by the `ofpart` will
>> overwrite the @pparts which has already set by the `cmdlinepart` parser,
>> and the the partitions parsed out by the `cmdlinepart` is missed.
>> A memory leak occurs.
>>
>> So we should break the code as soon as we parse out the partitions,
>> In actually, this patch makes a priority order between the parsers.
>> If one parser has already parsed out the partitions successfully,
>> it's no need to use another parser anymore.
>>
>> Signed-off-by: Huang Shijie <shijie8@gmail.com>
>
> Pushed to l2-mtd.git with "Cc: stable@vger.kernel.org" - do you agree
> with that?
>
thanks a lot. I do agree to cc to stable.

Huang Shijie
