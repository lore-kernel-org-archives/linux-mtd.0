Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6eiD-0008Np-9A
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 08:00:37 +0000
Received: by fxm14 with SMTP id 14so4701339fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Apr 2011 01:00:35 -0700 (PDT)
Subject: Re: [PATCH 1/2] mtd: nand: renumber conflicting BBT flags
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1300510422-4841-1-git-send-email-computersforpeace@gmail.com>
References: <1300510422-4841-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 04 Apr 2011 10:58:05 +0300
Message-ID: <1301903885.2760.40.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-03-18 at 21:53 -0700, Brian Norris wrote:
> The NAND_USE_FLASH_BBT_NO_OOB and NAND_CREATE_EMPTY_BBT flags conflict
> with the NAND_BBT_SCANBYTE1AND6 and NAND_BBT_DYNAMICSTRUCT flags,
> respectively. This change will allow us to utilize these options
> independently.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

I've pushed both patches to l2-mtd-2.6.git, thanks.

P.S. Hopefully you won't be discouraged from doing further flags
polishing :-).

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
