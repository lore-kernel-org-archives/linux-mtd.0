Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffu1Q-0001v6-9H
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 21:30:09 +0000
Date: Wed, 18 Jul 2018 23:29:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH 5/5] mtd: rawnand: qcom: reorganization by removing
 read/write helpers
Message-ID: <20180718232945.407e22de@xps13>
In-Reply-To: <1530863519-5564-6-git-send-email-absahu@codeaurora.org>
References: <1530863519-5564-1-git-send-email-absahu@codeaurora.org>
 <1530863519-5564-6-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Abhishek,

Abhishek Sahu <absahu@codeaurora.org> wrote on Fri,  6 Jul 2018
13:21:59 +0530:

> Driver does not send the commands to NAND device for page
> read/write operations in ->cmdfunc(). It just does some
> minor variable initialization and rest of the things
> are being done in actual ->read/write_oob[_raw].

Thank you for cleaning actively this driver. I think you are comfortable
enough now to switch to start the migration to ->exec_op().

I will take this patch as I think it shrinks a bit the driver (which is
inordinately huge) but I would like to get rid of any kind of hackish
->cmdfunc() implementation. Boris and I can help you doing that, you
can grep for drivers already converted and observe they structure
(marvell, fsmc, vf610).

>=20
> The generic helper function calls for invoking commands during
> page read/write are making this driver complicated. For QCOM NAND
> driver, ->cmdfunc() does minor part of initialization and rest of
> the initialization is performed by actual page read/write
> functions. Also, ->read/write_oob() does not calls helper
> function and all the initialization is being done in
> ->read/write_oob() itself. =20
>=20
> Since after 'commit 25f815f66a14 ("mtd: nand: force drivers to
> explicitly send READ/PROG commands")', sending of commands has
> been moved to driver for page read/write, so this patch does
> following changes to make code more readable:
>=20
> 1. Introduce qcom_nand_init_page_op() and qcom_nand_start_page_op()
>    helper functions which helps in removing code duplication in each
>    operation.
>=20
> 2. After issuing PROGRAM PAGE/BLOCK ERASE, QCOM NAND
>    controller waits for BUSY signal to be de asserted and
>    automatically issues the READ STATUS command. Currently, driver
>    is storing this status privately and returns the same when status
>    command comes from helper function after program/erase operation.
>    Now, for write operations, the status can be returned from main
>    function itself, so storing status can be removed for program
>    operations.
>=20
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---

Thanks,
Miqu=C3=A8l
