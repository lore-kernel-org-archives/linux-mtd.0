Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NCab9-0008MN-1b
	for linux-mtd@lists.infradead.org; Mon, 23 Nov 2009 15:13:07 +0000
Subject: Re: [patch 3/4] mtd: error return -EIO instead of EIO
From: Artem Bityutskiy <dedekind1@gmail.com>
To: akpm@linux-foundation.org
In-Reply-To: <200911172245.nAHMjmsc001957@imap1.linux-foundation.org>
References: <200911172245.nAHMjmsc001957@imap1.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Nov 2009 17:12:44 +0200
Message-Id: <1258989164.18407.46.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: roel.kluin@gmail.com, dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-11-17 at 14:45 -0800, akpm@linux-foundation.org wrote:
> From: Roel Kluin <roel.kluin@gmail.com>
> 
> Return a negative error value instead of a positive
> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

This patch also sits in my tree, so this should not be forgotten.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
