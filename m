Received: from [62.221.7.202] (helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16uuaW-0005UP-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Apr 2002 13:19:04 +0100
Date: Tue, 9 Apr 2002 13:18:56 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Stefan Warmuth <hxos@rz.fh-augsburg.de>
cc: linux-mtd@lists.infradead.org
Subject: Re: Problems with writing on jffs2
In-Reply-To: <200204080906.47847.hxos@rz.fh-augsburg.de>
Message-ID: <Pine.LNX.4.44.0204091318290.14539-100000@lapdancer.baythorne.internal>
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

On Mon, 8 Apr 2002, Stefan Warmuth wrote:

> Hi all
> 
> I have trouble with our custom-made arm platform. We use a Intel SA-1110 
> processor and Intel 28F640J3A Flash-Memory. We use 2.4.17-rmk5 kernel.

2.4.17-rmk5 unaligned fixups were broken. Upgrade.

-- 
dwmw2
