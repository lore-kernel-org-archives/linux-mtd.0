Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTNOB-0000ZC-Hc
 for linux-mtd@lists.infradead.org; Sun, 02 Dec 2018 08:46:08 +0000
Received: by mail-it1-x141.google.com with SMTP id b5so4422109iti.2
 for <linux-mtd@lists.infradead.org>; Sun, 02 Dec 2018 00:45:57 -0800 (PST)
MIME-Version: 1.0
References: <20181202083358.10896-1-tiny.windzz@gmail.com>
 <20181202093958.6419fd24@bbrezillon>
In-Reply-To: <20181202093958.6419fd24@bbrezillon>
From: Frank Lee <tiny.windzz@gmail.com>
Date: Sun, 2 Dec 2018 16:45:28 +0800
Message-ID: <CAEExFWvqhFBEO2eGm9UQsE9w3-cdkN7dRCk96YdBFzA6HjN0zA@mail.gmail.com>
Subject: Re: [PATCH] mtd: use DEFINE_SHOW_ATTRIBUTE() instead of open-coding it
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

On Sun, Dec 2, 2018 at 4:40 PM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
>
> Should be [PATCH v4]
>
> On Sun,  2 Dec 2018 03:33:58 -0500
> Yangtao Li <tiny.windzz@gmail.com> wrote:
>
> > DEFINE_SHOW_ATTRIBUTE macro can help us simplify the code,so change
> > to it.And change the DEBUGFS_RO_ATTR macro defined in some file to a
> > standard macro.
>
> You still don't put spaces after commas or periods
>
> >
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > ---
>
> and you miss a changelog here.
---
Changes in v2:
-Remove a missing DEBUGFS_RO_ATTR

Changes in v3:
-remove the blank line between the function
 definition and DEFINE_SHOW_ATTRIBUTE()

Changes in v4:
-update subject and changelog
---

Yours,
Yangtao
>
> Anyway, no need to send a new version, I'll fix the commit message when
> applying the patch.
>
> Thanks,
>
> Boris
