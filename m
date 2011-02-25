Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PstNz-0002ER-UH
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 08:50:52 +0000
Received: by wwb29 with SMTP id 29so1263402wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 00:50:50 -0800 (PST)
Subject: Re: [PATCH] mtd-utils: common.h: simple_strtoll type usage
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1297820878-2582-1-git-send-email-computersforpeace@gmail.com>
References: <1297820878-2582-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 10:49:28 +0200
Message-ID: <1298623768.2798.12.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>,
	linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-02-15 at 17:47 -0800, Brian Norris wrote:
> We must use "long long" and "unsigned long long" types when
> implementing the functions "simple_strtoll()" and "simple_strtoull()",
> respectively. This prevents casting/truncation errors on systems where
> "long" is not the same size as "long long" (that is, on most systems).
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed, thank you!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
