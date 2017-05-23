Received: from mail-it0-x230.google.com ([2607:f8b0:4001:c0b::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dD5sI-00038V-Go
 for linux-mtd@lists.infradead.org; Tue, 23 May 2017 09:13:08 +0000
Received: by mail-it0-x230.google.com with SMTP id o5so15558487ith.1
 for <linux-mtd@lists.infradead.org>; Tue, 23 May 2017 02:12:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <d16c41b5f7022add66672d43b5d595af74a1db34.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
 <d16c41b5f7022add66672d43b5d595af74a1db34.1495157082.git.mchehab@s-opensource.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 May 2017 11:12:43 +0200
Message-ID: <CACRpkdaDZQQ7fprGkSvXiUHfqdM_zGkPe4_T3R-p55asCDeQCw@mail.gmail.com>
Subject: Re: [PATCH 01/29] pinctrl.txt: standardize document format
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 19, 2017 at 3:25 AM, Mauro Carvalho Chehab
<mchehab@s-opensource.com> wrote:

> Each text file under Documentation follows a different
> format. Some doesn't even have titles!
>
> Change its representation to follow the adopted standard,
> using ReST markups for it to be parseable by Sphinx.
>
> This document is almost following the standard stile.
>
> There are only two things to adjust on it:
>
> - promote the level of the document title;
> - mark literal blocks as such.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>

I applied the patch fixing some of the indentation mistakes pointed
out by Geert.

Should the file be renamed pinctrl.rst now?

Yours,
Linus Walleij
