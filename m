Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 168feu-0004QI-00
	for <linux-mtd@lists.infradead.org>; Tue, 27 Nov 2001 10:40:12 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200111231023.fANANpt11197@localhost.localdomain> 
References: <200111231023.fANANpt11197@localhost.localdomain> 
To: Clive Davies <cdavies@altera.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Add map driver for epxa10db platform 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 27 Nov 2001 10:50:39 +0000
Message-ID: <13263.1006858239@redhat.com>
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

cdavies@altera.com said:
> Attached is a patch to add an mtd map driver for the Altera  epxa10
> development board. Any objections/comments?

Go for it - thanks. Could you make all the functions and data static, 
please, and note that this won't compile:

+ * $Id$ */
+ *
+ * This program is free software; you can redistribute it and/or modify

Could this be made to depend on CONFIG_ARCH_CAMELOT too?


--
dwmw2
