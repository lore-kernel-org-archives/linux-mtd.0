Received: from mail-pd0-f177.google.com ([209.85.192.177])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKwfr-0000gY-M8
 for linux-mtd@lists.infradead.org; Mon, 09 Feb 2015 22:19:24 +0000
Received: by pdjy10 with SMTP id y10so11680139pdj.6
 for <linux-mtd@lists.infradead.org>; Mon, 09 Feb 2015 14:19:02 -0800 (PST)
Date: Mon, 9 Feb 2015 14:18:59 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: m25p80 spi1.0: unrecognized JEDEC id
Message-ID: <20150209221859.GS18140@ld-irv-0074>
References: <CAOMZO5BgY1YXdnoKpZJW6k9AdrDFZH=6mdCfuB=9aSVZukAV8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5BgY1YXdnoKpZJW6k9AdrDFZH=6mdCfuB=9aSVZukAV8A@mail.gmail.com>
Cc: Marek =?utf-8?B?VmHFoXV0?= <marex@denx.de>,
 Huang Shijie <shijie8@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 09, 2015 at 08:09:02PM -0200, Fabio Estevam wrote:
> Hi,
> 
> Running linux-next 20150209 on a mx28evk I see that m25p80 is not
> detected correctly:
> 
> m25p80 spi1.0: unrecognized JEDEC id bytes: bf, 24, 40

That's not good. I don't see anything in MTD's -next that should cause
that though.

> On 3.19 it probes fine though:
> 
> m25p80 spi1.0: sst25vf016b (2048 Kbytes)
> 
> I can start bisecting it, but just wondering if someone is aware of
> this issue or has any ideas.

I'm not aware of this. Please keep me updated if you find anything.

Brian
