Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVFtS-0002aU-9g
	for linux-mtd@lists.infradead.org; Tue, 01 Jun 2004 16:29:54 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Bernardo Innocenti <bernie@develer.com>
In-Reply-To: <40BCE3FD.4080500@develer.com>
References: <40BCE3FD.4080500@develer.com>
Content-Type: text/plain
Date: Tue, 01 Jun 2004 21:29:43 +0100
Message-Id: <1086121783.4273.0.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: TRIVIAL: Fix linux/mtd/nftl.h for user-space inclusion
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-06-01 at 22:15 +0200, Bernardo Innocenti wrote:
> Fix linux/mtd/nftl.h for user-space inclusion (required to build mtd-utils).
> 
> Please apply.

It should be including mtd/nftl-user.h not linux/nftl.h

-- 
dwmw2
