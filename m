Message-ID: <4CA560B7.5080505@st.com>
Date: Fri, 1 Oct 2010 09:46:55 +0530
From: viresh kumar <viresh.kumar@st.com>
MIME-Version: 1.0
To: Linus WALLEIJ <linus.walleij@stericsson.com>
Subject: Re: [PATCH 1/2] MTD: generic FSMC NAND MTD driver
References: <1284330922-3569-1-git-send-email-linus.walleij@stericsson.com>
In-Reply-To: <1284330922-3569-1-git-send-email-linus.walleij@stericsson.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Rajeev KUMAR <rajeev-dlh.kumar@st.com>, Vipin KUMAR <vipin.kumar@st.com>,
	Shiraz HASHIM <shiraz.hashim@st.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
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

On 09/13/2010 04:05 AM, Linus WALLEIJ wrote:
> This is the same driver submitted by ST Micros SPEAr team but
> generalized and tested on the ST-Ericsson U300. It probably
> easily works on the NHK8815 too.
> 
<snip...>
> ---
>  drivers/mtd/nand/Kconfig     |    7 +
>  drivers/mtd/nand/Makefile    |    1 +
>  drivers/mtd/nand/fsmc_nand.c |  862 ++++++++++++++++++++++++++++++++++++++++++
>  include/mtd/fsmc.h           |  181 +++++++++

Linus,

Just one query, what should be the location of fsmc.h
include/mtd/ or include/linux/mtd ??

viresh.
