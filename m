Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17joRt-0003wH-00
	for <linux-mtd@lists.infradead.org>; Tue, 27 Aug 2002 23:04:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D6BF554.3090102@redswitch.com> 
References: <3D6BF554.3090102@redswitch.com> 
To: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: how to get mtd_info in kernel space? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 27 Aug 2002 23:04:31 +0100
Message-ID: <30390.1030485871@redhat.com>
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

Er, note also that if you've got a special device which contains only 
something odd like MAC address for a built-in network card, you don't have 
to register it with the core MTD code; you can make it available only to 
your network card driver via some private mechanism if you want.

--
dwmw2
