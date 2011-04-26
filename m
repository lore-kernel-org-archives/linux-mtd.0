Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QEd2a-0007Ma-4F
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 07:50:36 +0000
Received: by eyh6 with SMTP id 6so120337eyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Apr 2011 00:50:34 -0700 (PDT)
Subject: Re: [PATCH] mtdconcat: Fix NAND OOB write
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Felix Radensky <felix@embedded-sol.com>
In-Reply-To: <1303685832-17285-1-git-send-email-felix@embedded-sol.com>
References: <1303685832-17285-1-git-send-email-felix@embedded-sol.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 Apr 2011 10:47:01 +0300
Message-ID: <1303804021.2778.25.camel@localhost>
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

Added "Cc: stable@kernel.org" and pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
