Message-ID: <4C7F9993.3040700@st.com>
Date: Thu, 2 Sep 2010 14:33:23 +0200
From: Armando Visconti <armando.visconti@st.com>
MIME-Version: 1.0
To: Linus Walleij <linus.ml.walleij@gmail.com>
Subject: Re: [PATCH 27/74] ST SPEAr : NAND interface driver for spear platforms
References: <cover.1283161023.git.viresh.kumar@st.com>	<07ce8daf18d3a9f13864752074af3490a324d84c.1283161023.git.viresh.kumar@st.com>	<7cd7060b403b448d74649cec5c28c795bcbbdbc3.1283161023.git.viresh.kumar@st.com>	<AANLkTik9Di4k183t+wuY-1eprsO3xBOESaOY5dnxt6ii@mail.gmail.com>	<4C7F5B9E.8090406@st.com>
	<AANLkTikwjCh=2Cekg9R1SqacKXC+_ZgV7m+=ZVVCaDba@mail.gmail.com>
In-Reply-To: <AANLkTikwjCh=2Cekg9R1SqacKXC+_ZgV7m+=ZVVCaDba@mail.gmail.com>
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
> 2010/9/2 Armando Visconti <armando.visconti@st.com>:
>
>   
>>> I *highly* suspect that this driver duplicates some code found in
>>> drivers/mtd/nand/nomadik_nand.c because it's the same silicon.
>>>       
>> Why nomadik_nand.c?
>> Shouldn't the fsmc_nand.c rule apply also in this case?
>>     
>
> As I said I think nomadik_nand.c shall be deleted and replaced with
> this driver.
>
> Unless Alessandro hits me on the fingers... If it is made generic
> I can provide testing for the U300. (Maybe I can get my NHK8815
> card booting too, I don't know.)
>   
As I said before, the SPEAr driver should work on Nomadik too
as it looks generic enough and for us it is working
on two different platforms with different FSMC versions.

This, unless the Nomadik FSMC is a customized h/w block, which
I seem to remember in fact ...

Ciao,
Arm


-- 
-- "Every step appears to be the unavoidable consequence of the
-- preceding one." (A. Einstein) 
-- 
Armando Visconti                  Mobile: (+39) 346 8879146
Senior SW Engineer                Fax:    (+39) 02 93519290
CPG                               Work:   (+39) 02 93519683
Computer System Division          e-mail: armando.visconti@st.com
ST Microelectronics               TINA:   051  4683
                                    
 
