Received: from [66.35.227.11] (helo=www.altera.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 168iGC-0004dR-00
	for <linux-mtd@lists.infradead.org>; Tue, 27 Nov 2001 13:26:52 +0000
Message-Id: <200111271335.fARDZV017308@localhost.localdomain>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Clive Davies <cdavies@altera.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Add map driver for epxa10db platform
Date: Tue, 27 Nov 2001 13:35:29 +0000
Cc: linux-mtd@lists.infradead.org
References: <200111231023.fANANpt11197@localhost.localdomain> <13263.1006858239@redhat.com>
In-Reply-To: <13263.1006858239@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> Go for it - thanks. Could you make all the functions and data static,
> please, and note that this won't compile:
>
> Could this be made to depend on CONFIG_ARCH_CAMELOT too?

Ok, I'll fix all that.
