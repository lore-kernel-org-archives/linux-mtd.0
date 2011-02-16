Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PpXRv-00039Y-1G
	for linux-mtd@lists.infradead.org; Wed, 16 Feb 2011 02:49:03 +0000
Received: by iyh42 with SMTP id 42so744207iyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Feb 2011 18:49:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1297820878-2582-1-git-send-email-computersforpeace@gmail.com>
References: <1297820878-2582-1-git-send-email-computersforpeace@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 15 Feb 2011 21:48:40 -0500
Message-ID: <AANLkTikecSEAs_mjKY6XXHeN86iJsWrLfUB6Ydxbu=2B@mail.gmail.com>
Subject: Re: [PATCH] mtd-utils: common.h: simple_strtoll type usage
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>,
	linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 15, 2011 at 20:47, Brian Norris wrote:
> We must use "long long" and "unsigned long long" types when
> implementing the functions "simple_strtoll()" and "simple_strtoull()",
> respectively. This prevents casting/truncation errors on systems where
> "long" is not the same size as "long long" (that is, on most systems).

Acked-by: Mike Frysinger <vapier@gentoo.org>
-mike
