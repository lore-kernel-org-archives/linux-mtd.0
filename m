Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A7Uxl-0006j5-90
	for <linux-mtd@lists.infradead.org>; Thu, 09 Oct 2003 08:11:53 +0100
From: David Woodhouse <dwmw2@redhat.com>
To: jffs-dev@axis.com, linux-mtd@lists.infradead.org, etux@embeddedtux.org
Message-Id: <1065683429.30987.223.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 09 Oct 2003 08:10:29 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: [ANNOUNCE] JFFS2 support for NAND flash..
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm happy to announce that the JFFS2 support for NAND flash has finally
reached a state in which it can be considered sane to use it in
production.

Thanks to generous sponsorship from Texas Instruments, the final
difficult parts of the NAND flash support have now been implemented.

Those were, for those who weren't paying attention, the details of
flushing the write-behind buffer appropriately upon fsync(), sync() and
other stimuli, and the code to deal with _failure_ to write the
write-behind buffer -- recovering its contents and writing them out
elsewhere on the flash to avoid data loss.

Other bugs were also found and fixed in the process of testing, and the
CVS tree also now contains changes to the garbage-collector which affect
the way it merges data nodes, which should significantly improve its
progress. These should be of benefit even on NOR flash, and may well
allow us to reduce the free-block thresholds which people keep
complaining about.

While I'm fairly confident of the behaviour and it's been stress testing
both with and without simulated errors on a DiskOnChip on my desk for
the best part of a week now, it remains relatively new code and should
therefore be treated with respect. You are advised to undertake your own
testing under your own particular usage patterns.

In addition to Texas Instruments, who kindly paid Red Hat to lock me in
a room for a few weeks with the JFFS2 code, some NAND flash and a vat of
coffee, I should also mention the efforts of Thomas Gleixner, who has
done a lot of work on JFFS2/NAND too, and also on the NAND hardware
drivers themselves. Thanks, Thomas.

-- 
dwmw2
