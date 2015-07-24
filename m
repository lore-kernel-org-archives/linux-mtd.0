Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIivv-0000vN-3y
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 19:47:03 +0000
Received: by oibn4 with SMTP id n4so24639050oib.3
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jul 2015 12:46:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150724194240.GK8876@google.com>
References: <1437761188-8179-1-git-send-email-Frank.Li@freescale.com>
 <20150724194240.GK8876@google.com>
Date: Fri, 24 Jul 2015 14:46:40 -0500
Message-ID: <CAHrpEqQjtRod28-9P6wGQ6t8VrZs3GTjybK7BmpO4Pxf7Mm72g@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] mtd: spi-nor: fsl-quadspi fix and added i.mx7d and
 i.mxul support
From: Zhi Li <lznuaa@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "Frank.Li@freescale.com" <Frank.Li@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Allen Xu <b45815@freescale.com>, Han Xu <han.xu@freescale.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 24, 2015 at 2:42 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Sat, Jul 25, 2015 at 02:06:20AM +0800, Frank.Li@freescale.com wrote:
>> From: Frank Li <Frank.Li@freescale.com>
>>
>> rebase to l2-mtd/next
>>
>> Resend whole serial patch
>
> Han Xu (listed in MAINTAINERS) has graciously ack'd all of your patches.
> In the future, please include those next to the Signed-off-by's when you
> resend, unless you've had to make major changes.

Okay, b45815@freescale.com is Han xu's email address.

best regards
Frank Li

>
> I also notice that you failed to CC him. scripts/get_maintainer.pl
> should have suggested you include him.
>
> Brian
