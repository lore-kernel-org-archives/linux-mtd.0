Received: from mail-vb0-f49.google.com ([209.85.212.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T7SE5-0005nM-T6
 for linux-mtd@lists.infradead.org; Fri, 31 Aug 2012 14:29:39 +0000
Received: by vbbfo1 with SMTP id fo1so3441481vbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 31 Aug 2012 07:29:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1346421558.9709.51.camel@sauron.fi.intel.com>
References: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
 <1346001700-26895-2-git-send-email-shijie8@gmail.com>
 <1346421558.9709.51.camel@sauron.fi.intel.com>
Date: Fri, 31 Aug 2012 10:29:35 -0400
Message-ID: <CAMiH66FOQezc6_AFfsMmBtmkcxUEV2781_AvdASmC80izxzeNw@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: cmdlinepart: sort the unsorted partitions
From: Huang Shijie <shijie8@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, shmulik.ladkani@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 31, 2012 at 9:59 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sun, 2012-08-26 at 13:21 -0400, Huang Shijie wrote:
>> Assume we have a 1GB(8Gb) nand chip.
>> It is legit if we set the partitions as the following:
>>     gpmi-nand:1g@200m(rootfs),100m@0(boot),100m@100m(kernel)
>>
>> But the current code can not parse out any partition with this
>> cmdline.
>>
>> This patch sorts the unsorted partitions by the @offset.
>> For there are maybe only several partitions, i use the simple
>> Bubble sort algorithm.
>>
>> Signed-off-by: Huang Shijie <shijie8@gmail.com>
>
> I still cannot find time to actually think about this carefully, but the
> commit message does not sound convincing, it does not explain why
> sorting is the right way to fix the issue, and what would be the
> alternatives. It actually also does not explain why exactly we currently
> cannot parse the example string.
>
thanks .

I will add more comment in the next version.

Best Regards
Huang Shijie
