Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15U3Sg-0007GV-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2001 10:47:42 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <002101c11b34$b32cc6b0$0600a8c0@magneticscrolls.com> 
References: <002101c11b34$b32cc6b0$0600a8c0@magneticscrolls.com> 
To: "Ken Gordon" <ken@magneticscrolls.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 scary messages 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 07 Aug 2001 10:53:29 +0100
Message-ID: <1470.997178009@redhat.com>
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

ken@magneticscrolls.com said:
>  jffs2_scan_empty(): Empty block at 0x00c8fffc ends at 0x00c90000 (with 0xe0021985)! Marking dirty
> jffs2_scan_empty(): Empty block at 0x00cafffc ends at 0x00cb0000 (with 0xe0021985)! Marking dirty

You probably didn't give mkfs.jffs2 the correct '-e' option to tell it the 
erase size. Harmless.

> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00d00070: 0x1a1a instead 

Looks like you're using the Compaq bootldr, which always used to write 
some crap at the end of a downloaded image if you didn't pad it to the end 
of a block with 0xFF. I think it should be fixed in later versions, or use 
the '-p' option to mkfs.jffs2 to pad the image to the next erase block
boundary.

ken@magneticscrolls.com said:
>  I'm becoming a bit paranoid about JFFS2. I find that with only 16MB
> of flash getting to within a couple of hundred k of a full filesystem
> tends to result in an unrebootable system. Running 32MB seems much
> better.

What does 'unrebootable' mean?

> Another random question - does 'sync' do what might be expected or is
> it a no-op? 

Both. All operation on JFFS2 is synchronous anyway, so 'sync' is a no-op. 
But equally, you can be 100% sure that after a 'sync' everything is flushed 
to the flash - because it already was :)

--
dwmw2
