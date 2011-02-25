Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PstZZ-0002My-O2
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 09:02:50 +0000
Received: by wyf23 with SMTP id 23so1449837wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 01:02:48 -0800 (PST)
Subject: Re: [PATCH 0/2] mtd: new option is added to control onenand init
	unlocking
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
In-Reply-To: <1297943082-398-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1297943082-398-1-git-send-email-roman.tereshonkov@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 11:01:14 +0200
Message-ID: <1298624474.2798.19.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kyungmin.park@samsung.com, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-02-17 at 13:44 +0200, Roman Tereshonkov wrote:
> New variable skip_initial_unlocking is added to the omap_onenand_platform_data and
> new option ONENAND_SKIP_INITIAL_UNLOCKING is added to struct onenand_chip. 
> This is used to to skip onenand unlocking when it is initialized.

Pushed both patches to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
