Received: from local.elnec.sk ([212.5.193.80] helo=mail2.local.elnec.sk)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NaRXU-00076a-Tc
	for linux-mtd@lists.infradead.org; Thu, 28 Jan 2010 10:24:01 +0000
Received: from [127.0.0.1] (unknown [192.168.0.39])
	by mail2.local.elnec.sk (Postfix) with ESMTP id A97D413A5E7
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Jan 2010 11:24:02 +0100 (CET)
Message-ID: <4B6165A0.20803@local.elnec.sk>
Date: Thu, 28 Jan 2010 11:23:28 +0100
From: "Ing. Jozef Goril" <jgoril@local.elnec.sk>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: bad block table stored in nand flash
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

The file in concern: drivers/mtd/nand_bbt.c of 2.6.32.6 linux kernel release 
version.

I don't understand, how reserved blocks (those used for bad block table (BBT) 
storage) are marked in BBT in flash.

At file beginning, there is some note:

* The table uses 2 bits per block
* 11b:    block is good
* 00b:    block is factory marked bad
* 01b, 10b:    block is marked bad due to wear
*
* The memory bad block table uses the following scheme:
* 00b:        block is good
* 01b:        block is marked bad due to wear
* 10b:        block is reserved (to protect the bbt area)
* 11b:        block is factory marked bad

Later, in function write_bbt, there is a code that converts RAM-based BBT to 
flash-based one at lines 707-718.
For line
buf[offs + (i >> sft)] &= ~(msk[dat & 0x03] << sftcnt);

I cannot understand the case, if (dat&0x03) == 10b (means reserved block in 
RAM-based BBT).
In that case, msk[2] value should be used.
The value of msk[2] is set few lines above (line 649): msk[2] = ~rcode;
The value of rcode is set at time of declaration:
rcode = td->reserved_block_code;

Now, in case of reserved_block_code == 01b:
rcode = 0x01;
msk[2] = ~rcode = ~0x01 = FE;

Regarding to line
buf[offs + (i >> sft)] &= ~(msk[dat & 0x03] << sftcnt);

it should be shifted left by sftcnt bits (sftcnt can be [0,2,4,6]).
I.e. that the value in the parenthesis on the right side can be of
[0xFE,0xF8,0xE0,0x80]. After negation: [0x01,0x07,0x1F,0x7F].
These are values, that original byte in buffer can be ANDed with.

But anding any value with e.g. 0x01 will destroy (clear) all bits under mask 
0xFC. This way, all other blocks belonging to that BBT byte will be set invalid.


Am I missing something important or is there a bug?

I understand the reserved_block_code can be:
- zero : reserved blocks are not marked in flash-based BBT, the mechanism 
rewrites rcode from 0x00 to 0xFF, later msk[2] = 0x00 and all works fine.
- non zero : reserved blocks are marked in flash-based BBT. But the only 
available value is 01b (00b stands for invalid block, 11b for good block and 10b 
will come from RAM-based 01b due to a procedure mentioned above).

But I cannot find how does reserved_block_code of 01b work...

Can you, please, make me clear?

Thanks a lot.
Jozef Goril
