Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15kMTE-0004DI-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Sep 2001 10:19:40 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BAB0731.CD452A12@openwide.fr> 
References: <3BAB0731.CD452A12@openwide.fr> 
To: Pierre Ficheux <pierre.ficheux@openwide.fr>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Pb compiling MTD on 2.4.9, RH-7.1 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 21 Sep 2001 10:28:26 +0100
Message-ID: <21609.1001064506@redhat.com>
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


pierre.ficheux@openwide.fr said:
> 
> 	I've tried to compile MTD support in 2.4.9 kernel on a RH-7.1
> distribution and I got strange compilation errors: 

Missing #include <linux/interrupt.h>. This should be fixed in CVS.

--
dwmw2
