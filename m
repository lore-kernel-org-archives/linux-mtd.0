Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBF7C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 22:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:From:Message-ID:
	MIME-Version:Reply-To:To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=hCFQ3p7eQJlidX3ItuDo+tncU+MCeYNbX7NWer9jB2U=; b=wg5
	kGxawMVi5dyBh6Be1odbguEktUIAY0wqVV8298nDludoTeJUETWlvEKT0obYRsM0MxxtEDs3Qrhwq
	lktqq5DvbMeyVo5aSe9T4duPJMX/YNo/xMr8+LbE7Nlne7/hSaBLKFp0EPfQ2+/liSBe2HssKsCeF
	VCOaOQr4y9hxFzKfmI/qh4HpDgnMZ3/2MVHcpUSPuMl+Stqu8qJecXYxMUugBGdyWLJ788VOLgaqf
	nLQnfJCHnN9qgzpbEkPY9k9a/fVwhJNvspGItmqTRt4L+RJoU2dNOWivu0EWP63a3A7LbAiqMWaqN
	mbWCKPKyU0fB8FpDRJg7bw0vkq+0CKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCr1Q-00DgiY-7G; Wed, 26 Jan 2022 22:44:12 +0000
Received: from mout.gmx.com ([74.208.4.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCr1M-00DghU-MY
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 22:44:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com;
 s=dbd5af2cbaf7; t=1643237024;
 bh=wU+S7FjBDGYOFP4tzn+yIp52M0akeGKRlL3rsegLOCA=;
 h=X-UI-Sender-Class:From:Subject:Date;
 b=gLLE7hTuMht+jXOXgufitAjzaM3MNeTkDZ4Vd/t4vSc+JIOR4WYeSIxo0De42/cpK
 IlVdVDrGUYQu3Sge4ufC6XJnxnqJOwVYjfUPvvPxAHtODy7foJaeEjqO0GufWodS8T
 0SJ8N5nqW4cPhWjoTQ9m/r4kdC3vFNtklHz83dOI=
X-UI-Sender-Class: 214d933f-fd2f-45c7-a636-f5d79ae31a79
Received: from [70.187.180.83] ([70.187.180.83]) by web-mail.mail.com
 (3c-app-mailcom-lxa02.server.lan [10.76.45.3]) (via HTTP); Wed, 26 Jan 2022
 23:43:44 +0100
MIME-Version: 1.0
Message-ID: <trinity-478e0c09-9134-40e8-8f8c-31c371225eda-1643237024774@3c-app-mailcom-lxa02>
From: david regan <dregan@mail.com>
Subject: [PATCH v2] mtd: rawnand: brcmnand: Fixed incorrect sub-page ECC status
Date: Wed, 26 Jan 2022 23:43:44 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:1c0PNrBtmjr9eU+az5SGDr4j/r/J5B59MGAD6JaxKYJbmNY/SkZuJo42VtwVPjfSr/IPi
 YuSeAVHgWk4YcZjW9NYtnn8JNhKY7NSQHcmLEy3DW5LXj9eeILuA+hvpT/7kFt+g7lB18gkEpBge
 yMOXZ64wat/eRZjiMbz56Cirxdwp4Ky2tAXUlCEV4IwmxloPW/9WbnJl0IUr4irSXfO/f6mL22uh
 BxZvGXIFLNQCWIXdGIzz3qZ+IqhC4fICO+hYPGR0HMIsyPEjMAuTnVhT1T9fMJaOg5zsCB9/Qfcw
 JA=
X-UI-Out-Filterresults: notjunk:1;V03:K0:cuW/21ipZws=:RSQSzvBlcyLSZpl7ChUDKW
 cMpDS5VEr9E5RaYBfo9QrRioG4sw1wpeQjNdIqaPE/nToHvS7uY0YJLAEYiiN9Tiq+3lmbHZ5
 DAFfrkQswbCDxb+7+7SAhgEFR47bO8XKX1TV/dDWIMc+yF151i8ut5poVRgOvn+rSpMwEsmaw
 EzaIXNbRKpwv+ii2WW+6NunTLRGEPqjTsIrnZaNJ328bXqTPwfLdTJIbv/uea9W1B29fJHxEF
 rf4vYHcJMWtQBSj1jaSu9PcZ7Esxoyo5HAGFsbwOCB7d+gnoypzBBnprnbgRX8nZA5tes4td+
 roJ8Jy2RGOyyjCMAA5l2ZtPVndGv7XKC+5h8n6+KFMepNqC6FV9QULps5NaZf3DQuASv1K4UT
 d2im3bOX0f8Z+I+Te41tXAfW4vsvak1LL3MnX+zrQiDQomkUVlk3da/f2qcD9uUN7X4JhUfkg
 orjbjWjbbuG8UU+QBX/a0IOsAWIB6WvY5OTAZAkq3UI1kmHTzyQzUg5QNEPvVVMjvW/G3qEuk
 MWtEckKz+1x4Nb3XVUpcs8K7raEdDUzTMUOotCggH5pMIcI56YQwaxk8IqwIN2LERNy0+H+Os
 f5JhOmYdUjtMhRMlkCcsF3Xx+dk4iJ6x7ulx/DGGLRwkdd6JSl89HUoviVvnjuS7F3Nj+Tpct
 iUahHIxoZ4W32EYW1W+TQKqK/ek/kRkA1jaUFFnprtDbgzeDB9RrQfqFyg65378Ch+SaiyDze
 uRuZbtJWovfNdIJ7p/8FgRr+KluvpYloWLD5640ADqXn73m5HjwBL4OVzXIdl6mPbKRPWZWoW
 se8o8hG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_144408_889888_1A270D68 
X-CRM114-Status: GOOD (  12.37  )
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

The brcmnand driver contains a bug in which if a page (example 2k byte)
is read from the parallel/ONFI NAND and within that page a subpage (512
byte) has correctable errors which is followed by a subpage with
uncorrectable errors, the page read will return the wrong status of
correctable (as opposed to the actual status of uncorrectable.)

The bug is in function brcmnand_read_by_pio where there is a check for
uncorrectable bits which will be preempted if a previous status for
correctable bits is detected.

The fix is to stop checking for bad bits only if we already have a bad
bits status.

Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
Signed-off-by: david regan <dregan@mail.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index c412f79..703ff00 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2135,7 +2135,7 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 					mtd->oobsize / trans,
 					host->hwcfg.sector_size_1k);

-		if (!ret) {
+		if (ret != -EBADMSG) {
 			*err_addr = brcmnand_get_uncorrecc_addr(ctrl);

 			if (*err_addr)
--
1.8.3.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
