Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6eid-0001lV-4v
 for linux-mtd@lists.infradead.org; Tue, 06 Aug 2013 10:42:23 +0000
Message-ID: <1375786046.30770.88.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: fsmc: update of OF support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 06 Aug 2013 13:47:26 +0300
In-Reply-To: <CACRpkdb5L+dTFyVHekA-_xGgq4M6-r3tEZDESfWWjV8QQNttTQ@mail.gmail.com>
References: <1367237268-21694-1-git-send-email-linus.walleij@stericsson.com>
 <1369814927.21070.0.camel@sauron.fi.intel.com>
 <CACRpkdb5L+dTFyVHekA-_xGgq4M6-r3tEZDESfWWjV8QQNttTQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Vipin Kumar <vipin.kumar@st.com>,
 Linus Walleij <linus.walleij@stericsson.com>,
 Anmar Oueja <anmar.oueja@linaro.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Mian Yousaf Kaukab <mian.yousaf.kaukab@stericsson.com>,
 Stefan Roese <sr@denx.de>, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-08-06 at 12:04 +0200, Linus Walleij wrote:
> On Wed, May 29, 2013 at 10:08 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Mon, 2013-04-29 at 14:07 +0200, Linus Walleij wrote:
> >> From: Mian Yousaf Kaukab <mian.yousaf.kaukab@stericsson.com>
> >>
> >> Add nand bank selection and timings to the device tree bindings.
> >>
> >> Cc: Stefan Roese <sr@denx.de>
> >> Cc: Vipin Kumar <vipin.kumar@st.com>
> >> Signed-off-by: Mian Yousaf Kaukab <mian.yousaf.kaukab@stericsson.com>
> >> [Added some documentation]
> >> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Pushed to l2-mtd.git, thanks!
> 
> Where did this go? It didn't turn up in v3.11-rc1, is it simply
> postponed to v3.12?

The merge window was missed, unfortunately.

-- 
Best Regards,
Artem Bityutskiy
