Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FN4oh-0004R5-T5
	for linux-mtd@lists.infradead.org; Sat, 25 Mar 2006 04:12:21 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Han Chang <posaune@hotmail.com>
In-Reply-To: <BAY101-F7B62563E26F6D6318B633BCDF0@phx.gbl>
References: <BAY101-F7B62563E26F6D6318B633BCDF0@phx.gbl>
Content-Type: text/plain
Date: Sat, 25 Mar 2006 12:11:42 +0300
Message-Id: <1143277902.3579.0.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 & NAND problem.
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-03-24 at 10:44 -0800, Han Chang wrote:
> jffs2_get_inode_nodes(): CRC failed on node at 0x0005efd0: Read 0xffffffff, 
> calc
> ulated 0x6791a538
I would suggest you to dig your drivers - do they function well?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
