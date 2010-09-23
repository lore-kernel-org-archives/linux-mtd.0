Received: from if04-mail-sr02-mia.mta.terra.com ([208.84.243.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oyl0X-0007Au-7T
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 12:34:38 +0000
Message-ID: <5CF3F2DC51EE44339A376A026CA04E36@THOR>
From: =?UTF-8?Q?Fl=C3=A1vio_Silveira?= <fggs@terra.com.br>
To: "Guillaume LECERF" <glecerf@gmail.com>,
	"Wolfram Sang" <w.sang@pengutronix.de>
References: <E73F778B634944A0B8D4333B7BD012E4@THOR>
	<AANLkTin2b-QovauogfjMZP_7KeChY5oWsMPFBAiC2ERE@mail.gmail.com><74A5BE60138147F696E151AACD52EDEE@THOR><20100923120534.GD2994@pengutronix.de>
	<AANLkTikU011z8uK8axjmzqpyepRHNgnyNupZzJSxkWTa@mail.gmail.com>
In-Reply-To: <AANLkTikU011z8uK8axjmzqpyepRHNgnyNupZzJSxkWTa@mail.gmail.com>
Subject: Re: [Help] SST39VF6401B Support
Date: Thu, 23 Sep 2010 09:34:12 -0300
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="UTF-8"; reply-type=original
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Yegor Yefremov <yegorslists@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Guillaume,

  I know you asked for Wolfram logs but just for you to know, I tried 
enabling DEBUG_CFI but no new output than before.
  Never tried DEBUG_CFI_FEATURES though.
  What output should I expect from both? The only thing I see is "pflash: 
cfi_probe failed"

Regards,
  Flavio

----- Original Message ----- 
From: "Guillaume LECERF" <glecerf@gmail.com>
To: "Wolfram Sang" <w.sang@pengutronix.de>
Cc: "Flávio Silveira" <fggs@terra.com.br>; <linux-mtd@lists.infradead.org>; 
"Yegor Yefremov" <yegorslists@googlemail.com>
Sent: Thursday, September 23, 2010 9:23 AM
Subject: Re: [Help] SST39VF6401B Support


2010/9/23 Wolfram Sang <w.sang@pengutronix.de>:
>
>> Thanks for your response. Does this mean this chip isn't CFI
>> compliant? Like, datasheet says it is, but not really.
>
> SST? Broken CFI happened to me, too :(
> http://patchwork.ozlabs.org/patch/51027/

This patch [1] (tried to) add support for your chip.
According to the datasheet [2], it uses addr_unlock1 = 0x555 and
addr_unlock2 = 0x2AA, and has no extended query table.
So this chip must be handled by the fixup_sst39vf_rev_b() fixup function.

Could you provide us with a more detailed log, i.e. with
DEBUG_CFI_FEATURES enabled in cfi_cmdset_0002.c and DEBUG_CFI in
cfi_probe.c ?


[1] http://patchwork.ozlabs.org/patch/50906/
[2] http://www.sst.com/dotAsset/40661.pdf
-- 
Guillaume LECERF
GeeXboX developer - www.geexbox.org
