Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bK1ml-0003YG-2c
 for linux-mtd@lists.infradead.org; Mon, 04 Jul 2016 11:11:31 +0000
Received: by mail-oi0-x242.google.com with SMTP id x6so22688023oif.3
 for <linux-mtd@lists.infradead.org>; Mon, 04 Jul 2016 04:11:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <577A425B.5080706@nod.at>
References: <57791562.2020703@nod.at> <20160704111612.43cd6339@bbrezillon>
 <577A2FE3.3030304@nod.at> <20160704120630.075af531@bbrezillon>
 <577A425B.5080706@nod.at>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 4 Jul 2016 13:11:09 +0200
Message-ID: <CAFLxGvzOgisiSbvSSjWmbMvZ=tU180iMzdV2HZD_FShCvo9sgA@mail.gmail.com>
Subject: Re: Race-free NAND device removal
To: Richard Weinberger <richard@nod.at>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 4, 2016 at 1:02 PM, Richard Weinberger <richard@nod.at> wrote:
> Am 04.07.2016 um 12:06 schrieb Boris Brezillon:
>>> $ nandsimctl --backend file /home/rw/work/XXX/broken_mtd.raw --id-bytes 0x....
>>>
>>> While getting this race free I found that issue.
>>
>> Okay, so you modified nandsim code to check nand_release() return code,
>> right? Maybe you can send this change in your nandsim rework series
>> then.
>
> Yep. My code checks the result of nand_release().
> I'll carry it in my series.
>
> BTW: There is more fun:
> When we look into mtdcore.c
> int mtd_device_unregister(struct mtd_info *master)
> {
>         int err;
>
>         if (master->_reboot)
>                 unregister_reboot_notifier(&master->reboot_notifier);
>
>         err = del_mtd_partitions(master);
>         if (err)
>                 return err;
>
>         if (!device_is_registered(&master->dev))
>                 return 0;
>
>         return del_mtd_device(master);
> }
> EXPORT_SYMBOL_GPL(mtd_device_unregister);
>
> Either del_mtd_partitions() or del_mtd_device() will notice that the MTD usage count is > 0 and
> return -EBUSY.
> But at this stage we've already executed the reboot notifier. Bug or feature? ;-)

Should be read removed the...

> I'm also not sure about the printk in del_mtd_device():
>         if (mtd->usecount) {
>                 printk(KERN_NOTICE "Removing MTD device #%d (%s) with use count %d\n",
>                        mtd->index, mtd->name, mtd->usecount);
>                 ret = -EBUSY;
>         } else {
>
> Why do you have to warn the user? Is this 100% a legit use case or is the printk here to warn
> that a driver is buggy?
> At least with the existing UBI glubi driver you can hit this code path.
> Same for the upcoming nandsim changes.
>
> Thanks,
> //richard
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Thanks,
//richard
