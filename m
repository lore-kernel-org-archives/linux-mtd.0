Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bdJ9u-0001Ue-VZ
 for linux-mtd@lists.infradead.org; Fri, 26 Aug 2016 15:35:08 +0000
Date: Fri, 26 Aug 2016 17:34:35 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: Trivial (?) question about nand_command_[lp]()
In-Reply-To: <20160826113804.10857051@bbrezillon>
Message-ID: <alpine.DEB.2.02.1608261726540.6821@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1608221313050.6821@lnxricardw1.se.axis.com>
 <20160826113804.10857051@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 26 Aug 2016, Boris Brezillon wrote:

> Please Cc the NAND and MTD maintainers when sending NAND related
> questions.

Ok, will do.

> Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:
> 
> > I'm having a close look at nand_base.c:nand_command(), and there's 
> > something I can't get my head around: According to the code, when the 
> > command to be sent is NAND_CMD_SEQIN (0x80), used for programming a page, 
> > first a read command (READ0, READ1 or READOOB depending on the column 
> > address) is sent to the flash, followed by the SEQIN proper. Are there 
> > flashes which require a read command to be sent (with no 
> > address or data bytes) immediately before Page Program?
> 
> No, it's probably a bug. Should be
> 
> 	if (command == NAND_CMD_RNDOUT) {
> 		...
> 	} else {
> 		chip->cmd_ctrl(mtd, command, ctrl);
> 	}
> 
> instead of
> 
> 	if (command == NAND_CMD_SEQIN) {
> 		...
> 	}
> 	chip->cmd_ctrl(mtd, command, ctrl);
> 
> Not sure we have a lot of people testing this code (it's only used
> when interacting with really old NANDs).
> 
> > 
> > A related issue is a difference versus nand_command_lp(). In the latter, 
> > NAND_NCE is set for every command towards the flash, which makes sense, as 
> > the chip enable should be active throughout the whole sequence. However, 
> > in nand_command(), NAND_NCE is only set when neither NAND_ALE nor NAND_CLE 
> > are set. Is this an older convention in the code that CE is implied for 
> > small-page flashes when ALE or CLE is set, but not for the large-page 
> > case?
> 
> No, again, it's probably a bug.
> 
> Feel free to send fixes. BTW, do you have a way to test the changes?

I might be able to find some combination of hardware platform here which 
has a byte-banged NAND interface, on which we still support recent 
kernels, and a board which has a socket into which I can put a 256 Mbit 
flash or similar. I know I have flash chips lying around.

Right now I'm back on the Evatronix driver, so I'll see if I can have a 
look at the above when that's finished.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
