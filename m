Received: from mail-pz0-f177.google.com ([209.85.222.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MlVhv-0000g6-F6
	for linux-mtd@lists.infradead.org; Wed, 09 Sep 2009 22:32:12 +0000
Received: by pzk7 with SMTP id 7so1568623pzk.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 09 Sep 2009 15:32:05 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 10 Sep 2009 07:32:05 +0900
Message-ID: <58484c0e0909091532r572c5c07o91b1fa3c18acb1de@mail.gmail.com>
Subject: INFTL_mount query
From: Mohanlal Jangir <mohanlaljangir@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: fabrice.bellard@netgem.com, gerg@snapgear.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 589        for (first_block = s->firstEUN; first_block <= s->lastEUN;
first_block++) {
 590                if (s->PUtable[first_block] != BLOCK_NOTEXPLORED)
 591                        continue;
 592
 593                do_format_chain = 0;
 594                first_logical_block = BLOCK_NIL;
 595                last_block = BLOCK_NIL;
 596                block = first_block;
 597
 598                for (chain_length = 0; ; chain_length++) {
 599
 600                        if ((chain_length == 0) &&
 601                            (s->PUtable[block] != BLOCK_NOTEXPLORED)) {
 602                                /* Nothing to do here, onto next block */
 603                                break;
 604                        }

Is code from line 600 to 604 not redundant ? Because for chain_length
== 0 case, block is always equal to first_block (line 596) and
s->PUtable[first_block] != BLCOK_NOTEXPLORED is already checked at
line 590.

What is difference between ANAC and NACs?
I somewhere read that ANAC means accumulated number along chain. What
does this signify?
Does inftl code handles ANAC overflow (it is unsigned char)?

During foldchain, INFTL_formatblock does not update inftl_unithead1
data for the block being formated. Does this not create problem if
system is rebooted and INFTL_mount reforms chains? (Because some
blocks still has stale virtualUnitNo stored in unithead).

Thanks
-Mohan
