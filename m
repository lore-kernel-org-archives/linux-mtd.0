MIME-Version: 1.0
Sender: viresh.linux@gmail.com
In-Reply-To: <88484dbae96f7db42ce615552a4c758844a5e6cc.1349778821.git.vipin.kumar@st.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <88484dbae96f7db42ce615552a4c758844a5e6cc.1349778821.git.vipin.kumar@st.com>
Date: Tue, 9 Oct 2012 23:12:45 +0530
Message-ID: <CAOh2x=nbiYCvwpiuVikcKB6=M2m0Z031XromT3jcFWOurupZZw@mail.gmail.com>
Subject: Re: [PATCH 08/11] fsmc/nand: Use relaxed variants of io accessors
From: viresh kumar <viresh.kumar@linaro.org>
To: Vipin Kumar <vipin.kumar@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: dedekind1@gmail.com, linus.walleij@linaro.org, spear-devel@list.st.com,
 linux-mtd@lists.infradead.org, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 9, 2012 at 4:14 PM, Vipin Kumar <vipin.kumar@st.com> wrote:
> Use relaxed variants of readl/writel accessors. readl/writel io accessors use
> explicit dsb instruction which causes stalls in the processor core resulting
> several cycles of delay for each access
>
> Use relaxed variants where ever possible. This also results in an improved
> read/write performance.

Good change.

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
