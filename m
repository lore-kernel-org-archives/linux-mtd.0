Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15CH1G-0003Vy-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jun 2001 09:37:54 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B2F0D7C.AEB02B3E@inventel.fr> 
References: <3B2F0D7C.AEB02B3E@inventel.fr> 
To: Xavier DEBREUIL <xde@inventel.fr>
Cc: linux-mtd@lists.infradead.org
Subject: Re: use of low level driver 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 19 Jun 2001 09:40:15 +0100
Message-ID: <24709.992940015@redhat.com>
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

xde@inventel.fr said:
>  But, if I want to call do_map_probe("cfi" or "cfi_intel",...), I need
> to have registered the corresponding mtd chip driver. But when it is
> part of the kernel (not a module), "mod_init_t cfi_intelext_init(void)"
>  is not called in kernel initialisation ? (correct?) 

The Intel command set code is a back end only. It doesn't have any code for 
probing the chips, and should be invoked only from a driver which can do 
so. At the moment, the only driver which can do that is the CFI probe. If 
you want to use the cfi_cmdset_0001 code with non-CFI chips, you need to 
write your own probe code which will identify the chip, set up a dummy cfi 
structure, and swap the chip driver operations with the cfi_cmdset_0001 
back end as the cfi_probe code does.

--
dwmw2
