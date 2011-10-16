Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RFPSt-0000oF-3C
	for linux-mtd@lists.infradead.org; Sun, 16 Oct 2011 12:05:15 +0000
Received: by wwj40 with SMTP id 40so275220wwj.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 Oct 2011 05:05:13 -0700 (PDT)
Subject: Re: [PATCH] mtd: nand: initialize ops.mode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 16 Oct 2011 15:04:47 +0300
In-Reply-To: <1318648173-17775-1-git-send-email-computersforpeace@gmail.com>
References: <1318648173-17775-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318766694.2935.21.camel@sauron>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-10-14 at 20:09 -0700, Brian Norris wrote:
> Our `ops' information was converted to a local variable recently, and
> apparently, old code relied on the fact that the global version was
> often left in a valid mode. We can't make this assumption on local
> structs, and we shouldn't be relying on a previous state anyway.
> 
> Instead, we initialize mode to 0 for don't-care situations (i.e., the
> operation does not use OOB anyway) and MTD_OPS_PLACE_OOB when we want to
> place OOB data.
> 
> This fixes a bug with nand_default_block_markbad(), where we catch on
> the BUG() call in nand_fill_oob():

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
