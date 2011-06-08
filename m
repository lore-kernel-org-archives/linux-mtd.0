Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUK7E-0005w0-Dt
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 14:52:17 +0000
Received: by yxk30 with SMTP id 30so260467yxk.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 07:52:14 -0700 (PDT)
Subject: Re: [PATCH 4/4] mtd: nand: define pr_fmt() to include __func__ in
	debug output
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1307487717-25402-5-git-send-email-computersforpeace@gmail.com>
References: <1307487717-25402-1-git-send-email-computersforpeace@gmail.com>
	<1307487717-25402-5-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 17:47:56 +0300
Message-ID: <1307544476.31223.119.camel@localhost>
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
> -				pr_info("nand_bbt: Error reading bad block table\n");
> +				pr_info("Error reading bad block table\n");

Compare:

read_bbt: Error reading bad block table
read_bbt: error reading bad block table

isn't the second version more correct? Or this depends on the country? I
prefer the latter, but as long as all messages are consistent, I do not
care much. What do you think?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
