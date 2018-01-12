Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eZx3g-0002WI-Ip
 for linux-mtd@lists.infradead.org; Fri, 12 Jan 2018 10:59:38 +0000
Date: Fri, 12 Jan 2018 11:59:25 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Stefan Agner <stefan@agner.ch>
Cc: miquel.raynal@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 richard@nod.at, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 1/2] mtd: nand: vf610_nfc: make use of ->exec_op()
Message-ID: <20180112115925.3d7dbde5@bbrezillon>
In-Reply-To: <20180111235037.10912-1-stefan@agner.ch>
References: <20180111235037.10912-1-stefan@agner.ch>
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

Hi Stefan,

On Fri, 12 Jan 2018 00:50:36 +0100
Stefan Agner <stefan@agner.ch> wrote:

> This reworks the driver to make use of ->exec_op() callback. The
> command sequencer of the VF610 NFC aligns well with the new ops
> interface.

That's great news!

> 
> Currently we handle reset and read id pattern separately. The
> read id pattern uses registers for the returned data, using a
> dedicated function helps to special case the data in op.
> 
> The parameter page handling is rather ad-hoc currently: The
> stack calls exec_op twice, once to read the paramter page and
> a second time to tranfer data. The code/controller can not
> handle this steps separately, hence just transfer data already
> in the first call and just memcpy from the buffer in the second
> call. This needs a small change in the nand_base.c file.

Hm, I think it's using change_column after the read_param_page command,
so it's not exactly a 'data xfer' only step. Can't your controller send
only a command or address cycle without any associated data xfers on
the bus?

Anyway, if you really have to do the READ_PARAM_PAGE in a single step,
you'll have to patch the core to pass a valid buffer and len != 0 when
calling nand_read_param_page_op().

> 
> The current state seems to pass MTD tests on a Colibri VF61.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
> Hi Boris, Hi Miquel,
> 
> Thanks for your work on the new NAND interface. The VF610 NFC
> definitly matches better the ->exec_op() interface.

And thanks for transitioning to this new interface.

> 
> This is still in early stage but seems to boot a Linux as rootfs
> successfully. Before working on further simplification I wanted
> to get some feedback on the general idea.

Sure.

> 
> If needed, the data sheet of the controller can be optained
> publicly (Vybrid Reference Manual, Chapter 10.3).

I'll have a look, thanks for the pointer.

> 
> Some questions from my side:
> - Parameter page: Why is exec_op called twice currently? This
>   seems to be problematic for this controller. Are there plans
>   to integrate the two calls in a single op sequence?

I don't know, but nothing is set in stone.

> - Row/Column addresses: The controller seems to separate those
>   two, hence the driver "guesses" which address bytes need to
>   go where.. Maybe it would be better to separate that on ops
>   level?

Miquel had a similar need for the new marvell NAND driver, so maybe we
can store this information at the nand_chip level:

	unsigned int row_cycles;
	unsigned int column_cycles;

I still want to keep the address data in an array of bytes, but thanks
to the [row,column]_cycles information you'll be able to easily convert
this array of bytes into row and column addresses.

> - Separation is often needed by command. One can make an educated
>   guess what kind of command is going to be passed by filtering
>   the appropriate ops. Maybe it would be good if the ops parser
>   can filter by command?

I'll have to check the datasheet you pointed out. We're not closed to
the idea of filtering things by particular opcodes, but most of the time
the controller is not hardcoded this way, and what they refer as READID
or READSTATUS is not about sending a NAND_READ_ID or a NAND_READ_STATUS
opcode, but following the sequence imposed by these operations (READID
is CMD+ADDR+DATA_IN, READSTATUS is CMD+DATA_IN). Which means, if you
have another operation which uses the same sequence but a different
opcode, the controller is able to handle it.

> 
> --
> Stefan
> 
> miquel.raynal@free-electrons.com
> 
>  drivers/mtd/nand/vf610_nfc.c | 543 +++++++++++++++++++++++++++----------------
>  1 file changed, 349 insertions(+), 194 deletions(-)

I'll have a look at the code once I have a better understanding of how
the controller actually work.

Once again, thanks a lot for working on this topic.

Regards,

Boris
