Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7gJA-0004Yd-1Z
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 12:31:17 +0000
Date: Wed, 3 Oct 2018 14:30:54 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mtd: rawnand: ams-delta: use ->exec_op()
Message-ID: <20181003143054.597b3a9e@bbrezillon>
In-Reply-To: <20181003120028.9257-1-jmkrzyszt@gmail.com>
References: <20180719081508.5dafebde@bbrezillon>
 <20181003120028.9257-1-jmkrzyszt@gmail.com>
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

Hi Janusz,

On Wed,  3 Oct 2018 14:00:28 +0200
Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:

> Replace legacy callbacks with ->select_chip() and ->exec_op().

Thanks for working on that, that's really appreciated.

> 
> Implementation of NAND_OP_WAITRDY_INSTR has been based on legacy
> nand_wait_ready(),

I don't remember what the ams-delta ->dev_ready()/->waitfunc() hooks
are doing, but is shouldn't be too hard to replace them by an
ams_delta_wait_ready() func.

> otherwise that function would probabaly have to be

				^ probably


> reimplemented inside the driver.  Hence, legacy callback ->dev_ready()
> is still used.
> 
> Use of IO_ADDR_R and IO_ADDR_W legacy structure members will be dropped
> later, as soon as the driver is converted to use GPIO API for data I/O.

In the meantime, can you move the iomem pointer to the ams_delta
private struct so that this driver no longer uses the ->IO_ADDR_R/W
fields?

> 
> Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> ---
> Hi,
> 
> I've not tested the change on hardware yet as I'm not sure if:
> - handling of NCE limited to that inside ->select_chip() is
>   sufficient,

I think it is.

> - releasing ALE / CLE immediately after ams_delta_write_buf() is
>   correct.

Well, you should probably consider waiting for instr->ctx.delay_ns
nanoseconds after each instruction, but, if it was working before the
conversion to ->exec_op(), it should work just fine now.

Regards,

Boris
