Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SK4h3-000695-N9
 for linux-mtd@lists.infradead.org; Tue, 17 Apr 2012 09:27:30 +0000
Received: by yenm10 with SMTP id m10so3247754yen.36
 for <linux-mtd@lists.infradead.org>; Tue, 17 Apr 2012 02:27:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <e602342fa929bc44ef85683e457b1cdfcd6b9946.1334652831.git.viresh.kumar@st.com>
References: <e95a4f03450aa1761d137bf3487de3e33e454563.1334652831.git.viresh.kumar@st.com>
 <e602342fa929bc44ef85683e457b1cdfcd6b9946.1334652831.git.viresh.kumar@st.com>
Date: Tue, 17 Apr 2012 11:27:23 +0200
Message-ID: <CACRpkdYwRFFM+W3+Yg9Si3_TVjExjCkMQ7HXVa-PCbYU_UJ=6g@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: fsmc_nand: Add clk_{un}prepare() support
From: Linus Walleij <linus.walleij@linaro.org>
To: Viresh Kumar <viresh.kumar@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: artem.bityutskiy@linux.intel.com, spear-devel@list.st.com,
 viresh.linux@gmail.com, linux-mtd@lists.infradead.org, sr@denx.de,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 17, 2012 at 10:56 AM, Viresh Kumar <viresh.kumar@st.com> wrote:

> clk_{un}prepare is mandatory for platforms using common clock framework. Since
> this driver is used by SPEAr platform, which supports common clock framework,
> add clk_{un}prepare() support for it.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@st.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

BTW: this driver looks like we could use some runtime PM on it to gate off the
block when not used.

Yours,
Linus Walleij
