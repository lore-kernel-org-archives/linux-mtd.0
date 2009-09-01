Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MiPJI-0002MN-LH
	for linux-mtd@lists.infradead.org; Tue, 01 Sep 2009 09:05:57 +0000
Subject: Re: [PATCH] inappropriate pending block in foldchain
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mohanlal Jangir <mohanlaljangir@gmail.com>
In-Reply-To: <58484c0e0908290317m62485b2bu6ca69db7de8111a5@mail.gmail.com>
References: <58484c0e0908290317m62485b2bu6ca69db7de8111a5@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 01 Sep 2009 12:04:29 +0300
Message-Id: <1251795869.3514.24.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2009-08-29 at 19:17 +0900, Mohanlal Jangir wrote:
> In function  INFTL_findwriteunit, inappropriate pending block
> parameter is passed which prevents 0xFFFF block copy during foldchain.
> This patch fixes the problem.

I could not find your signed-off-by line.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
