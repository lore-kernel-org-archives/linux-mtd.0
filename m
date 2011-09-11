Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R2iox-0005tu-SE
	for linux-mtd@lists.infradead.org; Sun, 11 Sep 2011 12:07:36 +0000
Received: by pzk4 with SMTP id 4so6568418pzk.28
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Sep 2011 05:07:34 -0700 (PDT)
Subject: Re: [PATCH 05/12] mtd: rename MTD_OOB_* to MTD_OPS_*
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 11 Sep 2011 15:10:00 +0300
In-Reply-To: <1314755147-17756-6-git-send-email-computersforpeace@gmail.com>
References: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
	<1314755147-17756-6-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1315743005.18731.36.camel@sauron>
Mime-Version: 1.0
Cc: b35362@freescale.com, Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-08-30 at 18:45 -0700, Brian Norris wrote:
> These modes are not necessarily for OOB only. Particularly, MTD_OOB_RAW
> affected operations on in-band page data as well. To clarify these
> options and to emphasize that their effect is applied per-operation, we
> change the primary prefix to MTD_OPS_.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

This patch depends on the other ones, so I have to wait for v2, sorry.

-- 
Best Regards,
Artem Bityutskiy
