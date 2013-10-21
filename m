Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYAQr-0003wB-Cj
 for linux-mtd@lists.infradead.org; Mon, 21 Oct 2013 08:01:45 +0000
Message-ID: <5264DFF7.2090702@freescale.com>
Date: Mon, 21 Oct 2013 16:04:07 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: gpmi-mtd ecc regression
References: <CAJ+vNU1JWZp=JoBDJALh59yFybGZ0iQxMEYy8qvTFGDLhyRzqg@mail.gmail.com>	<52649FDA.1030804@freescale.com>
 <CAN8TOE9+ez=t-1n+jd5d3tu+EB9YJKFeM2RKAHBf059L5TYM7A@mail.gmail.com>
In-Reply-To: <CAN8TOE9+ez=t-1n+jd5d3tu+EB9YJKFeM2RKAHBf059L5TYM7A@mail.gmail.com>
Content-Type: text/plain; charset="ISO-2022-JP"
Content-Transfer-Encoding: 7bit
Cc: Tim Harvey <tharvey@gateworks.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

于 2013年10月21日 15:21, Brian Norris 写道:
> Well, we do prioritize "no regressions", rather than new features. So
> we may have to do this until a proper solution can be formed.
ok.

I will create a patch to fix this regression.
And it seems i have to add new devicetree property to enable the JFFS2
support.

thanks
Huang Shijie
