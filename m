Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Loiy2-0008W8-Gv
	for linux-mtd@lists.infradead.org; Tue, 31 Mar 2009 18:45:50 +0000
Date: Tue, 31 Mar 2009 19:45:29 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Mike Rapoport <mike@compulab.co.il>
Subject: Re: [PATCH RESEND] MTD: maps/pxa2xx_flash: fix build breakage
Message-ID: <20090331184529.GB27451@n2100.arm.linux.org.uk>
References: <49D201BC.3050404@compulab.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49D201BC.3050404@compulab.co.il>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: nico@cam.org, linux-mtd <linux-mtd@lists.infradead.org>,
	ARM Linux <linux-arm-kernel@lists.arm.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 31, 2009 at 02:42:52PM +0300, Mike Rapoport wrote:
>   LD      init/built-in.o
>   LD      .tmp_vmlinux1
> `pxa2xx_flash_remove' referenced in section `.data' of
> drivers/built-in.o: defined in discarded section `.exit.text' of
> drivers/built-in.o
> make: *** [.tmp_vmlinux1] Error 1

I've sent a whole raft of these to the cause of these several days ago
to lkml and the cause of this breakage... waiting for it to hit Linus'
tree.
