Date: Sat, 28 Jul 2012 21:02:51 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: imx_v6_v7_defconfig: Select MXS_DMA
Message-ID: <20120728130249.GF2128@S2101-09.ap.freescale.net>
References: <1343215100-24005-1-git-send-email-festevam@gmail.com>
 <1343215100-24005-3-git-send-email-festevam@gmail.com>
 <CAMiH66EA4O0s8hfXkr_SJ56+q7eZ8w0=3C1r_C+m2Os1RxprmA@mail.gmail.com>
 <CAOMZO5BfT+_7x4F96Kvqtq5STXxw2Y9CxbCCAc_UnZ-3wy0qxg@mail.gmail.com>
 <CAMiH66FUxiw0B8iD5rYi=nUX0VYZBzOKifXKfTqd1RmSHhC80g@mail.gmail.com>
 <20120726022930.GB3396@shlinux2.ap.freescale.net>
 <CAOMZO5CKK68sgT+Q31OuMbFQ5uL4j3zbs2zZQfPyHtt0ZLkX3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAOMZO5CKK68sgT+Q31OuMbFQ5uL4j3zbs2zZQfPyHtt0ZLkX3A@mail.gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Dong Aisheng <b29396@freescale.com>, b32955@freescale.com,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Artem.Bityutskiy@linux.intel.com, Huang Shijie <shijie8@gmail.com>,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 26, 2012 at 07:38:57AM -0300, Fabio Estevam wrote:
> On Wed, Jul 25, 2012 at 11:29 PM, Dong Aisheng <b29396@freescale.com> wrote:
> 
> > How about using 'select MXS_DMA'?
> 
> Ok, I prefer this way too. Will resubmit it soon. Hopefully it is OK with Shawn.

No.  For your information, the following is what
Documentation/kbuild/kconfig-language.txt tell.

  Note:
        select should be used with care. select will force
        a symbol to a value without visiting the dependencies.
        By abusing select you are able to select a symbol FOO even
        if FOO depends on BAR that is not set.
        In general use select only for non-visible symbols
        (no prompts anywhere) and for symbols with no dependencies.
        That will limit the usefulness but on the other hand avoid
        the illegal configurations all over.

-- 
Regards,
Shawn
