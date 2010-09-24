Received: from if05-mail-sr05-mia.mta.terra.com ([208.84.243.62])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz5xS-0004U7-JZ
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 10:56:53 +0000
Message-ID: <DB610A768D2B46C7A888B2DBECEBEC79@THOR>
From: =?UTF-8?Q?Fl=C3=A1vio_Silveira?= <fggs@terra.com.br>
To: "Guillaume LECERF" <glecerf@gmail.com>
References: <E73F778B634944A0B8D4333B7BD012E4@THOR><AANLkTin2b-QovauogfjMZP_7KeChY5oWsMPFBAiC2ERE@mail.gmail.com><74A5BE60138147F696E151AACD52EDEE@THOR><AANLkTintkdKGpkUGMkgGbVK6Pb3cttspwnuPQR=DJxnm@mail.gmail.com><D3A375B91F5944B38630B07214914DF8@THOR><AANLkTinotjfB26VPmF7_vx8M1kX5cYMzygFMk8X6exww@mail.gmail.com><341EADF720C14B4F86C63204D9C60723@THOR><AANLkTikXbKZLFOCBDkrwgVPJEYTwF88xBtYFnwaTQH+5@mail.gmail.com><6E1A182A06054C5A99BD3C0D3202C24F@THOR>
	<AANLkTi=qZ_wYcHHfKjaJsvf-ODgnECDOTEHmuorpA7K2@mail.gmail.com>
In-Reply-To: <AANLkTi=qZ_wYcHHfKjaJsvf-ODgnECDOTEHmuorpA7K2@mail.gmail.com>
Subject: Re: [Help] SST39VF6401B Support
Date: Fri, 24 Sep 2010 07:56:19 -0300
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

  I tried another router firmware with kernel 2.6.34.5, downloaded 
mtd-2.6.git and pasted chips folder and "linux/mtd" headers, applied your 
last patch and kernel compiled fine.
  I've also enabled debug in kernel and cfi. Should I paste console log in 
message body or should I attach a file with the log?
  I had an error but I don't know if it's related to mtd or the firmware, 
because my router is not officialy supported.

Regards,
  Flavio

----- Original Message ----- 
From: "Guillaume LECERF" <glecerf@gmail.com>
To: "Flávio Silveira" <fggs@terra.com.br>
Cc: <linux-mtd@lists.infradead.org>; "Yegor Yefremov" 
<yegorslists@googlemail.com>
Sent: Thursday, September 23, 2010 12:33 PM
Subject: Re: [Help] SST39VF6401B Support


2010/9/23 Flávio Silveira <fggs@terra.com.br>:
> I think I might found something:
>
> In cfi_probe.c, starting at line 222, there are these lines:
>
> cfi_send_gen_cmd(0xaa, addr_unlock1, base, map, cfi, cfi->device_type,
> NULL);
> cfi_send_gen_cmd(0x55, addr_unlock2, base, map, cfi, cfi->device_type,
> NULL);
> cfi_send_gen_cmd(0x90, addr_unlock1, base, map, cfi, cfi->device_type,
> NULL);
>
> Which seems the correct way to CFI query the chip, but the last line is
> 0x90.
> Datasheet states that 0x90 is Software ID and CFI Query Entry is 0x98
>
> Could that be the problem?

No. This snippet comes from the function in charge of identifying the
chip and its capacities.

CFI Query Entry (0x98) is handled by cfi_qry_mode_on() in cfi_util.c.
Humm...
Could you try the attached patch ?

-- 
Guillaume LECERF
GeeXboX developer - www.geexbox.org



--------------------------------------------------------------------------------


> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
