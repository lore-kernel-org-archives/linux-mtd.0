Received: from mail-vc0-x22b.google.com ([2607:f8b0:400c:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XXbTN-0005wU-7y
 for linux-mtd@lists.infradead.org; Fri, 26 Sep 2014 19:46:34 +0000
Received: by mail-vc0-f171.google.com with SMTP id ij19so8012237vcb.2
 for <linux-mtd@lists.infradead.org>; Fri, 26 Sep 2014 12:46:11 -0700 (PDT)
MIME-Version: 1.0
Sender: jergarff@gmail.com
In-Reply-To: <201409251909.41740.marex@denx.de>
References: <CAKbvp-NuFWzCCT+eo-WO47kazNuHbcA4KxhjDLYGR9p9Jh9FRg@mail.gmail.com>
 <201409251909.41740.marex@denx.de>
Date: Fri, 26 Sep 2014 13:46:10 -0600
Message-ID: <CAKbvp-PKW6e7m7Szt+EJfm3+ATLPkeT5KgBUU0TQB1R=2bDKzw@mail.gmail.com>
Subject: Re: [PATCH] spi-nor: Fix for Freescale i.MX6 reboot issue when using
 a N25Q00A boot device.
From: Jeremy Garff <jer@jers.net>
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 25, 2014 at 11:09 AM, Marek Vasut <marex@denx.de> wrote:
> On Saturday, August 16, 2014 at 08:14:05 PM, Jeremy Garff wrote:
>> This is my first submission to the linux-mtd list.  I found
>
> Found yes
>
>> and fixed
>
> Fixed no ;-)
>
>> a issue related to the i.MX6 when using a N25Q00A spi-nor as the boot
>> device.  The following is a patch and more detailed description.  As
>> this is my first submission to this list, so please let me know you
>> have any questions or concerns.
>
> Well, the problem is that the SPI NOR ends in undefined state when you reset the
> board. The problem is not in Linux, the problem is in your board. You should use
> the RESET-OUTPUT pin of your MX6 to implement proper reset sequencing for the
> SPI NOR.

There is no reset pin on this particular SPI NOR device, therein lies
the problem.

http://www.micron.com/-/media/documents/products/data%20sheet/nor%20flash/serial%20nor/n25q/n25q_1gb_1_8v_65nm.pdf

>
> This patch would not work in case you were doing a PageProgram operation and I
> came around and mashed the 'reset' button on your board. The SPI NOR would be
> somewhere in the middle of the PP and your MX6 would simply not boot.
>

It's actually worse than this.  _Any_ time the reset button is pushed
after linux initializes the device, the system won't boot.  Not just
during a page program.  Obviously this problem is outside the scope of
my fix, but it does however fix the case where the user initiates the
reboot.

> So the solution here is to fix your hardware ;-)
>

Easier said than done.  In many circumstances, hardware fixes like the
one you suggest are outside the control of the developer and/or incur
additional board and part costs.

In my opinion, the real fix for this issue is in the Freescale boot
ROM, which should do a soft reset of the SPI NOR prior to any reads.
Unfortunately it doesn't do this, and can't be changed except by
Freescale.

> btw this is a common issue, we should really document this before more people
> get hurt.
>

What you are effectively saying is that you simply can't and shouldn't
use this part with a i.MX6.  But why not implement the fix if the
following are true?

- It's as you say, a common issue.
- A hardware fix may be outside the developers control or parts are fielded.
- The fix simply puts the part in a consistent state on
reboot/shutdown and seems reasonable.

Thanks,

Jeremy
