Received: from mo-p05-ob6.rzone.de ([2a01:238:20a:202:53f5::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7mJv-0003RO-Eg
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 11:24:44 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 01/13] nand/fsmc: Pass partition information through
 platform data
Date: Wed, 14 Mar 2012 12:24:20 +0100
References: <cover.1331705527.git.vipin.kumar@st.com>
 <cde13f8b2efacc7588963d4ca978f42514e2759c.1331705527.git.vipin.kumar@st.com>
In-Reply-To: <cde13f8b2efacc7588963d4ca978f42514e2759c.1331705527.git.vipin.kumar@st.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201203141224.20367.sr@denx.de>
Cc: Vipin Kumar <vipin.kumar@st.com>, linus.walleij@linaro.org,
 spear-devel@list.st.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 14 March 2012 07:17:07 Vipin Kumar wrote:
> This patch reimplements the passing of partition information through
> platform data. This was unintentionally deleted in commit
> 0d04eda1430e9a796214bee644b7e05d99cfe613
> "mtd: fsmc_nand.c: use mtd_device_parse_register"
> 
> Signed-off-by: Vipin Kumar <vipin.kumar@st.com>

Acked-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan
