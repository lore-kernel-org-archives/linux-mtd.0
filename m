Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17RtxK-0006hT-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Jul 2002 13:18:58 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200207091032.g69AWUV27220@localhost.localdomain> 
References: <200207091032.g69AWUV27220@localhost.localdomain> 
To: Clive Davies <cdavies@altera.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: add_mtd_partition question 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 09 Jul 2002 13:18:55 +0100
Message-ID: <15331.1026217135@redhat.com>
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
> So if there are no objections, I'll commit the following change... 

Er, why? It's private to the underlying MTD driver, and all the partition
wrappers should be passing the _original_ mtd_info to the underlying driver,
shouldn't they?

--
dwmw2
