Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KO3RZ-0005gn-Ia
	for linux-mtd@lists.infradead.org; Wed, 30 Jul 2008 04:37:45 +0000
Date: Tue, 29 Jul 2008 21:37:33 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Brownell <david-b@pacbell.net>
Subject: Re: [RESEND x2 PATCH 2.6.26-git 1/2] MTD DataFlash: bugfix, binary
	page sizes now handled (v3)
Message-Id: <20080729213733.3345546a.akpm@linux-foundation.org>
In-Reply-To: <200807270325.13790.david-b@pacbell.net>
References: <200807270325.13790.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, Bryan Wu <cooloney@kernel.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 27 Jul 2008 03:25:13 -0700 David Brownell <david-b@pacbell.net> wrote:

> From: David Brownell <dbrownell@users.sourceforge.net>
> 
> The wrong version of the "teach dataflash about binary density" patch
> just got merged (v2 not v3) ... this restores the missing updates:
> 
>   * Fix the cmdlinepart *regression* that caused testing failures (!!)
>     by restoring the original part labels in relevant cases.
> 
>   * Don't reference things that don't exist (!)
> 	- An opcode that doesn't even exist for DataFlash
> 	- The part is "at45db642" not "at45db641"
> 	- ID zero in this JEDEC table
> 
>   * Make the JEDEC probe routine report and handle errors better:
> 	- If the SPI calls fail, return the error codes.
> 	- Don't depend on ordering of table entries.
> 	- Unrecognized ids are different from parts that have no ID.
>           We won't actually know how to handle them correctly; display
> 	  the ID and ignore the chip.
> 
>   * Move the original block comment about the "legacy" chip ID scheme
>     back next to the code to which it applies ... not next to the new
>     JEDEC query code, which uses an entirely different strategy.
> 
>   * Don't print a guessed erasesize; /proc/mtd has the real value.
> 
> And add a few more comments.
> 

drivers/mtd/devices/mtd_dataflash.c: In function 'jedec_probe':
drivers/mtd/devices/mtd_dataflash.c:611: error: incompatible type for argument 1 of 'dev_name'
drivers/mtd/devices/mtd_dataflash.c:619: error: incompatible type for argument 1 of 'dev_name'
