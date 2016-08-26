Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bdDaj-0000q0-Ry
 for linux-mtd@lists.infradead.org; Fri, 26 Aug 2016 09:38:30 +0000
Date: Fri, 26 Aug 2016 11:38:04 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: Trivial (?) question about nand_command_[lp]()
Message-ID: <20160826113804.10857051@bbrezillon>
In-Reply-To: <alpine.DEB.2.02.1608221313050.6821@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1608221313050.6821@lnxricardw1.se.axis.com>
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

Hi Ricard,

Please Cc the NAND and MTD maintainers when sending NAND related
questions.

On Mon, 22 Aug 2016 13:19:17 +0200
Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:

> I'm having a close look at nand_base.c:nand_command(), and there's 
> something I can't get my head around: According to the code, when the 
> command to be sent is NAND_CMD_SEQIN (0x80), used for programming a page, 
> first a read command (READ0, READ1 or READOOB depending on the column 
> address) is sent to the flash, followed by the SEQIN proper. Are there 
> flashes which require a read command to be sent (with no 
> address or data bytes) immediately before Page Program?

No, it's probably a bug. Should be

	if (command == NAND_CMD_RNDOUT) {
		...
	} else {
		chip->cmd_ctrl(mtd, command, ctrl);
	}

instead of

	if (command == NAND_CMD_SEQIN) {
		...
	}
	chip->cmd_ctrl(mtd, command, ctrl);

Not sure we have a lot of people testing this code (it's only used
when interacting with really old NANDs).

> 
> A related issue is a difference versus nand_command_lp(). In the latter, 
> NAND_NCE is set for every command towards the flash, which makes sense, as 
> the chip enable should be active throughout the whole sequence. However, 
> in nand_command(), NAND_NCE is only set when neither NAND_ALE nor NAND_CLE 
> are set. Is this an older convention in the code that CE is implied for 
> small-page flashes when ALE or CLE is set, but not for the large-page 
> case?

No, again, it's probably a bug.

Feel free to send fixes. BTW, do you have a way to test the changes?

Thanks,

Boris
