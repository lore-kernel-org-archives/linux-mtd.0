Received: from mail.gmx.de ([213.165.64.20] helo=mail.gmx.net)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0pjS-0003RJ-F1
	for linux-mtd@lists.infradead.org; Fri, 27 Aug 2004 19:02:07 -0400
From: Dominik Karall <dominik.karall@gmx.net>
To: linux-mtd@lists.infradead.org
Date: Sat, 28 Aug 2004 01:06:25 +0200
References: <05b901c48c7f$df752c70$fd0ba8c0@briantpc>
In-Reply-To: <05b901c48c7f$df752c70$fd0ba8c0@briantpc>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200408280106.25436.dominik.karall@gmx.net>
Cc: Brian T <btuch@usa.net>
Subject: Re: Error: jffs2_decompress returned -5
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 27 August 2004 23:50, Brian T wrote:
> So,
>
> After patching 2.4.27 with the snapshot from today, and adding "__ffs" to
> compatmac.h , everything compiles, but then when reading my jffs2 file
> system I get this :
>
> Freeing unused kernel memory: 68k freed
> JFFS2 compression type 0x06 not available.
> Error: jffs2_decompress returned -5
> JFFS2 compression type 0x06 not available.
> Error: jffs2_decompress returned -5
> Kernel panic: No init found.  Try passing init= option to kernel.
>
>
> I haven't seen those errors before.   Anyone care to point me in the right
> direction?
>
> Thanks,
>
> -Brian

I think you specified a compression type when building the image with 
mkfs.jffs2, which isn't selected in the kernel config. But I can't tell you 
which type 0x06 is.

regards,
dominik
