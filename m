Received: from mail-lf0-x233.google.com ([2a00:1450:4010:c07::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b3h2E-0005LL-68
 for linux-mtd@lists.infradead.org; Fri, 20 May 2016 09:47:58 +0000
Received: by mail-lf0-x233.google.com with SMTP id e130so12571673lfe.3
 for <linux-mtd@lists.infradead.org>; Fri, 20 May 2016 02:47:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <573EC17D.40809@nod.at>
References: <CABatt_xjhTpaUitXP_az+cOFEVA=eUedayFggrrH=Z7ZdBWUYg@mail.gmail.com>
 <CAFLxGvx9bnh6z1hkMXzdvynBOdDca6HJziEKG5pH95e+Ttaa8Q@mail.gmail.com>
 <CABatt_wMSQd7Tc=gP0rO53UghqjdaTonFFj4R_qu8zFJyfyz3A@mail.gmail.com>
 <573C4033.6010906@nod.at>
 <CABatt_wF4Vb0R=xiQapY4Q1ieBJ7Sjcvg3XXsE6QxWrACwchgw@mail.gmail.com>
 <573EC17D.40809@nod.at>
Date: Fri, 20 May 2016 10:47:35 +0100
Message-ID: <CABatt_wQfDFN4U5SgOLrcxWNiZYVRQ4eGy1LQmdRJJN-qncUHw@mail.gmail.com>
Subject: Re: UBIFS assert when rebooting a read only ubifs when it's been
 remounted r/w
From: Martin Townsend <mtownsend1973@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 20, 2016 at 8:49 AM, Richard Weinberger <richard@nod.at> wrote:
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
>
I was resetting the board but will try the reboot command, I won't be
able to try until Monday though as I don't currently have the board.
I couldn't trigger this by booting via NFS and then trying to manually
mount, remount UBIFS.

Also will try patch on Monday :)

Cheers,
Martin.

> Thanks,
> //richard
