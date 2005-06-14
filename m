Received: from rdrz.de ([217.160.107.209])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Di4TE-0002aZ-U0
	for linux-mtd@lists.infradead.org; Tue, 14 Jun 2005 02:00:21 -0400
Date: Tue, 14 Jun 2005 08:00:13 +0200
From: Raphael Zimmerer <killekulla@rdrz.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050614060012.GQ27919@rdrz.de>
References: <004d01c57074$ad3758d0$6702a8c0@niro>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <004d01c57074$ad3758d0$6702a8c0@niro>
Subject: Re: suggestion on use of linux-mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 13, 2005 at 05:04:46PM -0700, Andre wrote:
> There is also a comment that says JFFS2 does not work on DOC, but I assume
> that comment is old. What exactly is the status of JFFS2 for diskonchip
> devices?

Depends on what driver you are using. With the drivers based on the nand
subsystem there shouldn't be any problem. The driver is named
diskonchip.c.

- kille
