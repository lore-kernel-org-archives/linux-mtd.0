Received: from mail-vc0-f177.google.com ([209.85.220.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T7SFD-00060b-Ld
 for linux-mtd@lists.infradead.org; Fri, 31 Aug 2012 14:30:48 +0000
Received: by vcbfl15 with SMTP id fl15so3550786vcb.36
 for <linux-mtd@lists.infradead.org>; Fri, 31 Aug 2012 07:30:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1346413543.9709.45.camel@sauron.fi.intel.com>
References: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
 <1346413543.9709.45.camel@sauron.fi.intel.com>
Date: Fri, 31 Aug 2012 10:30:46 -0400
Message-ID: <CAMiH66H5rfzfPJ8trbnHxWVL4icHVBq+QYVhS79HQa_emoTJmQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: cmdlinepart: make the partitions rule more strict
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

On Fri, Aug 31, 2012 at 7:45 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sun, 2012-08-26 at 13:21 -0400, Huang Shijie wrote:
>> There are typically two types to set the mtd partitions:
>>
>> <1> set with the `size`, such as
>>     gpmi-nand:100m(boot),100m(kernel),1g(rootfs)
>>
>> <2> set with the `offset`, such as
>>     gpmi-nand:100m@0(boot),100m@100m(kernel),1g@200m(rootfs)
>>     gpmi-nand:1g@200m(rootfs),100m@0(boot),100m@100m(kernel)
>>
>> If we mix these two types, such as:
>>      gpmi-nand:100m@0(boot),100m(kernel),1g@200m(rootfs)
>>      gpmi-nand:1g@200m(rootfs),100m@0(boot),100m(kernel)
>>
>> It's hard to understand the cmdline. And also it is hard to sort the
>> partitions in this mixed type. So we explicitly forbid the mixed type.
>
> So "explicitly forbid" is just to add a "do not do this" comment?
>
Do you think we should change the code to forbid this mixed type?

Huang Shijie
