Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm6IL-0000eK-UP
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 15:12:58 +0000
Received: by ewy20 with SMTP id 20so1797328ewy.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 06 Feb 2011 07:12:56 -0800 (PST)
Subject: Re: [PATCH] mtd: tests : move ebcnt and pgcnt definitions before
	usage in printing.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
In-Reply-To: <1296733556-22196-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1296733556-22196-1-git-send-email-roman.tereshonkov@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 06 Feb 2011 17:12:04 +0200
Message-ID: <1297005124.4460.32.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, adrian.hunter@nokia.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-02-03 at 13:45 +0200, Roman Tereshonkov wrote:
> ebcnt and pgcnt variable initialization is moved before printk which
> uses them.
> 
> Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
