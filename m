Subject: Re: [PATCH 1/2] MTD: generic FSMC NAND MTD driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Walleij <linus.ml.walleij@gmail.com>
In-Reply-To: <AANLkTikuKC2n488ZNAeSr83p9cju2ZQCGU1W_FXqgzVy@mail.gmail.com>
References: <1284330922-3569-1-git-send-email-linus.walleij@stericsson.com>
	<AANLkTikuKC2n488ZNAeSr83p9cju2ZQCGU1W_FXqgzVy@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 20 Sep 2010 11:39:39 +0300
Message-ID: <1284971979.2286.46.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Viresh Kumar <viresh.kumar@st.com>, Rajeev Kumar <rajeev-dlh.kumar@st.com>,
	Linus Walleij <linus.walleij@stericsson.com>,
	Vipin Kumar <vipin.kumar@st.com>, Shiraz Hashim <shiraz.hashim@st.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-09-14 at 10:52 +0200, Linus Walleij wrote:
> 2010/9/13 Linus Walleij <linus.walleij@stericsson.com>:
> 
> > This is the same driver submitted by ST Micros SPEAr team but
> > generalized and tested on the ST-Ericsson U300. It probably
> > easily works on the NHK8815 too.
> 
> David if this one looks OK then can you merge both patches through
> the MTD tree?

I've pushed both patches to my l2-mtd-2.6.git / master, without signing
this off myself.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
