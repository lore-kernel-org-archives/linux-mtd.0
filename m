Received: from mail-lb0-x233.google.com ([2a00:1450:4010:c04::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKwWD-0003hD-DC
 for linux-mtd@lists.infradead.org; Mon, 09 Feb 2015 22:09:25 +0000
Received: by mail-lb0-f179.google.com with SMTP id w7so8530658lbi.10
 for <linux-mtd@lists.infradead.org>; Mon, 09 Feb 2015 14:09:02 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 9 Feb 2015 20:09:02 -0200
Message-ID: <CAOMZO5BgY1YXdnoKpZJW6k9AdrDFZH=6mdCfuB=9aSVZukAV8A@mail.gmail.com>
Subject: m25p80 spi1.0: unrecognized JEDEC id
From: Fabio Estevam <festevam@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Cc: Huang Shijie <shijie8@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Running linux-next 20150209 on a mx28evk I see that m25p80 is not
detected correctly:

m25p80 spi1.0: unrecognized JEDEC id bytes: bf, 24, 40

On 3.19 it probes fine though:

m25p80 spi1.0: sst25vf016b (2048 Kbytes)

I can start bisecting it, but just wondering if someone is aware of
this issue or has any ideas.

Thanks,

Fabio Estevam
