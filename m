Received: from mail-qt0-x232.google.com ([2607:f8b0:400d:c0d::232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIh68-00008h-9V
 for linux-mtd@lists.infradead.org; Tue, 15 May 2018 21:03:09 +0000
Received: by mail-qt0-x232.google.com with SMTP id j42-v6so2230724qtj.12
 for <linux-mtd@lists.infradead.org>; Tue, 15 May 2018 14:02:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180515223516.16e907b3@bbrezillon>
References: <1525920400-11392-1-git-send-email-Jane.Wan@nokia.com>
 <20180510140311.02805561@bbrezillon>
 <CAHp75VcET7PZYfeRkmiP=n_xCnDzEFYS98ZLjszc1fHjdfDF2A@mail.gmail.com>
 <20180515093525.051856dd@bbrezillon>
 <CAHp75VevZCGOntYdj_B0T_SOKXFkWKLgyL2+1g2X9nRyhP5w=g@mail.gmail.com>
 <20180515100304.3daa7929@bbrezillon>
 <CAHp75VeEhB=+x0toCtSvrq0zBLXVCASzN2BUDDgNParSYZc5BQ@mail.gmail.com>
 <20180515223516.16e907b3@bbrezillon>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 16 May 2018 00:02:52 +0300
Message-ID: <CAHp75VeA4nGUHz1L+ugX_F-aDTKoheqgnZ7zJKNKQmuRZ5pD5w@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] mtd: rawnand: use bit-wise majority to recover the
 contents of ONFI parameter
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: jagdish.gediya@nxp.com, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jane Wan <Jane.Wan@nokia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, ties.bos@nokia.com,
 prabhakar.kushwaha@nxp.com,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Shreeya Patel <shreeya.patel23498@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 15, 2018 at 11:35 PM, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> On Tue, 15 May 2018 23:23:02 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> I made a mistake in my code sample, it's
>
>                                 if (srcbuf[i] & BIT(j))
>
> If you look at v6, you'll see it's been fixed by Jane.

In this case, indeed.

-- 
With Best Regards,
Andy Shevchenko
