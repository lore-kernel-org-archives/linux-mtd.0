Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D5P0a-0005gB-2s
	for linux-mtd@lists.infradead.org; Sun, 27 Feb 2005 09:02:57 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1109500233.27107.20.camel@localhost.localdomain>
References: <Pine.LNX.4.58.0501031923110.14981@phoenix.infradead.org>
	<1104924806.5547.49.camel@baythorne.infradead.org>
	<41DBF5F2.5040208@yandex.ru>
	<1109500233.27107.20.camel@localhost.localdomain>
Content-Type: text/plain
Date: Sun, 27 Feb 2005 17:02:22 +0300
Message-Id: <1109512942.13512.44.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] JFFS[23] slab corruption
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2005-02-27 at 10:30 +0000, David Woodhouse wrote:
> ic will have no nodes when they've all been actually removed or marked
> obsolete -- that's either in mark_node_obsolete() in the case of NOR
> flash, or somewhere in erase.c in the case of NAND.
> 
> Until all the nodes are actually gone, we mustn't re-use the old inode
> number for new inodes, so the ic has to stay in the list.
> 
Well, I don't quite well remember why I asked that.

Now your patch looks sane for me. I've tried it with both NAND and NOR
and haven't seen something bad.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
