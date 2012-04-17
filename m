Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SKD22-0006ng-23
 for linux-mtd@lists.infradead.org; Tue, 17 Apr 2012 18:21:42 +0000
Received: by yhjj52 with SMTP id j52so3616807yhj.36
 for <linux-mtd@lists.infradead.org>; Tue, 17 Apr 2012 11:21:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <0e30cc60464d6052706b96a020700ecbf2121d71.1334662614.git.viresh.kumar@st.com>
References: <43a59a35ce076693de33846844ac5be4dae5a49b.1334662614.git.viresh.kumar@st.com>
 <0e30cc60464d6052706b96a020700ecbf2121d71.1334662614.git.viresh.kumar@st.com>
Date: Tue, 17 Apr 2012 20:21:36 +0200
Message-ID: <CACRpkdZ4ucf5XYohf5+x0Hk9qKgGHLL8wr_qAKobM2vnkjH+-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2 V2] mtd: fsmc_nand: Add clk_{un}prepare() support
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

On Tue, Apr 17, 2012 at 1:37 PM, Viresh Kumar <viresh.kumar@st.com> wrote:

> clk_{un}prepare is mandatory for platforms using common clock framework. Since
> this driver is used by SPEAr platform, which supports common clock framework,
> add clk_{un}prepare() support for it.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
> ---
> V1->V2:
> - Use clk_prepare_enable and clk_disable_unprepare

Even smarter.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Linus Walleij
