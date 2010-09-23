Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oym7E-0006De-GU
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 13:45:37 +0000
Received: by qyk34 with SMTP id 34so2611232qyk.15
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 06:45:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <341EADF720C14B4F86C63204D9C60723@THOR>
References: <E73F778B634944A0B8D4333B7BD012E4@THOR>
	<AANLkTin2b-QovauogfjMZP_7KeChY5oWsMPFBAiC2ERE@mail.gmail.com>
	<74A5BE60138147F696E151AACD52EDEE@THOR>
	<AANLkTintkdKGpkUGMkgGbVK6Pb3cttspwnuPQR=DJxnm@mail.gmail.com>
	<D3A375B91F5944B38630B07214914DF8@THOR>
	<AANLkTinotjfB26VPmF7_vx8M1kX5cYMzygFMk8X6exww@mail.gmail.com>
	<341EADF720C14B4F86C63204D9C60723@THOR>
Date: Thu, 23 Sep 2010 15:45:35 +0200
Message-ID: <AANLkTikXbKZLFOCBDkrwgVPJEYTwF88xBtYFnwaTQH+5@mail.gmail.com>
Subject: Re: [Help] SST39VF6401B Support
From: Yegor Yefremov <yegorslists@googlemail.com>
To: =?UTF-8?Q?Fl=C3=A1vio_Silveira?= <fggs@terra.com.br>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> It's kernel 2.6.23 with some patches, they call it 2.6.24.111

It is really old! This is a gap of more than 10 kernel versions! Any
chance to get something newer? 2.6.35?

I could imagine, that the patches mentioned in this thread could fail
due to old kernel. Many things like JEDEC and CFI probes were greatly
improved since then. I tested my patch for 2.6.29. .27 and .28 may
also work.

Yegor
