MIME-Version: 1.0
In-Reply-To: <4C7F5B9E.8090406@st.com>
References: <cover.1283161023.git.viresh.kumar@st.com>
	<07ce8daf18d3a9f13864752074af3490a324d84c.1283161023.git.viresh.kumar@st.com>
	<7cd7060b403b448d74649cec5c28c795bcbbdbc3.1283161023.git.viresh.kumar@st.com>
	<AANLkTik9Di4k183t+wuY-1eprsO3xBOESaOY5dnxt6ii@mail.gmail.com>
	<4C7F5B9E.8090406@st.com>
Date: Thu, 2 Sep 2010 13:15:13 +0200
Message-ID: <AANLkTikwjCh=2Cekg9R1SqacKXC+_ZgV7m+=ZVVCaDba@mail.gmail.com>
Subject: Re: [PATCH 27/74] ST SPEAr : NAND interface driver for spear platforms
From: Linus Walleij <linus.ml.walleij@gmail.com>
To: Armando Visconti <armando.visconti@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Pratyush ANAND <pratyush.anand@st.com>, Viresh KUMAR <viresh.kumar@st.com>,
	Vipul Kumar SAMAR <vipulkumar.samar@st.com>,
	Bhupesh SHARMA <bhupesh.sharma@st.com>,
	Sebastian RASMUSSEN <sebastian.rasmussen@stericsson.com>,
	Alessandro Rubini <rubini-list@gnudd.com>,
	Vipin KUMAR <vipin.kumar@st.com>, Shiraz HASHIM <shiraz.hashim@st.com>,
	Rajeev KUMAR <rajeev-dlh.kumar@st.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Deepak SIKRI <deepak.sikri@st.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
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

2010/9/2 Armando Visconti <armando.visconti@st.com>:

>> I *highly* suspect that this driver duplicates some code found in
>> drivers/mtd/nand/nomadik_nand.c because it's the same silicon.
>
> Why nomadik_nand.c?
> Shouldn't the fsmc_nand.c rule apply also in this case?

As I said I think nomadik_nand.c shall be deleted and replaced with
this driver.

Unless Alessandro hits me on the fingers... If it is made generic
I can provide testing for the U300. (Maybe I can get my NHK8815
card booting too, I don't know.)

Yours,
Linus Walleij
