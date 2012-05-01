Received: from mms3.broadcom.com ([216.31.210.19])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SPILE-00053L-GW
 for linux-mtd@lists.infradead.org; Tue, 01 May 2012 19:02:29 +0000
Message-ID: <4FA03338.6070009@broadcom.com>
Date: Tue, 1 May 2012 12:02:16 -0700
From: "Jiandong Zheng" <jdzheng@broadcom.com>
MIME-Version: 1.0
To: "Brian Norris" <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 0/2] mtd: nand: rework nand_ecc_ctrl interface for OOB
References: <1335212069-7450-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1335212069-7450-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain;
 charset=iso-8859-1;
 format=flowed
Content-Transfer-Encoding: 7bit
Cc: Viresh Kumar <viresh.kumar@st.com>, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Vipin Kumar <vipin.kumar@st.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Lei Wen <leiwen@marvell.com>,
 Jamie Iles <jamie@jamieiles.com>, prabhakar@freescale.com,
 Mike Dunn <mikedunn@newsguy.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Bastian Hecht <hechtb@gmail.com>,
 Axel Lin <axel.lin@gmail.com>, Li Yang <leoli@freescale.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Armando Visconti <armando.visconti@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/23/2012 1:14 PM, Brian Norris wrote:
> Brian Norris (2):
>    mtd: nand: add 'use_oob' argument to NAND {read,write}_page
>      interfaces
>    mtd: nand: nand_base - pass proper 'use_oob' parameter
>
>   drivers/mtd/nand/bcm_umi_bch.c         |   10 +++--
>   drivers/mtd/nand/bcm_umi_nand.c        |    2 +-
>   drivers/mtd/nand/nand_base.c           |   58 ++++++++++++++++++++-----------
>   include/linux/mtd/nand.h               |   11 +++---
>   15 files changed, 89 insertions(+), 70 deletions(-)
>
I've built and run these successfully on bcmring.

Acked-by: Jiandong Zheng <jdzheng@broadcom.com>
