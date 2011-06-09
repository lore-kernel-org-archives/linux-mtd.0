Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUZBI-00012F-EB
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 06:57:29 +0000
Received: by wwb39 with SMTP id 39so999544wwb.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 23:57:26 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] mtd: nand: convert printk() to pr_*()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
References: <1307544227.31223.115.camel@localhost>
	<1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 09:53:08 +0300
Message-ID: <1307602388.7374.13.camel@localhost>
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

On Wed, 2011-06-08 at 11:25 -0700, Brian Norris wrote:
> -		printk(KERN_DEBUG "Bad block table written to 0x%012llx, version "
> +		pr_debug("Bad block table written to 0x%012llx, version "
>  		       "0x%02X\n", (unsigned long long)to, td->version[chip]);

Hmm, the side effect of this change is this message will disappear if
DEBUG is undefined / dynamic debugging is disabled.

So I think we need to change all these pr_debug to pr_info, because this
is really just info.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
