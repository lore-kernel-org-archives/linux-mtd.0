Received: from mail-ew0-f43.google.com ([209.85.215.43])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSXKc-0003W6-Q3
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 16:02:27 +0000
Received: by ewy22 with SMTP id 22so434618ewy.30
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Dec 2010 08:02:24 -0800 (PST)
Subject: Re: [PATCH] mtd: OneNAND: Fix multi block erase support at 4KiB
	pagesize
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <20101206000518.GA18352@july>
References: <20101206000518.GA18352@july>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 14 Dec 2010 18:01:55 +0200
Message-ID: <1292342515.2538.66.camel@localhost>
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

On Mon, 2010-12-06 at 09:05 +0900, Kyungmin Park wrote:
> From: Kyungmin Park <kyungmin.park@samsung.com>
> 
> Original 4KiB pagesize chip (SLC) doesn't support Multi block erase at Spec.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Pushed to l2-mtd-2.6.git, thank you!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
