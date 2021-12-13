Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB01C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Dec 2021 13:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Cc:To:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WUaYPZO/MDoDKlyWrZW+QLLRmooZ9CTBPv1pnHFI3Y4=; b=Bnfxh7Dld91STs
	rzjji5EFuMcNtKLovYxU71r6ZrhKj9W7i5HNloo0wju9902/9TSeqIaoa2mQkgO+5IOIykRBSBlgt
	0IY5i/N/RGyyqDdtbLvkCEknwy6KukVbgpHYqkYJ7D1EHnKw0748qgrLSEpWpoLMS3NkLm+RaEY50
	V1MXDD8HL3NNYjEkp9bdaRvymPJ7s5dkszkva7P/zwoe6LvnyJ+J75j1oV2cnj5oLC6cl6rQyqrKI
	/jBAqp0fjcyZXlaoqpplSvhYpHrfJ+6oBFHy6saG5G1mZK5Nl4DN1RtbW7akObl754bICTZOHinfr
	JM3yBZUk1siXt+yAIl0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwlKP-009fSr-DK; Mon, 13 Dec 2021 13:25:17 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwlKK-009fRc-Qw
 for linux-mtd@lists.infradead.org; Mon, 13 Dec 2021 13:25:14 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1mwlJx-0008Sf-9N; Mon, 13 Dec 2021 14:24:49 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [BUG] mtd: cfi_cmdset_0002: write regression since v4.17-rc1
To: linux-mtd@lists.infradead.org, ikegami@allied-telesis.co.jp,
 Joakim.Tjernlund@infinera.com, miquel.raynal@bootlin.com, vigneshr@ti.com,
 richard@nod.at, ikegami.t@gmail.com
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Shaohui.Xie@nxp.com
Message-ID: <b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de>
Date: Mon, 13 Dec 2021 14:24:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_052512_893107_7220E70D 
X-CRM114-Status: GOOD (  19.77  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

I've been investigating a breakage on a PowerPC MPC8313: The SoC is connected
via the "Enhanced Local Bus Controller" to a 8-bit-parallel S29GL064N flash,
which is represented as a memory-mapped cfi-flash.

The regression began in v4.17-rc1 with

  dfeae1073583 ("mtd: cfi_cmdset_0002: Change write buffer to check correct value")

and causes all flash write accesses on the hardware to fail. Example output
after v5.1-rc2[1]:

  root@host:~# mount -t jffs2 /dev/mtdblock0 /mnt
  MTD do_write_buffer_wait(): software timeout, address:0x000c000b.
  jffs2: Write clean marker to block at 0x000c0000 failed: -5

This issue still persists with v5.16-rc. Reverting aforementioned patch fixes
it, but I am still looking for a change that keeps both Tokunori's and my
hardware happy.

What Tokunori's patch did is that it strengthened the success condition
for flash writes:

 - Prior to the patch, DQ polling was done until bits
   stopped toggling. This was taken as an indicator that the write succeeded
   and was reported up the stack. i.e. success condition is chip_ready()

 - After the patch, polling continues until the just written data is
   actually read back, i.e. success condition is chip_good()

This new condition never holds for me, when DQ stabilizes, it reads 0xFF,
never the just written data. The data is still written and can be read back
on subsequent reads, just not at that point of time in the poll loop.

We haven't had write issues for the years predating that patch. As the
regression has been mainline for a while, I am wondering what about my setup
that makes it pop up here, but not elsewhere?

I consulted the data sheet[2] and found Figure 27, which describes DQ polling
during embedded algorithms. DQ switches from status output to "True" (I assume
True == all bits set == 0xFF) until CS# is reasserted. 

I compared with another chip's datasheet, and it (Figure 8.4) doesn't describe
such an intermittent "True" state. In any case, the driver polls a few hundred
times, however, before giving up, so there should be enough CS# toggles.


Locally, I'll revert this patch for now. I think accepting 0xFF as a success
condition may be appropriate, but I don't yet have the rationale to back it up.

I am investigating this some more, probably with a logic trace, but I wanted
to report this in case someone has pointers and in case other people run into
the same issue.


Cheers,
Ahmad

[1] Prior to d9b8a67b3b95 ("mtd: cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer") 
    first included with v5.1-rc2, failing writes just hung indefinitely in kernel space.
    That's fixed, but the writes still fail.

[2]: 001-98525 Rev. *B, https://www.infineon.com/dgdl/Infineon-S29GL064N_S29GL032N_64_Mbit_32_Mbit_3_V_Page_Mode_MirrorBit_Flash-DataSheet-v03_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0ed556fd548b

[3]: https://www.mouser.com/datasheet/2/268/SST39VF1601C-SST39VF1602C-16-Mbit-x16-Multi-Purpos-709008.pdf
     Note that "true data" means valid data here, not all bits one.
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
