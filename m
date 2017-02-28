Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cickC-0006zi-9Y
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2017 08:02:49 +0000
Date: Tue, 28 Feb 2017 09:02:16 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, masahiroy@kernel.org, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [NAND Question] When oob_required is used?
Message-ID: <20170228090216.79554017@bbrezillon>
In-Reply-To: <CAK7LNARAURP5-vbFZUUo1Wm9hudHw5DTuaQHz-TJGjdsXij38g@mail.gmail.com>
References: <CAK7LNARAURP5-vbFZUUo1Wm9hudHw5DTuaQHz-TJGjdsXij38g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 28 Feb 2017 16:21:50 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi.
> 
> 
> I am seeing the reference implementations for the callback
> in drivers/mtd/nand/nand_base.c
> 
> 
> I see only some of them use the argument "oob_required".
> 
> 
> - oob_required is used
> nand_read_page_raw()
> nand_write_page_raw()
> nand_write_subpage_hwecc()
> 
> 
> - oob_required is ignored
> nand_read_page_raw_syndrome()
> nand_read_page_swecc()
> nand_read_page_hwecc()
> nand_read_page_hwecc_oob_first()
> nand_read_page_syndrome()
> nand_write_page_raw_syndrome()
> nand_write_page_swecc()
> nand_write_page_hwecc()
> nand_write_page_syndrome()
> 
> 
> 
> I could not get the logic
> when "oob_required" is used.
> 
> 
> 
> When implementing drivers, the "oob_required"
> should be respected (i.e. oob_poi should be transferred as well),
> or is it OK to ignore it?
> 
> 

oob_required = true => you must retrieve OOB bytes
oob_required = false => you can optimize the process and ignore OOB
bytes, but you can also retrieve them if you don't care about
optimization. That's usually what's done when you have to retrieve ECC
bytes (retrieving a few extra OOB bytes is not expensive and usually
simplifies the logic, especially when free and ECC bytes are
interleaved in the OOB region).
