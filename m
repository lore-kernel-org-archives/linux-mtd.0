Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eEM8h-0000td-Mu
 for linux-mtd@lists.infradead.org; Mon, 13 Nov 2017 21:19:34 +0000
Date: Mon, 13 Nov 2017 22:19:07 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Lukasz Majewski <lukma@denx.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: Re: [NAND] Question regarding -EIO error
Message-ID: <20171113221907.3f20c931@bbrezillon>
In-Reply-To: <20171113212701.01de0c47@jawa>
References: <20171113212701.01de0c47@jawa>
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

+Miquel who is working a lot on NAND stuff lately and might have faced
the same kind of problems while working on ->exec_op().

Hi Lukasz,

On Mon, 13 Nov 2017 21:27:01 +0100
Lukasz Majewski <lukma@denx.de> wrote:

> Dear All,
> 
> I was investigating the -EIO issue for page write from 2.6.26 kernel up
> till 4.14-rc7.
> 
> A foreword:
> -----------
> 
> Before the commit (v4.4):
> mtd: nand: increase ready wait timeout and report timeouts [1]
> b70af9bef49bd9a5f4e7a2327d9074e29653e665
> 
> The timeout for nand memory write (nand_page_write()) was ignored (as
> mentioned in [1]).
> The nand_write_page() (@nand_base.c) only checks for NAND_STATUS_FAIL
> (and returns -EIO).
> 
> In the old days it also used CONFIG_MTD_NAND_VERIFY_WRITE to check if
> correct data is written (if not -EIO was returned immediately).
> This was removed with [2]:
> "mtd: kill MTD_NAND_VERIFY_WRITE"
> 657f28f8811c92724db10d18bbbec70d540147d6
> 
> The commit:
> "mtd: nand_wait: warn if the nand is busy on exit"
> f251b8dfdd0721255ea11751cdc282834e43b74e
> 
> added WARN_ON() on timeout.
> 
> Setup:
> -----
> 
> I've run mtd_*.ko tests on several kernels and two memories.
> 
> With mtd_torture tests (and timeout set to 20ms):
> modprobe mtd_torturetest dev=${device} check=1 cycles_count=100 gran=10
> 
> forces both memories to timeout (at random execution place) with -EIO
> error returned.
> 
> Please correct me if I'm wrong:
> -------------------------------
> 
> With the new kernel (v4.14-rc7) we rely on:
> 
> 1. Page write timeout increased from 20ms -> 400 ms (as in [1])
> 
> 2. The WARN_ON() is displayed when we leave nand_wait() with ongoing
> NAND controller operation.
> 
> 3. As written in [2] the correctness of written data is check in upper
> layers (fs) -> when memory return no fails, but internal controller
> still writes data.
> 

Unless I miss something, I think you're correct.

> 
> Problem:
> --------
> 
> Normally to exit nand_wait loop I do read RnB GPIO pin
> (chip->dev_ready). 
> 
> When we got a timeout passed status from one memory is 0x81.
> Second one returns no errors (0x80) - but the write data check fails.
> According to spec bits 5 and 6 (of status register) are 0 -> Internal
> data operation Busy and overall Busy.

Yep, the NAND is not ready and all other bits in the STATUS reg can't
be trusted (which might explain why bit0 changes from 1 to 0 between
the 2 status read operations).

Quoting the ONFI spec:

"
RDY:
If set to one, then the LUN or plane address is ready for another
command and all other bits in the status value are valid. If cleared to
zero, then the last command issued is not yet complete and SR bits 5:0
are invalid and shall be ignored by the host.
"


> 
> The problem here is that we exit nand_wait with NAND memory controller
> still being busy. Timeout change[1] from 20ms -> 400ms just 'masked'
> this issue.

Theoretically yes, but in practice 400ms should be more than enough to
complete a PROGRAM operation (actually is should even be enough to
complete an ERASE operation).

Did you experience any failures with the timeout set 400ms?

> 
> 
> Question:
> ---------
> 
> Shall not we wait more (@nand_wait) for internal operations to be
> finished?

Well, we need a boundary, we definitely don't want to wait
indefinitely, especially since the bug can be caused by a bad
controller. This being said, if the PROGRAM operation timeouts, we
should issue a RESET operation to hopefully end up in a well-known
state.

> 
> 
> To reproduce:
> -------------
> 
> Change back the timeout value from 400ms to 20m and run mtd_*.ko tests.

The problem you report was possible with a 20ms (especially for modern
NANDs with big pages) but becomes unlikely with a 400ms timeout,
simply because, even if the PROGRAM operation fails, it shouldn't take
more than 100ms for the NAND chip to report it (put the R/B back to
ready state and set the FAIL bit to 1 in the STATUS reg).

Just to be sure I understood correctly, is it something you managed to
reproduce with a 400ms timeout or are you worried that it could happen
because you've experienced it with an older kernel which had a 20ms
timeout.

Note that I'm not against making the code more robust, I'm just trying
to figure how urgent this is because we're in the middle of a huge
rework (the ->exec_op() thing I was mentioning at the beginning of
this reply) that could possibly help us with this kind of problems.

Regards,

Boris
