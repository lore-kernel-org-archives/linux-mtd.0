Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A1twL-000415-LV
	for <linux-mtd@lists.infradead.org>; Tue, 23 Sep 2003 21:39:17 +0100
Date: Tue, 23 Sep 2003 22:37:20 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Felipe W Damasio <felipewd@terra.com.br>
Message-ID: <20030923203720.GB1599@wohnheim.fh-wedel.de>
References: <3F709E0D.7090307@terra.com.br>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3F709E0D.7090307@terra.com.br>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: Andrew Morton <akpm@osdl.org>
cc: linux-mtd@lists.infradead.org
cc: David Woodhouse <dwmw2@infradead.org>
cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Memory leak in mtd/chips/cfi_cmdset_0020.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 23 September 2003 16:25:01 -0300, Felipe W Damasio wrote:
> 
> 	Patch against 2.6-test5.
> 
> 	If other kmallocs failed after successfully allocating a "struct 
> mtd_info", it should be freed before returning NULL.
> 
> 	This function is called by inter_module_register...so I'm not sure 
> 	it should really be freed...please review :)
> 
> 	Don't have the hardware, so just compilation checked.

Very few people do, STMicro sells those chips to a handpicked group of
users only.  And none of them use 2.6 yet, to my knowledge.  But your
patch looks fine, so please do apply, Andrew and David.

Jörn

-- 
A defeated army first battles and then seeks victory.
-- Sun Tzu
