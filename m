Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173BsP-0003Ea-00
	for <linux-mtd@lists.infradead.org>; Thu, 02 May 2002 09:23:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3CD0E35B.4010606@bigpond.com> 
References: <3CD0E35B.4010606@bigpond.com> 
To: brendan.simon@bigpond.com
Cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: docprobe.c on PowerPC 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 02 May 2002 09:23:25 +0100
Message-ID: <17308.1020327805@redhat.com>
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

brendan.simon@bigpond.com said:
>  Where do these definitions come from  (or where are they supposed to
> be defined) ?  In GCC, the linux kernel  or should the MTD code use
> __PPC__ instead ??? 

They come from GCC and aren't really expected to be consistent across 
architectures. I've changed docprobe.c to use __PPC__. Thanks for pointing 
it out. I don't remember where that PPC address came from - perhaps they 
should be platform-specific like the Ocelot one, not arch-specific.

--
dwmw2
