Received: from mail-yw0-f197.google.com ([209.85.211.197])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1ODjLX-0006ye-Q0
	for linux-mtd@lists.infradead.org; Sun, 16 May 2010 19:17:56 +0000
Received: by ywh35 with SMTP id 35so764842ywh.24
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 May 2010 12:17:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4BF041A3.70304@shemesh.biz>
References: <4BF011D7.4010907@shemesh.biz>
	<AANLkTilU5vfVxCH9Ch7K6IUQAImLN83fewQdBptzeWiX@mail.gmail.com>
	<4BF041A3.70304@shemesh.biz>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Sun, 16 May 2010 15:17:34 -0400
Message-ID: <AANLkTikIBhFudwi5DiiqROyhQjOSjJnyxxVoWLrE9ztj@mail.gmail.com>
Subject: Re: Wrong flash type in m25p80 driver
To: Shachar Shemesh <shachar@shemesh.biz>
Content-Type: text/plain; charset=UTF-8
Cc: Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, May 16, 2010 at 15:04, Shachar Shemesh wrote:
> Mike Frysinger wrote:
>> 2010/5/16 Shachar Shemesh:
>>> The second problem I'm having with this driver is that it reports itself as
>>> NOR flash.
>>
>> the response is: so what ?  you havent described how this is
>> problematic in any way.
>
> Then why have flash type at all, if no-one cares?

so your answer is "there is no problem with calling it NOR flash"

if it looks like a duck, quacks like a duck, and walks like a duck,
then why waste time calling it a DataDuck ?  for all intents and
purposes, all the kernel code/utilities that work with the flashes can
treat these SPI flashes as NOR flashes and everything works fine.

> Either way, the patch in my previous message is intended for inclusion.

it isnt acceptable in the current format.  so until you clean it up
and submit it properly, nothing is going to happen.

this of course ignores the errors in the patch like calling it
DataFlash which you yourself clearly have shown is wrong.  DataFlash
is a special type of flash made by Atmel.  it has properties which
other SPI flashes do not.
-mike
