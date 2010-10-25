Received: from mail-qy0-f170.google.com ([209.85.216.170])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PAI9g-0005IU-DP
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2010 08:11:45 +0000
Received: by qyk32 with SMTP id 32so1327563qyk.15
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Oct 2010 01:11:43 -0700 (PDT)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <20101023102449.GB31623@pengutronix.de>
References: <20101022154015.11097.94660.stgit@dev.siriade.com>
	<20101022154020.11097.4024.stgit@dev.siriade.com>
	<20101023102449.GB31623@pengutronix.de>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Mon, 25 Oct 2010 10:11:21 +0200
Message-ID: <AANLkTim0ZnKoOmP3ZurS-wgZWTuB6QD5tXnYRsfyXqip@mail.gmail.com>
Subject: Re: [PATCH 2/4] mtd: cfi_cmdset_0002: make sector erase command
	variable
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Cc: zhangyd6@gmail.com, fggs@terra.com.br, linux-mtd@lists.infradead.org,
	David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/10/23 Wolfram Sang <w.sang@pengutronix.de>:
>> +static map_word sector_erase_cmd = CMD(0x30);
>
> Uh? A static one? Why not per device?

Hi Wolfram.
I knew it was ugly, but where would you store this value ?

> I'd also suggest to fold the next patch into this one, so the need for the
> change is more obvious.

Done locally.

-- 
Guillaume LECERF
GeeXboX developer - www.geexbox.org
