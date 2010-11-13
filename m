Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PHDhT-00017m-PX
	for linux-mtd@lists.infradead.org; Sat, 13 Nov 2010 10:51:19 +0000
Received: by bwz5 with SMTP id 5so3941329bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Nov 2010 02:51:14 -0800 (PST)
Subject: Re: [PATCH] mtd: OneNAND: Fix page offset handling at 2KiB pagesize
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <20101102012846.GA2470@july>
References: <20101102012846.GA2470@july>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 13 Nov 2010 12:51:02 +0200
Message-ID: <1289645462.2218.14.camel@localhost>
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

On Tue, 2010-11-02 at 10:28 +0900, Kyungmin Park wrote:
> From: Kyungmin Park <kyungmin.park@samsung.com>
> 
> When use the 2KiB pagesize, it should be set the correct page offset.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Pushed to l2-mtd-2.6.git, thank you.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
