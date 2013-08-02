Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5HmG-00077J-Gn
 for linux-mtd@lists.infradead.org; Fri, 02 Aug 2013 16:00:29 +0000
Message-ID: <1375459520.14869.356.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: fix NAND_BUSWIDTH_AUTO for x16 devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 02 Aug 2013 19:05:20 +0300
In-Reply-To: <1374135422-8975-1-git-send-email-computersforpeace@gmail.com>
References: <1374135422-8975-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Matthieu Castet <matthieu.castet@parrot.com>,
 Alexander Shiyan <shc_work@mail.ru>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-07-18 at 01:17 -0700, Brian Norris wrote:
> The code for NAND_BUSWIDTH_AUTO is broken. According to Alexander:
> 
>   "I have a problem with attach NAND UBI in 16 bit mode.
>    NAND works fine if I specify NAND_BUSWIDTH_16 option, but not
>    working with NAND_BUSWIDTH_AUTO option. In second case NAND
>    chip is identifyed with ONFI."

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
