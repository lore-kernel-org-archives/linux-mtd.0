Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19FV2l-00014N-C0
	for <linux-mtd@lists.infradead.org>; Tue, 13 May 2003 09:21:51 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Matthew Dharm <mdharm@momenco.com>
In-Reply-To: <NEBBLJGMNKKEEMNLHGAIEEHGDAAA.mdharm@momenco.com>
References: <NEBBLJGMNKKEEMNLHGAIEEHGDAAA.mdharm@momenco.com>
Message-Id: <1052814125.10222.44.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 13 May 2003 09:22:05 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: DiskOnChip 2000 128Mb problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-05-13 at 02:42, Matthew Dharm wrote:
> I'm starting to wonder if M-Systems has changed their on-chip data
> format from NFTL to something else....

You could also try just running nftl_format on it and reverting to the
old NFTL format, given that you don't seem to have any bad blocks
marked.

-- 
dwmw2
