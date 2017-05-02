Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5LGw-0000C6-Lk
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 00:02:32 +0000
Received: by mail-pg0-x243.google.com with SMTP id s62so6545639pgc.0
 for <linux-mtd@lists.infradead.org>; Mon, 01 May 2017 17:02:08 -0700 (PDT)
Date: Mon, 1 May 2017 17:02:05 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PULL v3] mtd: nand: changes for 4.12
Message-ID: <20170502000205.GA12811@google.com>
References: <20170430103024.49ad3ebc@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170430103024.49ad3ebc@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Sun, Apr 30, 2017 at 10:30:24AM +0200, Boris Brezillon wrote:
> Hi Brian,
> 
> Here is a v3 fixing the things you pointed in v2.

Great, thanks.

> As you can see, the PR is pretty big compared to 4.11, and it's mainly
> due to the Denali driver rework/cleanup (which I'd like to thank
> Masahiro for), the addition of the per-vendor initialization
> infrastructure and the complete rewrite of the Atmel driver.
> 
> The rest of the commits are just simple fixes/improvements to existing
> drivers or to the core.
> 
> Let me know if you find new problems in this version.
> 
> Thanks,
> 
> Boris
> 
> Changes since v2:
> - Address coccicheck complaints in the new atmel driver (reported by
>   Brian Norris)
> 
> Changes since v1:
> - Fix a bug in the new Atmel NAND driver (reported by Alexandre
>   Belloni)
> 
> The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:
> 
>   Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)
> 
> are available in the git repository at:
> 
>   git@github.com:linux-nand/linux.git tags/nand/for-4.12

Pulled. There are a few small-ish problems (some commented, some not
yet). I plan to send some fixup patches for review soon.

> for you to fetch changes up to 9d2ee0a60b8bd9bef2a0082c533736d6a7b39873:
> 
>   mtd: nand: brcmnand: Check flash #WP pin status before nand erase/program (2017-04-25 14:18:42 +0200)

Brian
