Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PM0NJ-00012E-Ln
	for linux-mtd@lists.infradead.org; Fri, 26 Nov 2010 15:38:15 +0000
Received: by bwz5 with SMTP id 5so2021448bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Nov 2010 07:38:06 -0800 (PST)
Subject: Re: [PATCH] mtd: mtdchar: fix information leak to userland
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vasiliy Kulikov <segooon@gmail.com>
In-Reply-To: <1289054485-18190-1-git-send-email-segooon@gmail.com>
References: <1289054485-18190-1-git-send-email-segooon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 26 Nov 2010 17:37:30 +0200
Message-ID: <1290785850.2552.18.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-11-06 at 17:41 +0300, Vasiliy Kulikov wrote:
> Structure mtd_info_user is copied to userland with padding byted
> between "type" and "flags" fields uninitialized.  It leads to leaking
> of contents of kernel stack memory.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
