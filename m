Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MapX0-0004Zc-9N
	for linux-mtd@lists.infradead.org; Tue, 11 Aug 2009 11:28:46 +0000
Subject: Re: pmcmsp-flash.c: correct clean up?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roel Kluin <roel.kluin@gmail.com>
In-Reply-To: <4A7FD765.3020200@gmail.com>
References: <4A709A88.30103@gmail.com> <4A7EED48.6050103@gmail.com>
	<4A7FD765.3020200@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 11 Aug 2009 14:26:40 +0300
Message-Id: <1249990000.25202.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-08-10 at 10:16 +0200, Roel Kluin wrote:
> This also adds cleaning up after errors in init_msp_flash().
> 
> Also cleanup_msp_flash() attempts to determine the size of
> msp_flash with `sizeof(msp_flash) / sizeof(struct mtd_info **)'
> This will not work since msp_flash is not an array.
> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>

Taken to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
