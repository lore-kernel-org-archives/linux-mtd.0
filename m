Received: from if03-mail-sr01-mia.mta.terra.com ([208.84.243.38])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OykwX-0008H6-63
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 12:30:33 +0000
Message-ID: <D3A375B91F5944B38630B07214914DF8@THOR>
From: =?UTF-8?Q?Fl=C3=A1vio_Silveira?= <fggs@terra.com.br>
To: "Yegor Yefremov" <yegorslists@googlemail.com>
References: <E73F778B634944A0B8D4333B7BD012E4@THOR><AANLkTin2b-QovauogfjMZP_7KeChY5oWsMPFBAiC2ERE@mail.gmail.com><74A5BE60138147F696E151AACD52EDEE@THOR>
	<AANLkTintkdKGpkUGMkgGbVK6Pb3cttspwnuPQR=DJxnm@mail.gmail.com>
In-Reply-To: <AANLkTintkdKGpkUGMkgGbVK6Pb3cttspwnuPQR=DJxnm@mail.gmail.com>
Subject: Re: [Help] SST39VF6401B Support
Date: Thu, 23 Sep 2010 09:30:01 -0300
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="UTF-8"; reply-type=original
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ok, I'll see if I can build a firmware with jedec enabled and your patch. 
Thanks!

Regards,
  Flavio

----- Original Message ----- 
From: "Yegor Yefremov" <yegorslists@googlemail.com>
To: "Flávio Silveira" <fggs@terra.com.br>
Cc: <linux-mtd@lists.infradead.org>
Sent: Thursday, September 23, 2010 9:18 AM
Subject: Re: [Help] SST39VF6401B Support


> Thanks for your response. Does this mean this chip isn't CFI compliant?
> Like, datasheet says it is, but not really.
> Sorry if I sound confused, I've never messed with flashchips before so 
> names
> and terms are still complicated.

Just to apply the patch and see what happens. The most important part
of this patch is:

Please refer to the data sheets Table 6:
39VF6401B data sheet http://www.sst.com/downloads/datasheet/S71288.pdf
39VF6401 data sheet http://www.sst.com/downloads/datasheet/S71223-03.pdf

The difference in the 6th bus write cycle. 39VF6401B uses 0x50 and
39VF6401 uses 0x30.

Without this even if the chip gets detected you cannot write to it.

I haven't look at this since my try to submit this patch, so I don't
know how to fix the stuff for cfi_probe.

Regards,
Yegor
