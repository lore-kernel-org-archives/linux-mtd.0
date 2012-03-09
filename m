Received: from mga09.intel.com ([134.134.136.24])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5zjL-0002z8-5A
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 13:19:36 +0000
Message-ID: <1331299248.29445.24.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 00/18] mtd/nand/fsmc related modifications
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vipin Kumar <vipin.kumar@st.com>
Date: Fri, 09 Mar 2012 15:20:48 +0200
In-Reply-To: <cover.1331119143.git.vipin.kumar@st.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: linus.walleij@linaro.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2012-03-07 at 17:00 +0530, Vipin Kumar wrote:
> Hello All,

BTW, sparse gives a lot of warnings like this for this driver:

drivers/mtd/nand/fsmc_nand.c:300:9: warning: incorrect type in argument 1 (different address spaces) [sparse]
drivers/mtd/nand/fsmc_nand.c:300:9:    expected void const volatile [noderef] <asn:2>*<noident> [sparse]
drivers/mtd/nand/fsmc_nand.c:300:9:    got unsigned int *<noident> [sparse]

-- 
Best Regards,
Artem Bityutskiy
