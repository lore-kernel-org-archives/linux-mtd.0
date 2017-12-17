Date: Sun, 17 Dec 2017 14:17:05 +0100
From: Willy Tarreau <w@1wt.eu>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: pxa3xx_nand times out in 4.14 with JFFS2
Message-ID: <20171217131705.GA30726@1wt.eu>
References: <20171217120503.GA3323@1wt.eu> <20171217133355.618e5f92@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171217133355.618e5f92@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris!

On Sun, Dec 17, 2017 at 01:33:55PM +0100, Boris Brezillon wrote:
> You should have a look at this thread [1], and in case you don't want
> to read everything,

I've read it entirely, it was very instructive!

> you can just test the solution proposed here [2].
> 
> [1]http://linux-mtd.infradead.narkive.com/Rd5UaRPO/bug-pxa3xx-wait-time-out-when-scanning-for-bb
> [2]http://patchwork.ozlabs.org/patch/847411/

Well done for such a quick reply! I can confirm that your proposed
patch below does fix it for me! Now I understand why only jffs2 was
triggering the issue if it only affects OOB, and I guess I would have
faced it as well with nanddump had I thought about testing it.

I'm queuing this one here to continue to progress on my machine, feel
free to add my tested-by if the patch gets merged, or to ping me to
test any other option you'd like to confirm!

Thanks!
Willy

---

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 321a90c..adb9fd8 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -950,6 +950,7 @@ static void prepare_start_command(struct pxa3xx_nand_info *info, int command)
 
 	switch (command) {
 	case NAND_CMD_READ0:
+	case NAND_CMD_READOOB:
 	case NAND_CMD_PAGEPROG:
 		info->use_ecc = 1;
 		break;
