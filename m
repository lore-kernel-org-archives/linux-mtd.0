Received: from if03-mail-sr02-mia.mta.terra.com ([208.84.243.39])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OyjZ5-0007Pq-VL
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 11:02:15 +0000
Message-ID: <74A5BE60138147F696E151AACD52EDEE@THOR>
From: =?UTF-8?Q?Fl=C3=A1vio_Silveira?= <fggs@terra.com.br>
To: "Yegor Yefremov" <yegorslists@googlemail.com>
References: <E73F778B634944A0B8D4333B7BD012E4@THOR>
	<AANLkTin2b-QovauogfjMZP_7KeChY5oWsMPFBAiC2ERE@mail.gmail.com>
In-Reply-To: <AANLkTin2b-QovauogfjMZP_7KeChY5oWsMPFBAiC2ERE@mail.gmail.com>
Subject: Re: [Help] SST39VF6401B Support
Date: Thu, 23 Sep 2010 08:01:45 -0300
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

Hi Yegor,

  Thanks for your response. Does this mean this chip isn't CFI compliant? 
Like, datasheet says it is, but not really.
 Sorry if I sound confused, I've never messed with flashchips before so 
names and terms are still complicated.

Regards,
  Flavio

----- Original Message ----- 
From: "Yegor Yefremov" <yegorslists@googlemail.com>
To: "Flávio Silveira" <fggs@terra.com.br>
Cc: <linux-mtd@lists.infradead.org>
Sent: Thursday, September 23, 2010 4:28 AM
Subject: Re: [Help] SST39VF6401B Support


>> I'm new to this list, so I'm not sure if I'm doing it correctly.
>>
>> I'm trying to get this chip supported by the 3rd party router firmware I
>> use. The developer from this firmware applied latest patches from git but
>> console log still says "pflash: cfi_probe failed" and then kernel panic.
>>
>> I tried to enable some debug without success.
>>
>> Any help appreciated
>
> Some time ago I've got this flash chip working with this patch
> https://patchwork.kernel.org/patch/32333/. Try enabling JEDEC_PROBE in
> your kernel. Unfortunately I don't have such a system now to try this
> patch with a newer kernel.
>
> Regards,
> Yegor
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
