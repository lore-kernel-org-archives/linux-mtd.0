Received: from tomts17-srv.bellnexxia.net ([209.226.175.71])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17akQZ-0004Zi-00
	for <linux-mtd@lists.infradead.org>; Fri, 02 Aug 2002 22:57:43 +0100
Date: Fri, 2 Aug 2002 17:57:41 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Mark Meade <mark@lakeshoremicro.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: [patch] doc_stage1.S : GRUB on DoC
In-Reply-To: <Pine.LNX.4.44.0208021720020.1426-100000@server.superbt.com>
Message-ID: <Pine.LNX.4.44.0208021755070.3723-100000@server.superbt.com>
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

On Fri, 2 Aug 2002, Ilguiz Latypov wrote:

> It's not a big deal to downgrade the terminal emultaion changes, but I
> have some other issues at work till the middle of August.

I produce more noise than I code :)  I attempted to downgrade to 0.92 and 
added the grub-0.92-doc.patch to the CVS mtd/patches area.

Both 07-29 and 0.92 patches work with 32M DoC 2000 on the Advantech PCA 
6753 F board.

Ilguiz
