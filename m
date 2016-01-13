Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJJt9-0001M1-AD
 for linux-mtd@lists.infradead.org; Wed, 13 Jan 2016 11:46:56 +0000
Subject: Re: [RFC PATCH 0/4] mtd: atmel_nand: Add support for NAND Flash on
 SAMA5D2
To: Romain Izard <romain.izard.pro@gmail.com>
References: <1452609223-14790-1-git-send-email-romain.izard.pro@gmail.com>
 <56951F91.1090101@atmel.com>
 <CAGkQfmOmgiKwziQ+HuJTN1Qk1aHEXBWYcE1LT+XT2d-Xv7kxNw@mail.gmail.com>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>, "Yang,
 Wenyou" <Wenyou.Yang@atmel.com>, <rainyfeeling@outlook.com>, Josh Wu
 <josh.wu@atmel.com>
From: Nicolas Ferre <nicolas.ferre@atmel.com>
Message-ID: <56963918.7040809@atmel.com>
Date: Wed, 13 Jan 2016 12:46:32 +0100
MIME-Version: 1.0
In-Reply-To: <CAGkQfmOmgiKwziQ+HuJTN1Qk1aHEXBWYcE1LT+XT2d-Xv7kxNw@mail.gmail.com>
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

Le 12/01/2016 17:55, Romain Izard a écrit :
> Hi Nicolas,
> 
> 2016-01-12 16:45 GMT+01:00 Nicolas Ferre <nicolas.ferre@atmel.com>:
>>
>> The maintainers for this driver changed very recently, so you'll have to
>> includes these names to your CC list:
>>
>> M:      Wenyou Yang <wenyou.yang@atmel.com>
>> M:      Josh Wu <rainyfeeling@outlook.com>
> 
> Ok. It might be a good idea to update the MAINTAINERS file, as Josh Wu's atmel
> address now bounces, and it is still referenced there.

It's already done and pushed to arm-soc. It's in linux-next:
http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/MAINTAINERS#n2000

It will appear in Linus' tree in a couple of days ;-)

>> I also think that Wenyou did some work regarding this support. So you'll
>> have to coordinat together.
> 
> Is it possible to know what are the developments in progress regarding SAMA5D2
> drivers? The github repository does not expose any working trees, and only the

Which github repository are you talking about?

The Linux4SAM github contains all that is need to work with sama5d2
(linux-4.1-at91 branch):
https://github.com/linux4sam/linux-at91/tree/linux-4.1-at91

Developments in progress are listed in the Linux4SAM page:
http://www.at91.com/linux4sam/bin/view/Linux4SAM/Sama5d2XplainedMainPage

I admit that it's not copleted, but you'll have an idea here as well:
http://www.at91.com/linux4sam/bin/view/Linux4SAM/Sama5d2XplainedMainPage

Bye,
-- 
Nicolas Ferre
