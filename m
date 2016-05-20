Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b3fDq-0002Ay-38
 for linux-mtd@lists.infradead.org; Fri, 20 May 2016 07:51:50 +0000
Subject: Re: UBIFS assert when rebooting a read only ubifs when it's been
 remounted r/w
To: Martin Townsend <mtownsend1973@gmail.com>
References: <CABatt_xjhTpaUitXP_az+cOFEVA=eUedayFggrrH=Z7ZdBWUYg@mail.gmail.com>
 <CAFLxGvx9bnh6z1hkMXzdvynBOdDca6HJziEKG5pH95e+Ttaa8Q@mail.gmail.com>
 <CABatt_wMSQd7Tc=gP0rO53UghqjdaTonFFj4R_qu8zFJyfyz3A@mail.gmail.com>
 <573C4033.6010906@nod.at>
 <CABatt_wF4Vb0R=xiQapY4Q1ieBJ7Sjcvg3XXsE6QxWrACwchgw@mail.gmail.com>
 <573EC17D.40809@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <573EC1FF.6070709@nod.at>
Date: Fri, 20 May 2016 09:51:27 +0200
MIME-Version: 1.0
In-Reply-To: <573EC17D.40809@nod.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 20.05.2016 um 09:49 schrieb Richard Weinberger:
> Am 18.05.2016 um 12:39 schrieb Martin Townsend:
>> I can't do the sync as the error only occurs during boot and I can see
>> the assert whilst systemd is rmounting all the filesystems. Once I've
>> logged in I can't get the assert to trigger again.  Just to summarise
>> the conditions for triggering the assert
>> To trigger I login and remount / as rw and then reboot (to a ro
>> rootfs) and the assert first during the boot.
>> The assert will appear on all subsequent boots (Providing I don't do
>> the following)
>> To get rid of the assert I can, once logged in, remount / rw and then
>> ro and then reboot.
> 
> Hmm, so there is no reset/power cut involved at all?
> Can you trigger it when you mount a UBIFS by hand ro and remount?

Another thought, can you try this patch (if it is not already applied)?

commit 807612db2f9940b9fa6deaef054eb16d51bd3e00
Author: Andrew Ruder <andrew.ruder@elecsyscorp.com>
Date:   Thu Jan 30 09:26:54 2014 -0600

    fs/super.c: sync ro remount after blocking writers

    Move sync_filesystem() after sb_prepare_remount_readonly().  If writers
    sneak in anywhere from sync_filesystem() to sb_prepare_remount_readonly()
    it can cause inodes to be dirtied and writeback to occur well after
    sys_mount() has completely successfully.

    This was spotted by corrupted ubifs filesystems on reboot, but appears
    that it can cause issues with any filesystem using writeback.

    Cc: Artem Bityutskiy <dedekind1@gmail.com>
    Cc: Christoph Hellwig <hch@infradead.org>
    Cc: Alexander Viro <viro@zeniv.linux.org.uk>
    CC: Richard Weinberger <richard@nod.at>
    Co-authored-by: Richard Weinberger <richard@nod.at>
    Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
    Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Thanks,
//richard
