Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dMFG2-0005TJ-D4
 for linux-mtd@lists.infradead.org; Sat, 17 Jun 2017 15:03:28 +0000
Date: Sat, 17 Jun 2017 12:03:01 -0300
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 01/29] pinctrl.txt: standardize document format
Message-ID: <20170617120301.057229bc@vento.lan>
In-Reply-To: <CACRpkdaDZQQ7fprGkSvXiUHfqdM_zGkPe4_T3R-p55asCDeQCw@mail.gmail.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
 <d16c41b5f7022add66672d43b5d595af74a1db34.1495157082.git.mchehab@s-opensource.com>
 <CACRpkdaDZQQ7fprGkSvXiUHfqdM_zGkPe4_T3R-p55asCDeQCw@mail.gmail.com>
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

Em Tue, 23 May 2017 11:12:43 +0200
Linus Walleij <linus.walleij@linaro.org> escreveu:

> On Fri, May 19, 2017 at 3:25 AM, Mauro Carvalho Chehab
> <mchehab@s-opensource.com> wrote:
> 
> > Each text file under Documentation follows a different
> > format. Some doesn't even have titles!
> >
> > Change its representation to follow the adopted standard,
> > using ReST markups for it to be parseable by Sphinx.
> >
> > This document is almost following the standard stile.
> >
> > There are only two things to adjust on it:
> >
> > - promote the level of the document title;
> > - mark literal blocks as such.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>  
> 
> I applied the patch fixing some of the indentation mistakes pointed
> out by Geert.

Thanks!

(sorry for not answering earlier... got sidetracked by two trips)

> Should the file be renamed pinctrl.rst now?

If you just rename it, Sphinx will complain because it doesn't
belong to any index.rst file. As this is part of drivers/, I guess
the right thing is to add it to driver-api book.

The enclosed patch should be doing it (it is based on linux-next).

Thanks,
Mauro

[PATCH] pinctrl.txt: move it to the driver-api book

As pinctrl describes a feature from drivers/base, place it at
the right book.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 3cf1acebc4ee..7c94ab50afed 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -43,6 +43,7 @@ available subsections can be seen below.
    80211/index
    uio-howto
    firmware/index
+   pinctl
    misc_devices
 
 .. only::  subproject and html
diff --git a/Documentation/pinctrl.txt b/Documentation/driver-api/pinctl.rst
similarity index 100%
rename from Documentation/pinctrl.txt
rename to Documentation/driver-api/pinctl.rst
