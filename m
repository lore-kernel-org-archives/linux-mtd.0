Received: from mail-gh0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sr1FW-0006JF-LK
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2012 06:27:17 +0000
Received: by ghbf11 with SMTP id f11so45040ghb.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2012 23:26:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMiH66HEw2SrTOp4zCxLapFMj7AH5dh4sZGMdtb6SSMc0e1FcA@mail.gmail.com>
References: <1342196904-13850-1-git-send-email-computersforpeace@gmail.com>
 <CAMiH66HEw2SrTOp4zCxLapFMj7AH5dh4sZGMdtb6SSMc0e1FcA@mail.gmail.com>
Date: Mon, 16 Jul 2012 23:20:54 -0700
Message-ID: <CAN8TOE_fh=4EkntjL3o0913s-qR6uPgLXbMLV6vjFa0wfU8oNw@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: allow NAND_NO_SUBPAGE_WRITE to be set from
 driver
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Scott Wood <scottwood@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bump.

On Fri, Jul 13, 2012 at 7:02 PM, Huang Shijie <shijie8@gmail.com> wrote:
> On Fri, Jul 13, 2012 at 12:28 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
>> The NAND_CHIPOPTIONS_MSK has limited utility and is causing real bugs. It
>> silently masks off at least one flag that might be set by the driver
>> (NAND_NO_SUBPAGE_WRITE). This breaks the GPMI NAND driver and possibly
>> others.
>>
>> Really, as long as driver writers exercise a small amount of care with
>> NAND_* options, this mask is not necessary at all; it was only here to
>> prevent certain options from accidentally being set by the driver. But the
>> original thought turns out to be a bad idea occasionally. Thus, kill it.
>>
>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>> Cc: Huang Shijie <shijie8@gmail.com>
>> Cc: Marek Vasut <marex@denx.de>
>> ---
>> Huang, please test this with your driver.
>>
> I tested this patch on imx6q-arm2 board with Micron MT29F32G08QAA.
> it works fine, thanks.
>
> Tested-by: Huang Shijie <shijie8@gmail.com>

Any other Acks? Or acceptance from Artem/David?

Brian
