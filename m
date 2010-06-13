Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ONjVG-0004St-4T
	for linux-mtd@lists.infradead.org; Sun, 13 Jun 2010 09:29:19 +0000
Subject: Re: [PATCH 1/2] mtd: OneNAND: Add runtime badblock check feature
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joonyoung Shim <jy0922.shim@samsung.com>
In-Reply-To: <1275380256-15315-1-git-send-email-jy0922.shim@samsung.com>
References: <1275380256-15315-1-git-send-email-jy0922.shim@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 13 Jun 2010 12:26:40 +0300
Message-ID: <1276421200.19028.192.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-06-01 at 17:17 +0900, Joonyoung Shim wrote:
> From: Kyungmin Park <kyungmin.park@samsung.com>
> 
> This patch is to support runtime badblock checking. This supports only
> OneNAND currently. The OneNAND badblock checking when boots occurs boot
> time delay. We can reduce boot time because can detect badblock at
> runtime.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Hi, this feature is interesting. But why not to use bad block table
instead of adding more complexity to the already very complex and
difficult to follow code?

Also, if you really want this, it should be rather lazy checking, where
you read OOB on demand, and then save this information to the in-ram
BBT, and when you get another ->block_isbad() for a block which was
previously checked, you do not read OOB for the second time.

CCing Thomas, if we are lucky, he'll provide good input.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
