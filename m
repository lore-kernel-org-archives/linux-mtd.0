Received: from [62.254.213.145] (helo=cambridgebroadband.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16VZ9z-0002Sa-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 Jan 2002 14:22:56 +0000
Message-ID: <3C56B2BC.2E3AC6D9@cambridgebroadband.com>
Date: Tue, 29 Jan 2002 14:33:32 +0000
From: Alex Zeffertt <ajz@cambridgebroadband.com>
MIME-Version: 1.0
CC: linuxppc-embedded <linuxppc-embedded@lists.linuxppc.org>,
        "mtd@infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2: strange output
References: <3C569C1A.38BBF76F@etx.ericsson.se>  <3C5673A4.662CC3E6@cambridgebroadband.com> <11887.1012310001@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

> 
> Those messages are harmless. They're removed in non-ancient versions of the
> code. The system slows down partly due to the garbage collection, and
> partly due to the spewing of these messages.
> 

Thanks, I guess I'll just comment out the printk then.

Alex
