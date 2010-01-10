Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTtpV-0007O0-4b
	for linux-mtd@lists.infradead.org; Sun, 10 Jan 2010 09:11:29 +0000
Received: by fxm22 with SMTP id 22so23091452fxm.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 10 Jan 2010 01:11:23 -0800 (PST)
Subject: Re: [PATCH 4/4] MTD: include ar7part in the list of partitions parsers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Florian Fainelli <florian@openwrt.org>
In-Reply-To: <201001032117.37459.florian@openwrt.org>
References: <201001032117.37459.florian@openwrt.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 10 Jan 2010 11:11:21 +0200
Message-Id: <1263114681.7315.136.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, ralf@linux-mips.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-01-03 at 21:17 +0100, Florian Fainelli wrote:
> This patch modifies the physmap-flash driver to include
> the ar7part partition parser in the list of parsers to
> use when a physmap-flash driver is registered. This is
> required for AR7 to create partitions correctly.
> 
> Signed-off-by: Florian Fainelli <florian@openwrt.org>

Taken this to my l2-mtd-2.6/dunno tree.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
