Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16A7Wm-0002cT-00
	for <linux-mtd@lists.infradead.org>; Sat, 01 Dec 2001 10:37:48 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0111301312080.28829-100000@server.superbt.com> 
References: <Pine.LNX.4.33.0111301312080.28829-100000@server.superbt.com> 
To: Ilguiz Latypov <ilatypov@superbt.com>
Cc: Felix Frey <ffrey@freesurf.ch>,
    Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Booting from DOC-Millenium 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 01 Dec 2001 10:48:19 +0000
Message-ID: <17655.1007203699@redhat.com>
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

ilatypov@superbt.com said:
>  There is no Millenium-specific use of ReadPipeInit and LastDataRead
> registers in the DOC patch to stage2 of Grub-0.90.  Only slow reads
> and writes through CDSN Slow I/O register are implemented. 

Eep, sorry - I'd forgotten that Grub was DOC2000-only. Shouldn't be too 
hard to fix though, if anyone cares enough.

--
dwmw2
