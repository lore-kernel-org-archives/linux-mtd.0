Received: from if09-mail-sr02-mia.mta.terra.com ([208.84.243.99])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OymI3-000151-Az
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 13:56:48 +0000
Message-ID: <51B22523C5674E869E940EB49B0931CE@THOR>
From: =?iso-8859-1?Q?Fl=E1vio_Silveira?= <fggs@terra.com.br>
To: "Yegor Yefremov" <yegorslists@googlemail.com>
References: <E73F778B634944A0B8D4333B7BD012E4@THOR><AANLkTin2b-QovauogfjMZP_7KeChY5oWsMPFBAiC2ERE@mail.gmail.com><74A5BE60138147F696E151AACD52EDEE@THOR><AANLkTintkdKGpkUGMkgGbVK6Pb3cttspwnuPQR=DJxnm@mail.gmail.com><D3A375B91F5944B38630B07214914DF8@THOR><AANLkTinotjfB26VPmF7_vx8M1kX5cYMzygFMk8X6exww@mail.gmail.com><341EADF720C14B4F86C63204D9C60723@THOR>
	<AANLkTikXbKZLFOCBDkrwgVPJEYTwF88xBtYFnwaTQH+5@mail.gmail.com>
In-Reply-To: <AANLkTikXbKZLFOCBDkrwgVPJEYTwF88xBtYFnwaTQH+5@mail.gmail.com>
Subject: Re: [Help] SST39VF6401B Support
Date: Thu, 23 Sep 2010 10:56:21 -0300
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

Well, I never tried the patch for JEDEC as firmware doesn't use it yet.
 I'm still trying to build then test other things, thanks for your help!

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
