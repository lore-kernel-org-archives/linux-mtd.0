Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R2kW2-0007J1-7m
	for linux-mtd@lists.infradead.org; Sun, 11 Sep 2011 13:56:11 +0000
Received: by mail-pz0-f41.google.com with SMTP id 4so6691249pzk.28
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Sep 2011 06:56:09 -0700 (PDT)
Subject: Re: [PATCH 05/14] mtd: nand: remove unnecessary variable
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 11 Sep 2011 16:58:35 +0300
In-Reply-To: <1315426421-16243-6-git-send-email-computersforpeace@gmail.com>
References: <1315426421-16243-1-git-send-email-computersforpeace@gmail.com>
	<1315426421-16243-6-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1315749520.18731.68.camel@sauron>
Mime-Version: 1.0
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Matthieu Castet <matthieu.castet@parrot.com>,
	Jim Quinlan <jim2101024@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-09-07 at 13:13 -0700, Brian Norris wrote:
> `writeops' is unnecessary in the function `nand_update_bbt()'
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed to my tree, thanks!

-- 
Best Regards,
Artem Bityutskiy
