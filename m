Received: from 235-216.205.122.dellhost.com ([216.205.122.235] helo=imagequestdesign.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17accj-0003gx-00
	for <linux-mtd@lists.infradead.org>; Fri, 02 Aug 2002 14:37:45 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: Ilguiz Latypov <ilatypov@superbt.com>
Subject: Re: [patch] doc_stage1.S : GRUB on DoC
Date: Fri, 2 Aug 2002 09:37:08 -0400
Cc: linux-mtd@lists.infradead.org
References: <Pine.LNX.4.44.0208011941330.25251-100000@server.superbt.com>
In-Reply-To: <Pine.LNX.4.44.0208011941330.25251-100000@server.superbt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200208020933750.SM02488@there>
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

Ilguiz Latypov wrote:
> Would this modification make a difference?  It seems we read the first
> flash block into a different address when identifying the chip.

This didn't make any difference.  It still works find on the faster machine; 
reboots on the P133.

Using GRUBSTART:0 is probably the better way to do this: GRUBSTART:0 is 
equivalent to GRUBLOADSEG:GRUBLOADOFS (8200:0, 07E0:400), and using zero as 
the offset causes the "read block" command to send an address of 0 after 
sending the READID command, similar to the way it's done in bdev_diskonchip.c.

Either way, the result (mfg/id code) temporarily ends up at 8200:0, prior to 
be replaced by the Grub code.

Mark

> -       movw    $1, %cx         /* read just one page */
> -       movw    $GRUBSTART, %ax
> +       movw    $1, %cx			/* read just one block */
> +       movw    $GRUBLOADSEG, %ax
>         movw    %ax, %es
> -       movw    $0, %di
> +       movw    $GRUBLOADOFS, %di
>         call    read_block
