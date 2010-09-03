MIME-Version: 1.0
In-Reply-To: <20100903112338.GA3132@morgana.i.gnudd.com>
References: <cover.1283161023.git.viresh.kumar@st.com>
	<07ce8daf18d3a9f13864752074af3490a324d84c.1283161023.git.viresh.kumar@st.com>
	<7cd7060b403b448d74649cec5c28c795bcbbdbc3.1283161023.git.viresh.kumar@st.com>
	<AANLkTik9Di4k183t+wuY-1eprsO3xBOESaOY5dnxt6ii@mail.gmail.com>
	<4C7F5B9E.8090406@st.com>
	<AANLkTikwjCh=2Cekg9R1SqacKXC+_ZgV7m+=ZVVCaDba@mail.gmail.com>
	<4C7F9993.3040700@st.com>
	<20100903112338.GA3132@morgana.i.gnudd.com>
Date: Fri, 3 Sep 2010 19:26:42 +0200
Message-ID: <AANLkTinri8ve=wb+tm5zO4JSnz6_RE-n+sZoKU-ipios@mail.gmail.com>
Subject: Re: [PATCH 27/74] ST SPEAr : NAND interface driver for spear platforms
From: Linus Walleij <linus.ml.walleij@gmail.com>
To: Alessandro Rubini <rubini-list@gnudd.com>, armando.visconti@st.com,
	linus.ml.walleij@gmail.com, viresh.kumar@st.com,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org, pratyush.anand@st.com, vipulkumar.samar@st.com,
	bhupesh.sharma@st.com, vipin.kumar@st.com, shiraz.hashim@st.com,
	rajeev-dlh.kumar@st.com, deepak.sikri@st.com,
	sebastian.rasmussen@stericsson.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/9/3 Alessandro Rubini <rubini-list@gnudd.com>:

> Note however that the platform data in
> arch/arm/mach-nomadik/board-nhk8815.c should be fixed to reference the
> new driver. =A0If you remove my version please at least compile-check
> the nhk with the new patch-set.

What about we put this new FSMC generic thing in, and
then remove the old one with the same patch that
instead activates the new one. No need to rush that.

Right now I mostly worry about having it in the proper
place with the proper name and the headers accessible from
all archs...

Linus Walleij
