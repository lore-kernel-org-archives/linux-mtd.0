Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CA549-0005Rg-JC
	for linux-mtd@lists.infradead.org; Wed, 22 Sep 2004 07:13:43 -0400
Message-ID: <41515E42.3020900@yandex.ru>
Date: Wed, 22 Sep 2004 15:13:06 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: tglx@linutronix.de
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: nand_command
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Thomas, as you sad, "only the ones with 512byte pagesize" NAND chips 
support operations like this:

1. NAND_CND_READ0, NAND_CMD_SEQIN, <addr>, <data>, NAND_CMD_PAGEPRG
2. NAND_CND_READ1, NAND_CMD_SEQIN, <addr>, <data>, NAND_CMD_PAGEPRG
3. NAND_CND_READOOB, NAND_CMD_SEQIN, <addr>, <data>, NAND_CMD_PAGEPRG

The first chain - programm page starting from the beginning
The second chain - programm page starting from the second half
The third chain - programm starting from OOB area.

Chips with 256-byte page support only one programm operation like this:
NAND_CMD_SEQIN, <addr>, <data>, NAND_CMD_PAGEPRG

Correct? (I can't find any 256-byte page Flash manual to check)

If I'm correct, I propose to change a little the default command 
function for "small page" devices (nand_base.c, nand_command). The code 
is like this:


static void nand_command (struct mtd_info *mtd, unsigned command, int 
column, int page_addr)
{
         register struct nand_chip *this = mtd->priv;

         /* Begin command latch cycle */
         this->hwcontrol(mtd, NAND_CTL_SETCLE);
         /*
          * Write out the command to the device.
          */
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

.............


It can be seen that for "small page" devices the NAND_CMD_READ0 command 
is also input before NAND_CMD_SEQIN. This is not big error, but if to be 
pedantic, this isn't needed.

I propose to change this code the following way:

static void nand_command (struct mtd_info *mtd, unsigned command, int 
column, int page_addr)
{
         register struct nand_chip *this = mtd->priv;

         /* Begin command latch cycle */
         this->hwcontrol(mtd, NAND_CTL_SETCLE);
         /*
          * Write out the command to the device.
          */
         if (mtd->oobblock > 256 && command == NAND_CMD_SEQIN) { /* 
<----- here */
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

.............


Comments?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
