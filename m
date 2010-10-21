Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P8r1S-0006vT-G5
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2010 09:01:19 +0000
Subject: Re: [PATCH] mtd: OneNAND: S5PC110: Fix double call suspend &
	resume function
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <20101020083102.GA30414@july>
References: <20101020083102.GA30414@july>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 21 Oct 2010 11:57:28 +0300
Message-ID: <1287651448.2932.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-10-20 at 17:31 +0900, Kyungmin Park wrote:
> From: Kyungmin Park <kyungmin.park@samsung.com>
> 
> The suspend & resume called from mtd core. So no need to call at driver.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Pushed this one to my l2 tree, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
