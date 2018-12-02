Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTNEM-0005SY-Rx
 for linux-mtd@lists.infradead.org; Sun, 02 Dec 2018 08:36:00 +0000
Received: by mail-it1-x141.google.com with SMTP id g85so4797246ita.3
 for <linux-mtd@lists.infradead.org>; Sun, 02 Dec 2018 00:35:48 -0800 (PST)
MIME-Version: 1.0
References: <20181202073202.10587-1-tiny.windzz@gmail.com>
 <20181202091543.73c74aea@bbrezillon>
In-Reply-To: <20181202091543.73c74aea@bbrezillon>
From: Frank Lee <tiny.windzz@gmail.com>
Date: Sun, 2 Dec 2018 16:35:20 +0800
Message-ID: <CAEExFWtRoC2dQd_6B5d1c1tt-stdSa4jafBNTsUWJxrZkczfkw@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: remove DEBUGFS_RO_ATTR()
To: boris.brezillon@bootlin.com
Cc: robert.jarzmik@free.fr, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 richard@nod.at, miquel.raynal@bootlin.com, Kees Cook <keescook@chromium.org>,
 Shreeya Patel <shreeya.patel23498@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 2, 2018 at 4:15 PM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
>
> Looks like getting rid of DEBUGFS_RO_ATTR() is just one of the change
> you do. I think you should change the subject line:
>
> "mtd: use DEFINE_SHOW_ATTRIBUTE() instead of open-coding it"
>
> This way it covers all of your changes.
>
> On Sun,  2 Dec 2018 02:32:02 -0500
> Yangtao Li <tiny.windzz@gmail.com> wrote:
>
> > We already have the DEFINE_SHOW_ATTRIBUTE.There is no need to define
>
>                                             ^ missing space
>
> > such a macro,so remove DEBUGFS_RO_ATTR.Also use DEFINE_SHOW_ATTRIBUTE
>
>                ^ here as well
>
> > to simplify some code.
>
> If you go for the new subject line, you'll have to change this commit
> message.
How about the newer?

MBR,
Yangtao
