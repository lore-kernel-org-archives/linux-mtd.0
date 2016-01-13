Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJMbw-0003gq-AG
 for linux-mtd@lists.infradead.org; Wed, 13 Jan 2016 14:41:21 +0000
Subject: Re: [RFC PATCH 0/4] mtd: atmel_nand: Add support for NAND Flash on
 SAMA5D2
To: Romain Izard <romain.izard.pro@gmail.com>
References: <1452609223-14790-1-git-send-email-romain.izard.pro@gmail.com>
 <56951F91.1090101@atmel.com>
 <CAGkQfmOmgiKwziQ+HuJTN1Qk1aHEXBWYcE1LT+XT2d-Xv7kxNw@mail.gmail.com>
 <56963918.7040809@atmel.com>
 <CAGkQfmNDZmKDJYMuVizbb-+3nXX2DAqDCOf8qE0DNR-3Y2Etcg@mail.gmail.com>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>, "Yang,
 Wenyou" <Wenyou.Yang@atmel.com>, <rainyfeeling@outlook.com>, Josh Wu
 <josh.wu@atmel.com>
From: Nicolas Ferre <nicolas.ferre@atmel.com>
Message-ID: <569661FA.6090904@atmel.com>
Date: Wed, 13 Jan 2016 15:40:58 +0100
MIME-Version: 1.0
In-Reply-To: <CAGkQfmNDZmKDJYMuVizbb-+3nXX2DAqDCOf8qE0DNR-3Y2Etcg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 13/01/2016 13:56, Romain Izard a écrit :
> 2016-01-13 12:46 GMT+01:00 Nicolas Ferre <nicolas.ferre@atmel.com>:
>>> Ok. It might be a good idea to update the MAINTAINERS file, as Josh Wu's
>>> atmel address now bounces, and it is still referenced there.
>>
>> It's already done and pushed to arm-soc. It's in linux-next:
>> http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/MAINTAINERS#n2000
>>
>> It will appear in Linus' tree in a couple of days ;-)
>>
> Good. As I based my developments on the linux-4.1-at91 branch from the Linux4SAM
> github which does not contain the update, I missed it.
> 
>>>> I also think that Wenyou did some work regarding this support. So you'll
>>>> have to coordinat together.
>>>
>>> Is it possible to know what are the developments in progress regarding
>>> SAMA5D2 drivers? The github repository does not expose any working trees,
>>> and only the
>>
>> Which github repository are you talking about?
>>
>> The Linux4SAM github contains all that is need to work with sama5d2
>> (linux-4.1-at91 branch):
>> https://github.com/linux4sam/linux-at91/tree/linux-4.1-at91
> 
> That's the one. My point is that there is no hint in there that Wenyou worked
> on supporting the NAND controller for SAMA5D2. So I wondered if there were
> other repositories I missed with more recent information.

Yes, that's very recent actually and we were testing internally just
before releasing it.
The reason is also that we didn't have a NAND flash on our reference
platform which is the SAMA5D2 Xplained. So we had to wait for a new
hardware from our colleagues of the HW team and bring it up before
working on this NAND flash support (24 bits ECC and sama5d2 new
modifications in fact).

>> Developments in progress are listed in the Linux4SAM page:
>> http://www.at91.com/linux4sam/bin/view/Linux4SAM/Sama5d2XplainedMainPage
>>
>> I admit that it's not copleted, but you'll have an idea here as well:
>> http://www.at91.com/linux4sam/bin/view/Linux4SAM/Sama5d2XplainedMainPage

Yes, I was meaning:
http://www.at91.com/linux4sam/bin/view/Linux4SAM/LinuxKernel#Tags

> Both URLs are the same, are you sure it's the correct link? It's a very
> informative page and I often use it when I need information on the SAMA5D2.
> But I have a hard time finding something about work in progress in it.

Yes, we lack this kind of important information. It's scattered on some
messages on the arm-linux-kernel mailing-list as we tend to publish
pretty early in our work process (Cf. the new ADC driver by Ludovic). I
don't promise but we will try to enhance this aspect in the near
future... ;-)

Thanks for your work and your feedback.

Bye,
-- 
Nicolas Ferre
