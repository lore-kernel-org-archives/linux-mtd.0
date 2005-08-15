Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4cp2-0007b4-O7
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 07:08:08 -0400
Message-ID: <43007773.2070602@yandex.ru>
Date: Mon, 15 Aug 2005 15:07:31 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <42E5ECE5.4010901@inf.u-szeged.hu>	<20050726093215.GD15903@wohnheim.fh-wedel.de>	<20050726100330.GF15903@wohnheim.fh-wedel.de>	<42EDF04C.1010108@inf.u-szeged.hu>	<20050801095645.GA32464@wohnheim.fh-wedel.de>	<42EDF470.4060208@inf.u-szeged.hu>	<20050801104343.GB32464@wohnheim.fh-wedel.de>	<42EE2B78.70500@inf.u-szeged.hu>	<20050801141841.GD32464@wohnheim.fh-wedel.de>	<42FB68AE.6070805@inf.u-szeged.hu>
	<20050815094816.GA27229@wohnheim.fh-wedel.de>
In-Reply-To: <20050815094816.GA27229@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
 block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ok, to keep you busy with some technical stuff also, here is a remark.

 >+		if (je32_to_cpu(sm->magic) == JFFS2_SUM_MAGIC ) {
 >+
 >+			if(je32_to_cpu(sm->erase_size) == c->sector_size) {
 >+				err = 
 >jffs2_sum_scan_sumnode(c,jeb,je32_to_cpu(sm->offset),&pseudo_random);
 >+
 >+				if (err) {
 >+					kfree(sm);
 >+					return err;
 >+				}
 >+			}
 >+			printk(KERN_WARNING "FS erase_block_size != JFFS2 erase_block_size 
=> skipping summary information\n");
 >+		}

if(je32_to_cpu(sm->erase_size) == c->sector_size) { ...

AFAIU, you're protecting against the situation when the size of the 
JFFS2 virtual eraseblock is changed.

But why is the eraseblock size may change? If it becomes less, this is a 
problem since some nodes that cross the boundary will be ignored. If the 
size of the JFFS2 virtual eraseblock becomes larger, it is also a 
problem - due to present bad blocks, some eraseblocks with valid data 
will be ignored (remember, if there is a bad eraseblock in the JFFS2 
virtual eraseblock, the whole virtual eraseblock is regarded as bad).

Thus, please, don't solve this problem this way. You're trying to solve 
it privately for your summaries, while you have to solve it for *JFFS2 
in general* (if it exists at all). I suppose it exists in your case 
since you add one more field to struct eraseblock...

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
