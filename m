Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5Mmg-0002A0-Qj
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 01:39:24 +0000
Received: by mail-pg0-x242.google.com with SMTP id c2so8052750pga.2
 for <linux-mtd@lists.infradead.org>; Mon, 01 May 2017 18:39:02 -0700 (PDT)
Date: Mon, 1 May 2017 18:38:59 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PULL v3] mtd: nand: changes for 4.12
Message-ID: <20170502013859.GB142129@google.com>
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

On Sun, Apr 30, 2017 at 10:30:24AM +0200, Boris Brezillon wrote:
>   git@github.com:linux-nand/linux.git tags/nand/for-4.12

One more thing: I see you've got a new branch at l2-mtd.git. That's fine
with me, I suppose [1]. Are you going to include that in MAINTAINERS and
linux-next?

Brian

[1] Same for spi-nor stuff, esp. if Marek and Cyrille are looking for a
better location to share, if they don't like github so much.
