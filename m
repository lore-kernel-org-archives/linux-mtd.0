From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Pete MacKay'" <linux01@architechnical.net>,
	<linux-mtd@lists.infradead.org>
References: <60098.69.30.58.166.1203553894.squirrel@architechnical.net>
Subject: RE: Mark OneNAND bad block good again?
Date: Thu, 21 Feb 2008 09:51:04 +0900
Message-ID: <003001c87423$d99f9210$1fa9580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-reply-to: <60098.69.30.58.166.1203553894.squirrel@architechnical.net>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

As I know, there's no tool to mark some block bad or vice versa.

It uses only development time.
Yes, it's not normal way. You SHOULD do this your own risk.

If you know the initial bad blocks, runtime bad blocks, erase all with skipping BBT. Or
Erase wanted block only.

Modify onenand_erase().

#if 0
		/* Check if we have a bad block, we do not erase bad blocks */
                if (onenand_block_isbad_nolock(mtd, addr, 0)) {
                        printk (KERN_WARNING "onenand_erase: attempt to erase a bad block at addr 0x%08x\n", (unsigned int) addr);
                        instr->state = MTD_ERASE_FAILED;
                        goto erase_exit;
                }
#endif

And call onenand_erase() after onenand_probe() at your module.
e.g., If you want to erase n block
struct erase_info instr = {
	.addr = n << mtd->erasesize,
	.len = mtd->erasesize,
};
onenand_erase(mtd, &instr);

Thank you,
Kyungmin Park

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists.infradead.org] On
> Behalf Of Pete MacKay
> Sent: Thursday, February 21, 2008 9:32 AM
> To: linux-mtd@lists.infradead.org
> Subject: Mark OneNAND bad block good again?
> 
> Does anyone with OneNAND savvy (KP?) know if a block that's marked bad can
> be restored again somehow?  We've tried overwriting the OOB and erasing
> but the controller always sets the ERROR bit without changing the BB
> value.  We've got some boards with corrupted OneNANDs due to low-level
> programming errors overwriting the BB byte, but I maintained a list of
> factory-marked bad blocks for these units before they went out (having
> made this mistake previously myself ;).
> 
> I know we've got a mix of rev M, A, and B chips, and I swear I remember
> being able to do this on a prototype unit when the OneNAND first came out,
> but maybe I'm just senile.
> 
> Thanks!
> Pete
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
