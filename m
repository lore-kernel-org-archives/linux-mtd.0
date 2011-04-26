Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QEczW-0007KI-SH
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 07:47:27 +0000
Received: by eyh6 with SMTP id 6so119726eyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Apr 2011 00:47:24 -0700 (PDT)
Subject: Re: [PATCH] mtdconcat: Fix NAND OOB write
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Felix Radensky <felix@embedded-sol.com>
In-Reply-To: <1303685832-17285-1-git-send-email-felix@embedded-sol.com>
References: <1303685832-17285-1-git-send-email-felix@embedded-sol.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 Apr 2011 10:43:50 +0300
Message-ID: <1303803830.2778.24.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-04-25 at 01:57 +0300, Felix Radensky wrote:
> Currently mtdconcat is broken for NAND. An attemtpt to create
> JFFS2 filesystem on concatenation of several NAND devices fails
> with OOB write errors. This patch fixes that problem.
> 
> Signed-off-by: Felix Radensky <felix@embedded-sol.com>

Looks like material for -stable, no?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
