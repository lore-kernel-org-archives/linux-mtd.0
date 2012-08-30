Received: from mail-qc0-f177.google.com ([209.85.216.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T6yQ3-0004CB-03
 for linux-mtd@lists.infradead.org; Thu, 30 Aug 2012 06:39:59 +0000
Received: by qcsu28 with SMTP id u28so1035782qcs.36
 for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2012 23:39:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1346309023.2848.531.camel@sauron.fi.intel.com>
References: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
 <1346001700-26895-3-git-send-email-shijie8@gmail.com>
 <1346309023.2848.531.camel@sauron.fi.intel.com>
Date: Thu, 30 Aug 2012 14:39:55 +0800
Message-ID: <CAMiH66HaRG--3bC9HCfNu7S_WWKWx_COEuJdtgmBTNbdYdVt8Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtd: cmdlinepart: fix the wrong partitions number
 when truncating occurs
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

On Thu, Aug 30, 2012 at 2:43 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sun, 2012-08-26 at 13:21 -0400, Huang Shijie wrote:
>> This patch is based on the assumption that all the partitions are
>> in the right offset order.
>>
>> Assume we have a 1GB(8Gb) nand chip, and we set the partitions
>> in the command line like this:
>>     #gpmi-nand:100m(boot),100m(kernel),1g(rootfs)
>>
>> In this case, the partition truncating occurs. The current code will
>> get the following result:
>>
>>      ----------------------------------
>>       root@freescale ~$ cat /proc/mtd
>>       dev:    size   erasesize  name
>>       mtd0: 06400000 00040000 "boot"
>>       mtd1: 06400000 00040000 "kernel"
>>      ----------------------------------
>>
>> It is obvious that we lost the truncated partition `rootfs` which should
>> be 824M in this case.
>>
>> Why? The old code sets the wrong partitions number when the truncating
>> occurs. This patch fixes it. Alao add a `break` to shortcut the code in this
>> case.
>>
>> After apply this patch, the result becomes:
>>      ----------------------------------
>>       root@freescale ~$ cat /proc/mtd
>>       dev:    size   erasesize  name
>>       mtd0: 06400000 00040000 "boot"
>>       mtd1: 06400000 00040000 "kernel"
>>       mtd2: 33800000 00040000 "rootfs"
>>      ----------------------------------
>>
>> We get the right result.
>>
>> Signed-off-by: Huang Shijie <shijie8@gmail.com>
>
> Should this have CC to -stable?

It's ok to CC to stable.


thanks
Huang Shijie
>
> --
> Best Regards,
> Artem Bityutskiy
