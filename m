Received: from mail-gx0-f172.google.com ([209.85.161.172])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R2jZi-0006Ub-S8
	for linux-mtd@lists.infradead.org; Sun, 11 Sep 2011 12:55:55 +0000
Received: by gxk19 with SMTP id 19so2740208gxk.31
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Sep 2011 05:55:52 -0700 (PDT)
Subject: Re: [PATCH v2 07/12] mtd: add MEMWRITE ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 11 Sep 2011 15:58:17 +0300
In-Reply-To: <1315587543-15598-1-git-send-email-computersforpeace@gmail.com>
References: <1314755147-17756-8-git-send-email-computersforpeace@gmail.com>
	<1315587543-15598-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1315745902.18731.44.camel@sauron>
Mime-Version: 1.0
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>,
	linux-mtd@lists.infradead.org, b35362@freescale.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-09-09 at 09:59 -0700, Brian Norris wrote:
> Implement a new ioctl for writing both page data and OOB to flash at the
> same time. This ioctl is intended to be a generic interface that can
> replace other ioctls (MEMWRITEOOB and MEMWRITEOOB64) and cover the
> functionality of several other old ones, e.g., MEMWRITE can:

Took v2.

-- 
Best Regards,
Artem Bityutskiy
