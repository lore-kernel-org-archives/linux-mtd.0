Received: from tim.rpsys.net ([194.106.48.114])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GAUbB-0003hi-8X
	for linux-mtd@lists.infradead.org; Tue, 08 Aug 2006 12:38:36 -0400
Subject: Re: JFFS2 file address space  operation
From: Richard Purdie <rpurdie@rpsys.net>
To: Amit Kumar Sharma <sharma.amit@samsung.com>
In-Reply-To: <001d01c6bad2$928c8920$3d92340c@dsn.sec.samsung.com>
References: <001d01c6bad2$928c8920$3d92340c@dsn.sec.samsung.com>
Content-Type: text/plain
Date: Tue, 08 Aug 2006 17:38:28 +0100
Message-Id: <1155055108.5541.16.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-08-08 at 19:08 +0900, Amit Kumar Sharma wrote:
> I find mmap operation for file failed in JFFS2, I find Jffs2 does not
> support writepage in JFFS2 file address operation .I would like to know
> reason for not supporting writepage operation for file address operation.

JFFS2 supports compression so there often isn't anything you can mmap
directly.

Richard
