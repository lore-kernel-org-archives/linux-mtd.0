Received: from tomts16.bellnexxia.net ([209.226.175.4] helo=tomts16-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ahwW-0004Ij-00
	for <linux-mtd@lists.infradead.org>; Fri, 02 Aug 2002 20:18:32 +0100
Date: Fri, 2 Aug 2002 15:18:30 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Mark Meade <mark@lakeshoremicro.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: [patch] doc_stage1.S : GRUB on DoC
In-Reply-To: <Pine.LNX.4.44.0208020949420.26999-100000@server.superbt.com>
Message-ID: <Pine.LNX.4.44.0208021518030.27706-100000@server.superbt.com>
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

> I'd better assign (GRUBLOADSEG << 4) to %es and 0 to %di to stay safe 
> though.

I meant GRUBSTART >> 4.  Sorry.
