Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IlSSB-0006B9-RI
	for linux-mtd@lists.infradead.org; Fri, 26 Oct 2007 17:54:38 +0100
Message-ID: <47221BB4.5000303@ru.mvista.com>
Date: Fri, 26 Oct 2007 20:54:12 +0400
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Valentine Barshak <vbarshak@ru.mvista.com>
Subject: Re: [PATCH 2/2] PowerPC: NDFC entry for PowerPC 440EPx Sequoia DTS
References: <20071026164130.GA11812@ru.mvista.com>
In-Reply-To: <20071026164130.GA11812@ru.mvista.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, tglx@linutronix.de, sr@denx.de,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Valentine Barshak wrote:

> NDFC (NAND Flash Controller) DTS entry for PowerPC 440EPx Sequoia board.
> The NDFC is relocatable in EBC space.

> Signed-off-by: Valentine Barshak <vbarshak@ru.mvista.com>

    You need to documents the layout in  the 
Documentation/powerpc/booting-without-of.txt file

WBR, Sergei
