Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RdTB7-0004wH-GJ
 for linux-mtd@lists.infradead.org; Wed, 21 Dec 2011 20:54:22 +0000
Received: by lahc1 with SMTP id c1so6027607lah.36
 for <linux-mtd@lists.infradead.org>; Wed, 21 Dec 2011 12:54:20 -0800 (PST)
Subject: Re: [PATCH V2 2/5] MTD: bcm63xxpart: make sure CFE and NVRAM
 partitions are at least 64K
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 21 Dec 2011 22:54:13 +0200
In-Reply-To: <1324290964-14096-1-git-send-email-jonas.gorski@gmail.com>
References: <1324208821.17534.0.camel@sauron.fi.intel.com>
 <1324290964-14096-1-git-send-email-jonas.gorski@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1324500858.2110.1.camel@koala>
Mime-Version: 1.0
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-12-19 at 11:36 +0100, Jonas Gorski wrote:
> The CFE boot loader on BCM63XX platforms assumes itself and the NVRAM
> partition to be 64 KiB (or erase block sized, if larger).
> Ensure this assumption is also met when creating the partitions to
> prevent accidential erasure of CFE or NVRAM.
> 
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Updated, thanks!
