Received: from imladris.demon.co.uk ([193.237.130.41] ident=exim)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 168ziP-0005zm-00
	for <linux-mtd@lists.infradead.org>; Wed, 28 Nov 2001 08:05:10 +0000
Date: Wed, 28 Nov 2001 08:15:41 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: <MQuicquaro@necinfrontia.com>
cc: <linux-mtd@lists.infradead.org>
Subject: Re: jffs2 as root
In-Reply-To: <OFDBD4D128.B09BAC8D-ON85256B11.007D0631@nitsuko.com>
Message-ID: <Pine.LNX.4.33.0111280815260.6874-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 27 Nov 2001 MQuicquaro@necinfrontia.com wrote:

> How can I make this filesystem have read/write priviledges?
> VFS mounts is as readonly.

mount -orw,remount /

-- 
dwmw2
