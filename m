Received: from toq5.bellnexxia.net ([209.226.175.27] helo=toq5-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17aEV9-0000vH-00
	for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2002 12:52:20 +0100
Date: Wed, 17 Jul 2002 14:35:17 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Mark Meade <mark@lakeshoremicro.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: [patch] doc_stage1.S : GRUB on DoC
In-Reply-To: <200207161454984.SM02488@there>
Message-ID: <Pine.LNX.4.44.0207171428020.4453-100000@server.superbt.com>
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

On Tue, 16 Jul 2002, Mark Meade wrote:

> Ilguiz -- is the DOC_MIL_KEEP_IPL option still used?

I never used this conditional piece of code because I don't have DoC
Millennium.  I added that code before I could better understand the
mechanism of initial loading with DoC Millennium.  I don't know if the
Millennium's own IPL can perform extra download from flash offset 1024.  
If it can't, the DOC_MIL_KEEP_IPL piece can be removed.

I am behind my schedule at work at this moment.  I will be able to test 
the improved code on DoC 2000 around next week.

Ilguiz
