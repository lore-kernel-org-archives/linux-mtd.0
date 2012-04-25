Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN6un-0001wB-9A
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 18:26:09 +0000
Received: by ghbf11 with SMTP id f11so450399ghb.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 11:26:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1335363413.5114.20.camel@koala>
References: <1334615755-15418-1-git-send-email-computersforpeace@gmail.com>
 <1335363413.5114.20.camel@koala>
Date: Wed, 25 Apr 2012 11:26:08 -0700
Message-ID: <CAN8TOE-hkaPU3QPOdP0xOZjyjKJ=ByL-4-B1+TqQNg1vWjL0UA@mail.gmail.com>
Subject: Re: [PATCH 0/2] mtd: nand: rework nand_ecc_ctrl interface for OOB
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 25, 2012 at 7:16 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Mon, 2012-04-16 at 15:35 -0700, Brian Norris wrote:
>> Note that I could not compile all the affected drivers, since some required
>> ARCH-specific builds that I am not familiar with.
>>
>> Artem: can you perform your regular compile tests? I compile-tested as many as
>> I could.
>
> Yes, I compile-test for several architecture/platforms, but not sure I
> cover everything. I'll check your patches once I reach that point in my
> inbox queue. I am currently having paternity leave, and I'll be very
> busy once I return back to work, but I am slowly processing my inbox
> anyway in background.

Right, no problem. We're all busy, and I know you get around to it
eventually :) I just wanted to make a special note of it, since this
sort of patch series touches more territory than I'm used to, and I'm
almost guaranteed to miss something.

Brian
