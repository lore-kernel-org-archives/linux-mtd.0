Received: from mail-vc0-f177.google.com ([209.85.220.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8YHQ-0001HL-8a
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 15:09:36 +0000
Received: by vcbfl15 with SMTP id fl15so5925405vcb.36
 for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2012 08:09:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1346656701.3061.8.camel@sauron.fi.intel.com>
References: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
 <1346656701.3061.8.camel@sauron.fi.intel.com>
Date: Mon, 3 Sep 2012 11:09:26 -0400
Message-ID: <CAMiH66GX7h5tve9CLHzj8MMrUv90fL+4BWYPZ6KQkP5bbXY9ag@mail.gmail.com>
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

On Mon, Sep 3, 2012 at 3:18 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sun, 2012-08-26 at 13:21 -0400, Huang Shijie wrote:
>> + *
>> + * Note:
>> + * If you choose to set the @offset for the <partdef>, please set all
>> + * the partitions with the same syntax, such as:
>> + *     gpmi-nand:100m@0(boot),100m@100m(kernel),1g@200m(rootfs)
>> + *
>> + * Please do _NOT_ set the partitions like this:
>> + *     gpmi-nand:100m@0(boot),100m(kernel),1g@200m(rootfs)
>> + * The `kernel` partition does not set with the @offset, this is not permitted.
>>   */
>
> I guess it is indeed OK to sort the partitions, just makes things a lot
> simpler. But we probably then should also do the following:
>
> 1. Make sure there is only one partition without offset. If there are
> several - error out.

 Why allow `only one partition without offset`?

Take the following unsorted partitions as an example:
     #gpmi-nand:1g@200m(rootfs),100m(boot),100m@100m(kernel)

The current code will parses out the following partitions:
      rootfs: < size = 1g, offset=200m>
      boot:   < size = 100m, offset= OFFSET_CONTINOUS>
      kernel: <size = 100m, offset = 100m>

If we sort the partitions by the offset, we get the following result:
     "kernel" , "rootfs", "boot"

In actually, we expect the following result:
    "boot", "kernel", "rootfs"

What's your idea about this issue?
In my opinion, we should forbid the mixed type.

thanks
Huang Shijie







> 2. Check that partitions do not intersect - I did not notice that we do
> this in the code.
>
> So AFAICS, this patch is not needed and we better have the following
> patches:
>
> 1. Add sorting
> 2. Add a check that partitions do not overlap and there is only one
> offset-less partition.
>
> How does this sound?
>
> --
> Best Regards,
> Artem Bityutskiy
