Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1M0S-0008HX-Oy
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2014 20:15:09 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: b32955@freescale.com (Huang Shijie)
Subject: Re: [PATCH] mtd: gpmi: fix the bitflips for erased page
References: <1388784439-23004-1-git-send-email-eliedebrauwer@gmail.com>
 <1389251514-30153-1-git-send-email-b32955@freescale.com>
Date: Thu, 09 Jan 2014 15:08:08 -0500
In-Reply-To: <1389251514-30153-1-git-send-email-b32955@freescale.com> (Huang
 Shijie's message of "Thu, 9 Jan 2014 15:11:54 +0800")
Message-ID: <87ppo09avr.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On  9 Jan 2014, b32955 at freescale.com wrote:

> ---
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 44 ++++++++++++++++++++++++++++++++
> 1 files changed, 44 insertions(+), 0 deletions(-)

[snip]

> +	if (flip_bits < threshold) {

Isn't it "if (flip_bits <= threshold)"?

> +		dev_dbg(this->dev, "check for the erased page:%d, chunk:%d\n",
> +				page, chunk);
> +		flip_bits = 0;
> +		memset(buf, 0, geo->payload_size);
> +
> +		/* read out the page without ECC enabled, and check it again. */
> +		chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
> +		chip->read_buf(mtd, buf, geo->payload_size);
> +
> +		for (i = 0; i < geo->payload_size; i++)
> +			flip_bits += hweight8(~buf[i]);
> +
> +		if (flip_bits < threshold)

Perhaps the same?  At least 'strength' means the number of correctable
bit flips; or maybe you have multiple buffers?  It is just the boundary
of when an erase page is about to go bad, which might be hard to see
through testing?  I have the same issue with the Vybrid NFC and ECC, so
I maybe copying your code.

Thanks,
Bill Pringlemeir.
