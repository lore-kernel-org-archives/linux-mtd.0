Received: from outmail1.freedom2surf.net ([194.106.33.237]
	helo=outmail.freedom2surf.net)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bys7R-0001Ix-7k
	for linux-mtd@lists.infradead.org; Sun, 22 Aug 2004 09:10:48 -0400
Received: from wirenth (i-195-137-81-187.freedom2surf.net [195.137.81.187])
	by outmail.freedom2surf.net (8.12.10/8.12.10) with SMTP id
	i7MDAgnF013802
	for <linux-mtd@lists.infradead.org>; Sun, 22 Aug 2004 14:10:42 +0100
Date: Sun, 22 Aug 2004 14:10:42 +0100
From: Ian Molton <spyro@f2s.com>
To: linux-mtd@lists.infradead.org
Message-Id: <20040822141042.3b3f0dfa.spyro@f2s.com>
In-Reply-To: <20040821002633.13ba0927.spyro@f2s.com>
References: <20040820132332.42c78dcc.spyro@f2s.com>
	<20040821002633.13ba0927.spyro@f2s.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: supporting stupid chips part III
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi.

so, we can read the chip... progress!

this isnt sitting very well with me though.

this controllers read accesses to the data register are odd in that it
*requires* word reads for some accesses but not others, which doesnt
mesh well with the generic code.

Currently in the generic code, we call this->read_byte in the functions:

nand_scan
nand_block_bad
nand_check_wp
nand_command
nand_command_lp
nand_wait

in nand_scan(), we use it to read the id and extended id attributes.
in nand_block_bad(), its used to read a single byte of the OOB
in nand_check_wp() its used to read the chips status.
in nand_wait() its used to read the chips status also.

I havent been able to test this, but based on what I know, the usage in
nand_block_bad(), nand_check_wp(), and nand_wait() will probably work on
this chip. nand_scan() does not as it attempts two consecutive reads
when the chip demands a word read.

Im also unclear as to what on earth nand_command() is up to when given a
SEQIN comand - heres the code...

        if (command == NAND_CMD_SEQIN) {
                int readcmd;

                if (column >= mtd->oobblock) {
                        /* OOB area */
                        column -= mtd->oobblock;
                        readcmd = NAND_CMD_READOOB;
                } else if (column < 256) {
                        /* First 256 bytes --> READ0 */
                        readcmd = NAND_CMD_READ0;
                } else {
                        column -= 256;
                        readcmd = NAND_CMD_READ1;
                }
                this->write_byte(mtd, readcmd);
        }
        this->write_byte(mtd, command);

SEQIN is 0x80, and according to both my spec and my disassemblies, you
dont send additional data with it. AFAICT, every time we send SEQIN we
send readcmd first. why?
