Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DBxyG-0007zd-3a
	for linux-mtd@lists.infradead.org; Thu, 17 Mar 2005 11:35:40 -0500
Date: Thu, 17 Mar 2005 17:35:26 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Mark A. Greer" <mgreer@mvista.com>
Message-ID: <20050317163526.GB10864@wohnheim.fh-wedel.de>
References: <42323A97.5070105@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42323A97.5070105@mvista.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	Embedded PPC Linux list <linuxppc-embedded@ozlabs.org>
Subject: Re: [PATCH 2.6.12] mtd: Remove MTD map file for Chestnut platform.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 11 March 2005 17:40:55 -0700, Mark A. Greer wrote:
> 
> Remove Chestnut mtd map file.
> 
> The chestnut now sets up its MTD map from its platform-specific file so 
> the map file drivers/mtd/maps/chestnut.c is no longer needed.  This 
> patch removes the file & the Kconfig/Makefile hooks.
> 
> Please apply.

Applied to mtd cvs.  It will make its way to Linus eventually...

Thanks!

Jörn

-- 
Sometimes, asking the right question is already the answer.
-- Unknown
