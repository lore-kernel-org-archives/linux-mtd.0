Received: from mail-lf0-x234.google.com ([2a00:1450:4010:c07::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAFsA-0002aK-Ei
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 13:17:17 +0000
Received: by mail-lf0-x234.google.com with SMTP id m18so10551475lfj.0
 for <linux-mtd@lists.infradead.org>; Mon, 15 May 2017 06:16:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170515130520.6ffff277@bbrezillon>
References: <20170512053957.10426-1-mrugiero@gmail.com>
 <20170512073946.812-1-mrugiero@gmail.com>
 <20170515102158.798f83f2@bbrezillon>
 <c373f192-99b2-2357-5c6b-dbc585b08169@nod.at>
 <20170515114159.655309cf@bbrezillon>
 <f47ffee8-a40d-0fc1-65a7-99e1596ea9f0@nod.at>
 <20170515130520.6ffff277@bbrezillon>
From: Mario Rugiero <mrugiero@gmail.com>
Date: Mon, 15 May 2017 10:16:51 -0300
Message-ID: <CAKKQwLQW9Zaye=9wTLXxaTr3uEhgmOH3gewM+jnHLO9MAQ5+MQ@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: nand: add option to erase NAND blocks even if
 detected as bad.
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I took note of all of your feedback. I'll be waiting until wednesday
for more feedback, and then provide two new patchsets.
Patchset 1 will focus on creating the debugfs entries for mtd.
Patchset 2 will add the ability to toggle force erasing to the debugfs.
Does that sound right to you?

Regards,
Mario.
