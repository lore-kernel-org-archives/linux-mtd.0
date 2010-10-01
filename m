MIME-Version: 1.0
In-Reply-To: <1285910489.31224.14.camel@macbook.infradead.org>
References: <1284330922-3569-1-git-send-email-linus.walleij@stericsson.com>
	<4CA560B7.5080505@st.com>
	<1285910489.31224.14.camel@macbook.infradead.org>
Date: Fri, 1 Oct 2010 09:25:09 +0200
Message-ID: <AANLkTintC=5Mo82QS0xxB143WrHrijqGOqdyZ=2BxCYe@mail.gmail.com>
Subject: Re: [PATCH 1/2] MTD: generic FSMC NAND MTD driver
From: Linus Walleij <linus.ml.walleij@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: viresh kumar <viresh.kumar@st.com>, Rajeev KUMAR <rajeev-dlh.kumar@st.com>,
	Vipin KUMAR <vipin.kumar@st.com>, Shiraz HASHIM <shiraz.hashim@st.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/10/1 David Woodhouse <dwmw2@infradead.org>:
> On Fri, 2010-10-01 at 09:46 +0530, viresh kumar wrote:

>> Just one query, what should be the location of fsmc.h
>> include/mtd/ or include/linux/mtd ??
>
> We use include/mtd/ for headers which are exported to userspace. Looks
> like this should be include/linux/mtd/

Aha, I'll respin it then.

Yours,
Linus Walleij
