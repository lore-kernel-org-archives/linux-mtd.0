Message-ID: <4C849751.1090604@st.com>
Date: Mon, 6 Sep 2010 09:25:05 +0200
From: Armando Visconti <armando.visconti@st.com>
MIME-Version: 1.0
To: Linus Walleij <linus.ml.walleij@gmail.com>
Subject: Re: [PATCH 27/74] ST SPEAr : NAND interface driver for spear platforms
References: <cover.1283161023.git.viresh.kumar@st.com>	<07ce8daf18d3a9f13864752074af3490a324d84c.1283161023.git.viresh.kumar@st.com>	<7cd7060b403b448d74649cec5c28c795bcbbdbc3.1283161023.git.viresh.kumar@st.com>	<AANLkTik9Di4k183t+wuY-1eprsO3xBOESaOY5dnxt6ii@mail.gmail.com>	<4C7F5B9E.8090406@st.com>	<AANLkTikwjCh=2Cekg9R1SqacKXC+_ZgV7m+=ZVVCaDba@mail.gmail.com>	<4C7F9993.3040700@st.com>	<20100903112338.GA3132@morgana.i.gnudd.com>
	<AANLkTinri8ve=wb+tm5zO4JSnz6_RE-n+sZoKU-ipios@mail.gmail.com>
In-Reply-To: <AANLkTinri8ve=wb+tm5zO4JSnz6_RE-n+sZoKU-ipios@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
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

Linus Walleij wrote:
> 2010/9/3 Alessandro Rubini <rubini-list@gnudd.com>:
>
>   
>> Note however that the platform data in
>> arch/arm/mach-nomadik/board-nhk8815.c should be fixed to reference the
>> new driver.  If you remove my version please at least compile-check
>> the nhk with the new patch-set.
>>     
>
> What about we put this new FSMC generic thing in, and
> then remove the old one with the same patch that
> instead activates the new one. No need to rush that.
>
> Right now I mostly worry about having it in the proper
> place with the proper name and the headers accessible from
> all archs...
>
> Linus Walleij
>   
Agreed.

THis also because, as I already mentioned, I seem to remember that the
Nomadik FSMC it is not exactly the standard one, but a modified (not 
configured)
version.

So, you may better check with Andrea Gallo whether this is really the case
or not.

Rgds,
Arm
