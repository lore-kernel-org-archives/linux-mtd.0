Subject: Re: [PATCH 1/2] MTD: generic FSMC NAND MTD driver
From: David Woodhouse <dwmw2@infradead.org>
To: viresh kumar <viresh.kumar@st.com>
In-Reply-To: <4CA560B7.5080505@st.com>
References: <1284330922-3569-1-git-send-email-linus.walleij@stericsson.com>
	<4CA560B7.5080505@st.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Oct 2010 14:21:29 +0900
Message-ID: <1285910489.31224.14.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Rajeev KUMAR <rajeev-dlh.kumar@st.com>,
	Linus WALLEIJ <linus.walleij@stericsson.com>,
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

On Fri, 2010-10-01 at 09:46 +0530, viresh kumar wrote:
> 
> 
> Just one query, what should be the location of fsmc.h
> include/mtd/ or include/linux/mtd ?? 

We use include/mtd/ for headers which are exported to userspace. Looks
like this should be include/linux/mtd/

-- 
dwmw2
