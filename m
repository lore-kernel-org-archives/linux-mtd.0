Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1POYIs-0006EX-TH
	for linux-mtd@lists.infradead.org; Fri, 03 Dec 2010 16:16:11 +0000
Received: by bwz5 with SMTP id 5so8812782bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Dec 2010 08:16:09 -0800 (PST)
Subject: Re: [PATCH] mtd: OneNAND: Fix 4KiB pagesize OOB handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <20101202002416.GA807@july>
References: <20101202002416.GA807@july>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Dec 2010 18:14:39 +0200
Message-ID: <1291392879.2365.69.camel@localhost>
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

On Thu, 2010-12-02 at 09:24 +0900, Kyungmin Park wrote:
> From: Kyungmin Park <kyungmin.park@samsung.com>
> 
> Original 4KiB pagesize chip (SLC) doesn't support OOB operations at Spec.
> And it's also same at Flex-OneNAND.
> 
> Remove the MLC macro if possible and use 4KiB pagesize macro since MLC has 4KiB pagesize.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
