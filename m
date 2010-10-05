Received: from if04-mail-sr05-mia.mta.terra.com ([208.84.243.52])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P34Rn-00048l-20
	for linux-mtd@lists.infradead.org; Tue, 05 Oct 2010 10:08:36 +0000
Message-ID: <8129711D4006470194ABF97D154047CF@THOR>
From: =?UTF-8?Q?Fl=C3=A1vio_Silveira?= <fggs@terra.com.br>
To: "Guillaume LECERF" <glecerf@gmail.com>
References: <E73F778B634944A0B8D4333B7BD012E4@THOR>
	<AANLkTin2b-QovauogfjMZP_7KeChY5oWsMPFBAiC2ERE@mail.gmail.com><74A5BE60138147F696E151AACD52EDEE@THOR><AANLkTintkdKGpkUGMkgGbVK6Pb3cttspwnuPQR=DJxnm@mail.gmail.com><D3A375B91F5944B38630B07214914DF8@THOR><AANLkTinotjfB26VPmF7_vx8M1kX5cYMzygFMk8X6exww@mail.gmail.com><341EADF720C14B4F86C63204D9C60723@THOR><AANLkTikXbKZLFOCBDkrwgVPJEYTwF88xBtYFnwaTQH+5@mail.gmail.com><6E1A182A06054C5A99BD3C0D3202C24F@THOR><AANLkTi=qZ_wYcHHfKjaJsvf-ODgnECDOTEHmuorpA7K2@mail.gmail.com><DB610A768D2B46C7A888B2DBECEBEC79@THOR>
	<AANLkTi=7WAJL4S5jJQQAHSp=KK2t5a5BwSow5r7Mco99@mail.gmail.com>
In-Reply-To: <AANLkTi=7WAJL4S5jJQQAHSp=KK2t5a5BwSow5r7Mco99@mail.gmail.com>
Subject: Re: [Help] SST39VF6401B Support
Date: Tue, 5 Oct 2010 07:07:52 -0300
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

Actually yes, I applied your patch to kernel 2.6.35.4 and it detects the 
chip.
I just need to test without your patch to see the difference.

My problem is that dd-wrt an old kernel (2.6.24) and I couldn't port all 
fixes
and openwrt doesn't support my router's lan switch, but I can send you the 
logs if you want.

Thanks for your feedback on this


----- Original Message ----- 
From: "Guillaume LECERF" <glecerf@gmail.com>
To: "Flávio Silveira" <fggs@terra.com.br>
Cc: <linux-mtd@lists.infradead.org>
Sent: Tuesday, October 05, 2010 6:38 AM
Subject: Re: [Help] SST39VF6401B Support


2010/9/24 Flávio Silveira <fggs@terra.com.br>:
> Hi Guillaume,
>
> I tried another router firmware with kernel 2.6.34.5, downloaded
> mtd-2.6.git and pasted chips folder and "linux/mtd" headers, applied your
> last patch and kernel compiled fine.
> I've also enabled debug in kernel and cfi. Should I paste console log in
> message body or should I attach a file with the log?
> I had an error but I don't know if it's related to mtd or the firmware,
> because my router is not officialy supported.

Any news on this one ?

-- 
Guillaume LECERF
GeeXboX developer - www.geexbox.org
