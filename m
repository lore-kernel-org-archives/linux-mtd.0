Received: from mail-oi0-x22a.google.com ([2607:f8b0:4003:c06::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJKyq-0008MQ-8b
 for linux-mtd@lists.infradead.org; Wed, 13 Jan 2016 12:56:53 +0000
Received: by mail-oi0-x22a.google.com with SMTP id k206so93352030oia.1
 for <linux-mtd@lists.infradead.org>; Wed, 13 Jan 2016 04:56:31 -0800 (PST)
MIME-Version: 1.0
Sender: romain.izard@mobile-devices.fr
In-Reply-To: <56963918.7040809@atmel.com>
References: <1452609223-14790-1-git-send-email-romain.izard.pro@gmail.com>
 <56951F91.1090101@atmel.com>
 <CAGkQfmOmgiKwziQ+HuJTN1Qk1aHEXBWYcE1LT+XT2d-Xv7kxNw@mail.gmail.com>
 <56963918.7040809@atmel.com>
From: Romain Izard <romain.izard.pro@gmail.com>
Date: Wed, 13 Jan 2016 13:56:11 +0100
Message-ID: <CAGkQfmNDZmKDJYMuVizbb-+3nXX2DAqDCOf8qE0DNR-3Y2Etcg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] mtd: atmel_nand: Add support for NAND Flash on
 SAMA5D2
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 "Yang, Wenyou" <Wenyou.Yang@atmel.com>, rainyfeeling@outlook.com,
 Josh Wu <josh.wu@atmel.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2016-01-13 12:46 GMT+01:00 Nicolas Ferre <nicolas.ferre@atmel.com>:
>> Ok. It might be a good idea to update the MAINTAINERS file, as Josh Wu's
>> atmel address now bounces, and it is still referenced there.
>
> It's already done and pushed to arm-soc. It's in linux-next:
> http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/MAINTAINERS#n2000
>
> It will appear in Linus' tree in a couple of days ;-)
>
Good. As I based my developments on the linux-4.1-at91 branch from the Linux4SAM
github which does not contain the update, I missed it.

>>> I also think that Wenyou did some work regarding this support. So you'll
>>> have to coordinat together.
>>
>> Is it possible to know what are the developments in progress regarding
>> SAMA5D2 drivers? The github repository does not expose any working trees,
>> and only the
>
> Which github repository are you talking about?
>
> The Linux4SAM github contains all that is need to work with sama5d2
> (linux-4.1-at91 branch):
> https://github.com/linux4sam/linux-at91/tree/linux-4.1-at91

That's the one. My point is that there is no hint in there that Wenyou worked
on supporting the NAND controller for SAMA5D2. So I wondered if there were
other repositories I missed with more recent information.

> Developments in progress are listed in the Linux4SAM page:
> http://www.at91.com/linux4sam/bin/view/Linux4SAM/Sama5d2XplainedMainPage
>
> I admit that it's not copleted, but you'll have an idea here as well:
> http://www.at91.com/linux4sam/bin/view/Linux4SAM/Sama5d2XplainedMainPage
>
Both URLs are the same, are you sure it's the correct link? It's a very
informative page and I often use it when I need information on the SAMA5D2.
But I have a hard time finding something about work in progress in it.


Best regards,
-- 
Romain Izard
