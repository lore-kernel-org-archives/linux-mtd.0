Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NhIZJ-0000o9-G0
	for linux-mtd@lists.infradead.org; Tue, 16 Feb 2010 08:14:10 +0000
Received: from vaebh105.NOE.Nokia.com (vaebh105.europe.nokia.com
	[10.160.244.31])
	by mgw-mx06.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o1G8DjP2003555
	for <linux-mtd@lists.infradead.org>; Tue, 16 Feb 2010 10:14:02 +0200
Subject: Re: [PATCH] OneNAND: OMAP: do not use DMA if oops in progress
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Aaro.Koskinen@nokia.com
In-Reply-To: <1265821399-29940-1-git-send-email-Aaro.Koskinen@nokia.com>
References: <1265821399-29940-1-git-send-email-Aaro.Koskinen@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 16 Feb 2010 10:12:58 +0200
Message-ID: <1266307978.11659.178.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, adrian.hunter@nokia.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-02-10 at 19:03 +0200, Aaro.Koskinen@nokia.com wrote:
> From: Aaro Koskinen <aaro.koskinen@nokia.com>
> 
> Otherwise we may hang if we are called from panic() through mtdoops.
> 
> Signed-off-by: Aaro Koskinen <aaro.koskinen@nokia.com>

Pushed to my l2-mtd-2.6.git / master.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
