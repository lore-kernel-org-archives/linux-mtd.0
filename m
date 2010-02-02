Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NcGF2-0000ab-Td
	for linux-mtd@lists.infradead.org; Tue, 02 Feb 2010 10:44:27 +0000
Subject: Re: UBIFS assert failed in ubifs_dirty_inode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jeff Angielski <jeff@theptrgroup.com>
In-Reply-To: <4B5FADE8.30803@theptrgroup.com>
References: <4B591573.60602@theptrgroup.com>
	<1264480808.2401.78.camel@localhost.localdomain>
	<1264484928.3536.1017.camel@calx> <1264500214.3867.21.camel@localhost>
	<4B5F9A78.7080000@theptrgroup.com> <1264558433.3536.1543.camel@calx>
	<4B5FADE8.30803@theptrgroup.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 02 Feb 2010 12:42:15 +0200
Message-ID: <1265107335.4371.68.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
	Herbert Xu <herbert@gondor.apana.org.au>, Matt Mackall <mpm@selenic.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-01-26 at 22:07 -0500, Jeff Angielski wrote:
... snip ...
> Matt's patch that removes the offending code works fine.
... snip ...

Jeff, I've pushed the patches from Herbert's tree to the ubifs back-port
trees (ubifs-v2.6.28 - ubifs-v2.6.32).

Thanks everyone.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
