Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17z1Lw-0008Ho-00
	for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2002 21:53:16 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200210082238.02460.haensse@swissembedded.com> 
References: <200210082238.02460.haensse@swissembedded.com> 
To: daniel.haensse@alumni.ethz.ch
Cc: JFFS developer mailing list <jffs-dev@axis.com>,
    linux-mtd@lists.infradead.org
Subject: Re: Eraseall crash on uclinux 2.4.19 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 08 Oct 2002 21:53:12 +0100
Message-ID: <6757.1034110392@passion.cambridge.redhat.com>
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

daniel.haensse@alumni.ethz.ch said:
> on line 142 a eraseall /dev/mtd0 stops with a failed 11 (EAGAIN)

>  Any idea what might be wrong?

Er, no -- I can't see how the erase function can return EAGAIN. Where's it 
coming from?


> Another question: Can we ignore the AMD_BOOTLOC_BUG and switch this
> off? Is this also Fujitsu  related? 

I think you can ignore it. It's only valid for AMD parts, I believe. Other 
people managed to get a simple table correct. Someone was going to clean 
that up.

--
dwmw2
