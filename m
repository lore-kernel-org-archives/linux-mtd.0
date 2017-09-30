Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dyKUI-0004UV-KB
 for linux-mtd@lists.infradead.org; Sat, 30 Sep 2017 16:19:36 +0000
Received: by mail-wr0-x22e.google.com with SMTP id k62so1382514wrc.9
 for <linux-mtd@lists.infradead.org>; Sat, 30 Sep 2017 09:19:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAAEsGz+1T6eAHW_adm-RKHoaK6gv=ZtRdcMTum6+s1TXR0PzEQ@mail.gmail.com>
References: <CAAEsGz+1T6eAHW_adm-RKHoaK6gv=ZtRdcMTum6+s1TXR0PzEQ@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 30 Sep 2017 18:19:09 +0200
Message-ID: <CAFLxGvyT_meoP8rRc-gJi-Yk3VoxeJrF4L=gyo93iK9EAR=HFg@mail.gmail.com>
Subject: Re: ubifs robustness with early power cut warning
To: Doug Crawford <dcraw101@gmail.com>
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

On Sat, Sep 30, 2017 at 1:20 AM, Doug Crawford <dcraw101@gmail.com> wrote:
> We have an embedded system with an early power loss warning.  The
> power supply drives a powerdown signal connected to a GPIO pin on the
> CPU.  When AC power is switched off the power supply drives this
> signal low for 500 milliseconds before the CPU gets held in reset.  If
> AC power is switched back on before 500 milliseconds the powerdown
> signal goes high again and the system is expected to continue running
> normally.
>
> I am wondering if there is a way to easily modify ubifs/ubi such that
> when the powerdown gpio is low VFS or UBIFS or UBI freezes or pauses
> further writes to the NAND.  If powerdown recovers to high again then
> the filesystem would unfreeze and allow further writes?  Has anyone
> implemented something like this before?  I know UBIFS/UBI is designed
> to be very resilient to power cuts, but I am thinking this technique
> might make the system even more resilient.  If I were to make this
> change which file would be the right one to hook into:
> fs/ubifs/super.c?

UBI/UBIFS is the wrong layer, this needs to happen in MTD.

-- 
Thanks,
//richard
