Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSWQb-0001fj-BH
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 15:36:50 +0000
Received: by eyh6 with SMTP id 6so894806eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 08:36:46 -0700 (PDT)
Subject: Re: [PATCH] nand: Remove meaningless delay from nand_unlock
From: Artem Bityutskiy <dedekind1@gmail.com>
To: jiri.pinkava@vscht.cz
In-Reply-To: <1306936600-28870-1-git-send-email-jiri.pinkava@vscht.cz>
References: <1306936600-28870-1-git-send-email-jiri.pinkava@vscht.cz>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jun 2011 18:32:36 +0300
Message-ID: <1307115156.3069.16.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-01 at 15:56 +0200, jiri.pinkava@vscht.cz wrote:
> From: Jiri Pinkava <jiri.pinkava@vscht.cz>
> 
> This delay is meaningless. If delay is needed it is device specific
> and must be reimplemented by specific driver, otherwise no delay is
> needed.
> 
> This function is not used by any current kernel code, affects only
> external code (like main).
> 
> Signed-off-by: Jiri Pinkava <jiri.pinkava@vscht.cz>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
