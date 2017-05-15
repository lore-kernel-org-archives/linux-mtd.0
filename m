Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAFvg-00053p-IC
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 13:20:54 +0000
Date: Mon, 15 May 2017 15:20:20 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Mario Rugiero <mrugiero@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3] mtd: nand: add option to erase NAND blocks even if
 detected as bad.
Message-ID: <20170515152020.691685c7@bbrezillon>
In-Reply-To: <CAKKQwLQW9Zaye=9wTLXxaTr3uEhgmOH3gewM+jnHLO9MAQ5+MQ@mail.gmail.com>
References: <20170512053957.10426-1-mrugiero@gmail.com>
 <20170512073946.812-1-mrugiero@gmail.com>
 <20170515102158.798f83f2@bbrezillon>
 <c373f192-99b2-2357-5c6b-dbc585b08169@nod.at>
 <20170515114159.655309cf@bbrezillon>
 <f47ffee8-a40d-0fc1-65a7-99e1596ea9f0@nod.at>
 <20170515130520.6ffff277@bbrezillon>
 <CAKKQwLQW9Zaye=9wTLXxaTr3uEhgmOH3gewM+jnHLO9MAQ5+MQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 15 May 2017 10:16:51 -0300
Mario Rugiero <mrugiero@gmail.com> wrote:

> Hi all,
> 
> I took note of all of your feedback. I'll be waiting until wednesday
> for more feedback, and then provide two new patchsets.
> Patchset 1 will focus on creating the debugfs entries for mtd.
> Patchset 2 will add the ability to toggle force erasing to the debugfs.

Keep in mind that this should be done on a per device basis (one
debugfs dir per NAND device created under /sys/kernel/debug/mtd/nand/).

> Does that sound right to you?

Yep.

Thanks,

Boris
