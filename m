Received: from mail-lf0-x232.google.com ([2a00:1450:4010:c07::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dz3Mr-0002mZ-Cf
 for linux-mtd@lists.infradead.org; Mon, 02 Oct 2017 16:14:55 +0000
Received: by mail-lf0-x232.google.com with SMTP id n140so4344373lfn.4
 for <linux-mtd@lists.infradead.org>; Mon, 02 Oct 2017 09:14:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvyT_meoP8rRc-gJi-Yk3VoxeJrF4L=gyo93iK9EAR=HFg@mail.gmail.com>
References: <CAAEsGz+1T6eAHW_adm-RKHoaK6gv=ZtRdcMTum6+s1TXR0PzEQ@mail.gmail.com>
 <CAFLxGvyT_meoP8rRc-gJi-Yk3VoxeJrF4L=gyo93iK9EAR=HFg@mail.gmail.com>
From: Doug Crawford <dcraw101@gmail.com>
Date: Mon, 2 Oct 2017 09:14:28 -0700
Message-ID: <CAAEsGzKs1kM4TJVKrrsS_GjxQ3kMQa0zwmX2_z3qRpCdS-Xhag@mail.gmail.com>
Subject: Re: ubifs robustness with early power cut warning
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I think my use case might be a little different. This 500 millisecond
early power down warning is intended to be recoverable if the power is
restored in that period.  The effect I am looking for is that any new
fsync or sync commands made during this 500 ms window will pause or
block, but if the power is restored then the sync will be successful.

I am worried that if mtd_write() returns an EPERM error then any
outstanding fsync or syncs would fail instead of block?  I don't know
enough about the mtd layer or the locking/calling context of
mtd_write().  But, I am guessing I can't simply sleep or block in that
function while the powerdown gpio is low?

On Sat, Sep 30, 2017 at 9:19 AM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> On Sat, Sep 30, 2017 at 1:20 AM, Doug Crawford <dcraw101@gmail.com> wrote:
>> We have an embedded system with an early power loss warning.  The
>> power supply drives a powerdown signal connected to a GPIO pin on the
>> CPU.  When AC power is switched off the power supply drives this
>> signal low for 500 milliseconds before the CPU gets held in reset.  If
>> AC power is switched back on before 500 milliseconds the powerdown
>> signal goes high again and the system is expected to continue running
>> normally.
>>
>> I am wondering if there is a way to easily modify ubifs/ubi such that
>> when the powerdown gpio is low VFS or UBIFS or UBI freezes or pauses
>> further writes to the NAND.  If powerdown recovers to high again then
>> the filesystem would unfreeze and allow further writes?  Has anyone
>> implemented something like this before?  I know UBIFS/UBI is designed
>> to be very resilient to power cuts, but I am thinking this technique
>> might make the system even more resilient.  If I were to make this
>> change which file would be the right one to hook into:
>> fs/ubifs/super.c?
>
> UBI/UBIFS is the wrong layer, this needs to happen in MTD.
>
> --
> Thanks,
> //richard
