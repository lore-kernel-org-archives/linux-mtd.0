Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 181Rga-0007JR-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2002 14:24:36 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200210151321.g9FDLP722607@localhost.localdomain> 
References: <200210151321.g9FDLP722607@localhost.localdomain>  <200210151025.g9FAP9221781@localhost.localdomain> <19345.1034676569@passion.cambridge.redhat.com> <26135.1034678204@passion.cambridge.redhat.com> 
To: Clive Davies <cdavies@altera.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] add access to AMD secure silicon area 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 15 Oct 2002 14:24:29 +0100
Message-ID: <13738.1034688269@passion.cambridge.redhat.com>
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
> > And CFI_DEVICETYPE_X8 is always correct? No X16 devices?
> Good point, how about ....

Looks saner to me.


--
dwmw2
