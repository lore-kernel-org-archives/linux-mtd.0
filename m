Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1618zZ-0008Eq-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Nov 2001 16:22:25 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20011106155218.FCST26177.fep02@yunux> 
References: <20011106155218.FCST26177.fep02@yunux> 
To: Yunus Yucel Altunbicak <yunus.altunbicak@eliar.com.tr>
Cc: MTD <linux-mtd@lists.infradead.org>
Subject: Re: problem with cross compiling 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 06 Nov 2001 16:31:44 +0000
Message-ID: <5886.1005064304@redhat.com>
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
>  does anybody encounter same error and solve it ?

Your libc is ancient and doesn't seem to provide pread() and pwrite(). 
Replacing them with wrappers which just seek and read/write should work.

--
dwmw2
