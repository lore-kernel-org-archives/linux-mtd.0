Message-ID: <4D2FDD62.4040106@st.com>
Date: Fri, 14 Jan 2011 10:51:38 +0530
From: viresh kumar <viresh.kumar@st.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linus.walleij@stericsson.com" <linus.walleij@stericsson.com>
Subject: Re: [PATCH V3 25/63 resend] Newly erased page read workaround
References: <cover.1292833228.git.viresh.kumar@st.com>
	<6187de0568d1ea8a6aeb6c3ca54ac6684bee9973.1292833228.git.viresh.kumar@st.com>
In-Reply-To: <6187de0568d1ea8a6aeb6c3ca54ac6684bee9973.1292833228.git.viresh.kumar@st.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Rajeev KUMAR <rajeev-dlh.kumar@st.com>,
	Armando VISCONTI <armando.visconti@st.com>,
	Vipin KUMAR <vipin.kumar@st.com>, Shiraz HASHIM <shiraz.hashim@st.com>,
	Amit VIRDI <Amit.VIRDI@st.com>,
	Vipul Kumar SAMAR <vipulkumar.samar@st.com>,
	Deepak SIKRI <deepak.sikri@st.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/20/2010 02:49 PM, Viresh KUMAR wrote:
> From: Vipin Kumar <vipin.kumar@st.com>
> 
> A newly erased page contains ff in data as well as spare area. While reading an
> erased page, the read out ecc from spare area does not match the ecc generated
> by fsmc ecc hardware accelarator. This is because ecc of data ff ff is not ff
> ff. This leads to errors when jffs2 fs erases and reads back the pages to
> ensure consistency.
> 
> This patch adds a software workaround to ensure that the ecc check is not
> performed for erased pages. An erased page is checked by checking data as ff ff.

David,

Does this patch looks fine to you??

--
viresh
