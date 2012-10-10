Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TLzmd-00087R-Uf
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 17:09:24 +0000
Received: by mail-wi0-f177.google.com with SMTP id hj13so770245wib.0
 for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2012 10:09:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <88484dbae96f7db42ce615552a4c758844a5e6cc.1349778821.git.vipin.kumar@st.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <88484dbae96f7db42ce615552a4c758844a5e6cc.1349778821.git.vipin.kumar@st.com>
Date: Wed, 10 Oct 2012 19:09:22 +0200
Message-ID: <CACRpkdZWdJ+uZhkvygXVsbr_3rWt60j4YMiLwed8FUwzvF5KoQ@mail.gmail.com>
Subject: Re: [PATCH 08/11] fsmc/nand: Use relaxed variants of io accessors
From: Linus Walleij <linus.walleij@linaro.org>
To: Vipin Kumar <vipin.kumar@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: plagnioj@jcrosoft.com, spear-devel@list.st.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 9, 2012 at 12:44 PM, Vipin Kumar <vipin.kumar@st.com> wrote:

> Use relaxed variants of readl/writel accessors. readl/writel io accessors use
> explicit dsb instruction which causes stalls in the processor core resulting
> several cycles of delay for each access
>
> Use relaxed variants where ever possible. This also results in an improved
> read/write performance.
>
> Signed-off-by: Vipin Kumar <vipin.kumar@st.com>

Good idea for any performance-critical code! Thanks!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
