Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15XOWu-0005ic-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 Aug 2001 15:53:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010816145423.TSUR13128.fep02@yunux> 
References: <20010816145423.TSUR13128.fep02@yunux> 
To: Yunus Yucel Altunbicak <yunus.altunbicak@eliar.com.tr>
Cc: MTD <linux-mtd@lists.infradead.org>
Subject: Re: MTD support to kernel 2.0.38 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 16 Aug 2001 15:59:42 +0100
Message-ID: <16330.997973982@redhat.com>
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

yunus.altunbicak@eliar.com.tr said:
>  Hi, does  the mtd driver support uclinux with 2.0.38 kernel?
> Sincerely,

Theoretically, yes. It should. I don't test builds with the 2.0 kernel, 
and occasionally somebody complains that I broke the 2.0 build and gives me 
patches. YMMV. If it doesn't work, I'll accept patches to make it work.

--
dwmw2
