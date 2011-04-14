Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QALaB-0004kB-EY
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 12:23:36 +0000
Received: by eyh6 with SMTP id 6so504665eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Apr 2011 05:23:33 -0700 (PDT)
Subject: Re: [PATCH] nand: Remove doubled chip deselection on (un)lock
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jiri Pinkava <jiri.pinkava@vscht.cz>
In-Reply-To: <1302690408-17498-1-git-send-email-jiri.pinkava@vscht.cz>
References: <1302690408-17498-1-git-send-email-jiri.pinkava@vscht.cz>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 14 Apr 2011 15:20:38 +0300
Message-ID: <1302783638.2796.26.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, ben-linux@fluff.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-04-13 at 12:26 +0200, Jiri Pinkava wrote:
> Chip deselection is already done in nand_release_device. So only
> duplicate code.
> 
> Signed-off-by: Jiri Pinkava <jiri.pinkava@vscht.cz>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
