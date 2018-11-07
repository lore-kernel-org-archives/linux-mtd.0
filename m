Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKVIq-0002Lk-3L
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2018 21:23:57 +0000
Received: by mail-wr1-x444.google.com with SMTP id o15-v6so15332908wrv.4
 for <linux-mtd@lists.infradead.org>; Wed, 07 Nov 2018 13:23:44 -0800 (PST)
MIME-Version: 1.0
References: <20181105082540.21205-1-geert@linux-m68k.org>
 <20181107080733.ojderb7dkvwtpl2i@pengutronix.de>
In-Reply-To: <20181107080733.ojderb7dkvwtpl2i@pengutronix.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 7 Nov 2018 22:23:31 +0100
Message-ID: <CAFLxGvy_Tg88bufFn7VXT-N64U_pem3ocPYbWSqiBsxAb_iSvw@mail.gmail.com>
Subject: Re: [PATCH] ubifs: CONFIG_UBIFS_FS_AUTHENTICATION should depend on
 UBIFS_FS
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 7, 2018 at 9:07 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> On Mon, Nov 05, 2018 at 09:25:40AM +0100, Geert Uytterhoeven wrote:
> > Instead of adding yet another dependency on UBIFS_FS, wrap the whole
> > block of ubifs config options in a single "if UBIFS_FS".
> >
> > Fixes: d8a22773a12c6d78 ("ubifs: Enable authentication support")
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> >  fs/ubifs/Kconfig | 15 +++++++--------
> >  1 file changed, 7 insertions(+), 8 deletions(-)
>
> I would have sent a similar patch with taking the easier way out of just
> adding another "depends on UBIFS_FS". This one is nicer though.
>
> Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

Applied.

-- 
Thanks,
//richard
