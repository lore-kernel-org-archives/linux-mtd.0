Received: from if09-mail-sr03-mia.mta.terra.com ([208.84.243.100])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OynEW-0002Vi-Ip
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 14:57:16 +0000
Message-ID: <6E1A182A06054C5A99BD3C0D3202C24F@THOR>
From: =?iso-8859-1?Q?Fl=E1vio_Silveira?= <fggs@terra.com.br>
To: "Yegor Yefremov" <yegorslists@googlemail.com>
References: <E73F778B634944A0B8D4333B7BD012E4@THOR><AANLkTin2b-QovauogfjMZP_7KeChY5oWsMPFBAiC2ERE@mail.gmail.com><74A5BE60138147F696E151AACD52EDEE@THOR><AANLkTintkdKGpkUGMkgGbVK6Pb3cttspwnuPQR=DJxnm@mail.gmail.com><D3A375B91F5944B38630B07214914DF8@THOR><AANLkTinotjfB26VPmF7_vx8M1kX5cYMzygFMk8X6exww@mail.gmail.com><341EADF720C14B4F86C63204D9C60723@THOR>
	<AANLkTikXbKZLFOCBDkrwgVPJEYTwF88xBtYFnwaTQH+5@mail.gmail.com>
In-Reply-To: <AANLkTikXbKZLFOCBDkrwgVPJEYTwF88xBtYFnwaTQH+5@mail.gmail.com>
Subject: Re: [Help] SST39VF6401B Support
Date: Thu, 23 Sep 2010 11:56:38 -0300
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
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

I think I might found something:

In cfi_probe.c, starting at line 222, there are these lines:

cfi_send_gen_cmd(0xaa, addr_unlock1, base, map, cfi, cfi->device_type, 
NULL);
cfi_send_gen_cmd(0x55, addr_unlock2, base, map, cfi, cfi->device_type, 
NULL);
cfi_send_gen_cmd(0x90, addr_unlock1, base, map, cfi, cfi->device_type, 
NULL);

Which seems the correct way to CFI query the chip, but the last line is 
0x90.
Datasheet states that 0x90 is Software ID and CFI Query Entry is 0x98

Could that be the problem?

Regards,

Flavio

----- Original Message ----- 
From: "Yegor Yefremov" <yegorslists@googlemail.com>
To: "Flávio Silveira" <fggs@terra.com.br>
Cc: <linux-mtd@lists.infradead.org>
Sent: Thursday, September 23, 2010 10:45 AM
Subject: Re: [Help] SST39VF6401B Support


>> It's kernel 2.6.23 with some patches, they call it 2.6.24.111
>
> It is really old! This is a gap of more than 10 kernel versions! Any
> chance to get something newer? 2.6.35?
>
> I could imagine, that the patches mentioned in this thread could fail
> due to old kernel. Many things like JEDEC and CFI probes were greatly
> improved since then. I tested my patch for 2.6.29. .27 and .28 may
> also work.
>
> Yegor
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
