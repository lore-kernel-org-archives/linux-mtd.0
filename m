Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUZ4z-0000sI-Ui
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 06:50:58 +0000
Received: by ewy3 with SMTP id 3so533827ewy.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 23:50:55 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] mtd: nand: replace DEBUG() with dev_dbg()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1307557650-31323-1-git-send-email-computersforpeace@gmail.com>
References: <1307544295.31223.116.camel@localhost>
	<1307557650-31323-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 09:46:37 +0300
Message-ID: <1307601997.7374.10.camel@localhost>
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

On Wed, 2011-06-08 at 11:27 -0700, Brian Norris wrote:
> +               dev_dbg(&mtd->dev, "%s: error status = 0x%08x\n",
>                                         __func__, status); 

Aligned things like this and pushed, thank you!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
