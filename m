Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7m2e-0001U0-72
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 11:06:52 +0000
Received: by ghbf11 with SMTP id f11so1840987ghb.36
 for <linux-mtd@lists.infradead.org>; Wed, 14 Mar 2012 04:06:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cde13f8b2efacc7588963d4ca978f42514e2759c.1331705527.git.vipin.kumar@st.com>
References: <cover.1331705527.git.vipin.kumar@st.com>
 <cde13f8b2efacc7588963d4ca978f42514e2759c.1331705527.git.vipin.kumar@st.com>
Date: Wed, 14 Mar 2012 12:06:50 +0100
Message-ID: <CACRpkdbC9gGzumiZt3dk50z-bcBsatQZSiDUZhy=jqnFDs8UDA@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] nand/fsmc: Pass partition information through
 platform data
From: Linus Walleij <linus.walleij@linaro.org>
To: Vipin Kumar <vipin.kumar@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: sr@denx.de, spear-devel@list.st.com, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 14, 2012 at 7:17 AM, Vipin Kumar <vipin.kumar@st.com> wrote:

> This patch reimplements the passing of partition information through platform
> data. This was unintentionally deleted in commit
> 0d04eda1430e9a796214bee644b7e05d99cfe613
> "mtd: fsmc_nand.c: use mtd_device_parse_register"
>
> Signed-off-by: Vipin Kumar <vipin.kumar@st.com>

Acked/Reviewed/Signed -off-by: Linus Walleij <linus.walleij@linaro.org>

Also recommend adding Cc: stable@kernel.org on this then.

Thanks!
Linus Walleij
