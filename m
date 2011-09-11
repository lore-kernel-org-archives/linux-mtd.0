Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R2kVd-0007J1-3L
	for linux-mtd@lists.infradead.org; Sun, 11 Sep 2011 13:55:45 +0000
Received: by pzk4 with SMTP id 4so6691249pzk.28
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Sep 2011 06:55:43 -0700 (PDT)
Subject: Re: [PATCH 01/14] mtd: nand: refactor scanning code
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 11 Sep 2011 16:58:09 +0300
In-Reply-To: <1315426421-16243-2-git-send-email-computersforpeace@gmail.com>
References: <1315426421-16243-1-git-send-email-computersforpeace@gmail.com>
	<1315426421-16243-2-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1315749494.18731.66.camel@sauron>
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
> A few pieces of code are unnecessarily duplicated. For easier
> maintenance, we should fix this.
> 
> This should have no functional effect.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed to my tree, thanks!

-- 
Best Regards,
Artem Bityutskiy
