Received: from mail-ig0-x235.google.com ([2607:f8b0:4001:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtOF8-0005DV-Sn
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2015 23:10:27 +0000
Received: by igvi2 with SMTP id i2so58661080igv.0
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2015 15:10:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151027204023.GV13239@google.com>
References: <1445629626-27474-1-git-send-email-clay@daemons.net>
 <20151023232742.GV13239@google.com> <562AD54B.2000501@broadcom.com>
 <20151024011219.GW13239@google.com>
 <CAOVqfW-1YurDwJbKDgUJdQZVxJ_rWDg-x+28++SZtg-vPO4kYg@mail.gmail.com>
 <20151026181430.GA13239@google.com> <562E7667.5050406@broadcom.com>
 <CAOVqfW8g2w=u8fO5GTa=5Hw_OOPS6NcGFg3TiLbCPny14id0VQ@mail.gmail.com>
 <20151027204023.GV13239@google.com>
Date: Mon, 2 Nov 2015 15:10:05 -0800
Message-ID: <CAOVqfW_HXf9E4JNBHOCgAk7rpGexhpKHyfrQvSR7e3poiSHi2A@mail.gmail.com>
Subject: Re: [PATCH] mtd: brcmnand: Fix NAND_CMD_PARAM byte order
From: Clay McClure <clay@daemons.net>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 27, 2015 at 1:40 PM, Brian Norris
<computersforpeace@gmail.com> wrote:

>> If we continue to use LE APB
>> transfers, then I think we can exclude the be32_to_cpu() call from
>> Brian's patch.
>
> I don't believe we can safely drop the be32_to_cpu(). That is just a
> refactoring of the existing logic. Please stop suggesting ways to break
> STB SoCs.

Yes, you're right; I misunderstood your patch. Thanks for your patient
explanation! :-)

>> Brian, I'll test a variation of this patch on our iProc-based
>> platforms and report back.
>
> OK, getting testing feedback from an iProc-based system using ONFI would
> be somewhat illuminating.

I've tested your refactoring patch [1] on Helix4 (an iProc-based
switch chip); seems to work fine.

Thanks,

Clay

[1] http://patchwork.ozlabs.org/patch/536148/
