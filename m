Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUK4K-0005sQ-8Y
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 14:49:17 +0000
Received: by yib17 with SMTP id 17so256900yib.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 07:49:13 -0700 (PDT)
Subject: Re: [PATCH 3/4] mtd: nand: replace DEBUG() with dev_dbg()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1307487717-25402-4-git-send-email-computersforpeace@gmail.com>
References: <1307487717-25402-1-git-send-email-computersforpeace@gmail.com>
	<1307487717-25402-4-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 17:44:55 +0300
Message-ID: <1307544295.31223.116.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-07 at 16:01 -0700, Brian Norris wrote:
> -		DEBUG(MTD_DEBUG_LEVEL0, "%s: Length not block aligned\n",
> +		dev_dbg(&mtd->dev, "%s: Length not block aligned\n",
>  					__func__);

Ditto for this patch.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
