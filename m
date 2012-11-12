Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TXqp4-0003mA-5g
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 10:00:55 +0000
Received: by mail-lb0-f177.google.com with SMTP id gi11so4277305lbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Nov 2012 02:00:51 -0800 (PST)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
To: Jonas Gorski <jonas.gorski@gmail.com>
Subject: Re: [PATCH 0/5] MTD: bcm63xxpart: small code cleanup
Date: Mon, 12 Nov 2012 10:59:14 +0100
Message-ID: <2045317.LyZLRiZffX@flexo>
In-Reply-To: <1352713971-1685-1-git-send-email-jonas.gorski@gmail.com>
References: <1352713971-1685-1-git-send-email-jonas.gorski@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
Cc: David Woodhouse <dwmw2@infradead.org>, Maxime Bizon <mbizon@freebox.fr>,
 Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 12 November 2012 10:52:46 Jonas Gorski wrote:
> Here is a bunch of small code cleanups. No functional changes.
> 
> Jonas Gorski (5):
>   MTD: bcm63xxpart: remove unused variable
>   MTD: bcm63xxpart: merge sparelen calculation
>   MTD: bcm63xxpart: make fixed part length calculation more generic
>   MTD: bcm63xxpart: move the last curpart++ to its correct place
>   MTD: bcm63xxpart: use correct printk format for partitions

For this entire serie:

Reviewed-by: Florian Fainelli <florian@openwrt.org>

Thanks Jonas!
--
Florian
