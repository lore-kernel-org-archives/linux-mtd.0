Message-ID: <4CF32A62.4030205@st.com>
Date: Mon, 29 Nov 2010 09:51:54 +0530
From: viresh kumar <viresh.kumar@st.com>
MIME-Version: 1.0
To: stanley.miao <stanley.miao@windriver.com>
Subject: Re: [PATCH V2 28/69] ST SPEAr: Adding machine support for nand
References: <cover.1285933331.git.viresh.kumar@st.com>
	<1076320a0194c19ef0b4beefdf3c43a44e200439.1285933331.git.viresh.kumar@st.com>
	<4CF1F650.8080505@windriver.com>
In-Reply-To: <4CF1F650.8080505@windriver.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Pratyush ANAND <pratyush.anand@st.com>,
	Vipul Kumar SAMAR <vipulkumar.samar@st.com>,
	Bhupesh SHARMA <bhupesh.sharma@st.com>,
	Armando VISCONTI <armando.visconti@st.com>,
	"dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
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

On 11/28/2010 11:57 AM, stanley.miao wrote:
> Hi, Viresh,
> 
> It looked you missed the file include/mtd/fsmc.h in this patch.
> 
> Stanley.

Hi Stanley,

I sent this patchset after linus walleij has submitted patchset for fsmc.
In that patchset fsmc.h was at include/mtd/fsmc.h, but later it was placed
at include/linux/mtd/fsmc.h.

I am waiting for few of our drivers to be pushed in mainline, then i will
send final V3 version for this patchset.

-- 
viresh
