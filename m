Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NcBpG-0007pB-9b
	for linux-mtd@lists.infradead.org; Tue, 02 Feb 2010 06:01:30 +0000
Received: by fxm1 with SMTP id 1so2162971fxm.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 01 Feb 2010 22:01:25 -0800 (PST)
Subject: Re: [PATCH] mtd: maps: Blackfin async: rename local funcs to avoid
	common clashes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1263743566-26986-1-git-send-email-vapier@gentoo.org>
References: <1263743566-26986-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 02 Feb 2010 08:01:23 +0200
Message-Id: <1265090483.2517.15.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-01-17 at 10:52 -0500, Mike Frysinger wrote:
> There are new Blackfin MMR helper functions that use the same name as some
> of the local functions in this driver, so have the driver use more specific
> names to avoid the issue.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed this to my l2-mtd-2.6 / master

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
