Message-ID: <4C7F65CC.3010002@st.com>
Date: Thu, 2 Sep 2010 10:52:28 +0200
From: Armando Visconti <armando.visconti@st.com>
MIME-Version: 1.0
To: Linus Walleij <linus.ml.walleij@gmail.com>,
	Alessandro Rubini <rubini-list@gnudd.com>
Subject: Re: [PATCH 27/74] ST SPEAr : NAND interface driver for spear platforms
References: <cover.1283161023.git.viresh.kumar@st.com>	<07ce8daf18d3a9f13864752074af3490a324d84c.1283161023.git.viresh.kumar@st.com>	<7cd7060b403b448d74649cec5c28c795bcbbdbc3.1283161023.git.viresh.kumar@st.com>
	<AANLkTik9Di4k183t+wuY-1eprsO3xBOESaOY5dnxt6ii@mail.gmail.com>
	<4C7F5B9E.8090406@st.com>
In-Reply-To: <4C7F5B9E.8090406@st.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Pratyush ANAND <pratyush.anand@st.com>, Viresh KUMAR <viresh.kumar@st.com>,
	Vipul Kumar SAMAR <vipulkumar.samar@st.com>,
	Bhupesh SHARMA <bhupesh.sharma@st.com>,
	Sebastian RASMUSSEN <sebastian.rasmussen@stericsson.com>,
	Armando Visconti <armando.visconti@st.com>,
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

Alessandro,
>
>
>> Alessandro can judge on this, but I have a feeling that driver
>> should be replaced by this, more mature driver.
>>   
> Maybe.
> But I suspect that may be few differences in the ECC accelerator 
> inside, in fact.
>
> In our FSMC previous case it was a Hamming accelerator, and I think 
> this apply
> also for nomadik (maybe). In our sp1300 case it is a BCH with 104 
> bytes of ECC.
>
> This is one of the options when generating the h/w block, so FSMCs may 
> differ.
> If we want to re-use same driver I guess we might change something and 
> accept
> few parameters from the platform.
>
> Vipin can for sure comment more on this.....
Mmmh .... it seems that the driver already handles the different types 
of h/w ecc.
And in fact it works for our new and old SPEAr platform at the same
time.

So, probably, it would work for Nomadik also...

Ciao,
Arm
>
>
> Rgds,
> Arm
>


-- 
-- "Every step appears to be the unavoidable consequence of the
-- preceding one." (A. Einstein) 
-- 
Armando Visconti                  Mobile: (+39) 346 8879146
Senior SW Engineer                Fax:    (+39) 02 93519290
CPG                               Work:   (+39) 02 93519683
Computer System Division          e-mail: armando.visconti@st.com
ST Microelectronics               TINA:   051  4683
                                    
 
