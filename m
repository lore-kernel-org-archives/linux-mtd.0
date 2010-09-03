Date: Fri, 3 Sep 2010 13:23:38 +0200
From: Alessandro Rubini <rubini-list@gnudd.com>
To: armando.visconti@st.com
Subject: Re: [PATCH 27/74] ST SPEAr : NAND interface driver for spear platforms
Message-ID: <20100903112338.GA3132@morgana.i.gnudd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: rubini@gnudd.com
In-Reply-To: <4C7F9993.3040700@st.com>
References: <4C7F9993.3040700@st.com>
	<cover.1283161023.git.viresh.kumar@st.com>
	<07ce8daf18d3a9f13864752074af3490a324d84c.1283161023.git.viresh.kumar@st.com>
	<7cd7060b403b448d74649cec5c28c795bcbbdbc3.1283161023.git.viresh.kumar@st.com>
	<AANLkTik9Di4k183t+wuY-1eprsO3xBOESaOY5dnxt6ii@mail.gmail.com>
	<4C7F5B9E.8090406@st.com>
	<AANLkTikwjCh=2Cekg9R1SqacKXC+_ZgV7m+=ZVVCaDba@mail.gmail.com>
Cc: pratyush.anand@st.com, viresh.kumar@st.com, vipulkumar.samar@st.com,
	bhupesh.sharma@st.com, sebastian.rasmussen@stericsson.com,
	linus.ml.walleij@gmail.com, rubini-list@gnudd.com,
	vipin.kumar@st.com, shiraz.hashim@st.com,
	rajeev-dlh.kumar@st.com, linux-mtd@lists.infradead.org,
	deepak.sikri@st.com, dwmw2@infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linus:
>> As I said I think nomadik_nand.c shall be deleted and replaced with
>> this driver.

Armando:
> As I said before, the SPEAr driver should work on Nomadik too
> as it looks generic enough and for us it is working
> on two different platforms with different FSMC versions.

Ok. I can't test it for a while, so I'll take your word. If needed
I'll make my homework later to fix 8815 over the new driver.

Note however that the platform data in
arch/arm/mach-nomadik/board-nhk8815.c should be fixed to reference the
new driver.  If you remove my version please at least compile-check
the nhk with the new patch-set.

thanks
/alessandro
