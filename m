Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365BDC43219
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 03:29:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F18E32075E
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 03:29:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q8CpbWhw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F18E32075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/Y3RTwUbOplFG4SvGhQxXm/J6kzW2aCJzoY36KQfTQQ=; b=Q8CpbWhwzI5NxA
	ihs0Z5jmeRIf8qff406beEehW/VvkQlinnioaPLOzLv/MTvJr0qX+VRYwFtnBXaebs+tlM+29Htj/
	36fWJDPxhmVf4pu1TO7wIMiE8L71QS3fXcLA/dSAf8UPXwZMYQjPLYhYWDzgJ/e/5pUJYw0oEmU5s
	s+sRerHj564/SCZM0ZRcf8Rp2NxkEzdfWEZfZAct8+LBVE4ZNj+Wxp0GQMuwAUhlTlDPC+ZsUzEQb
	IwfdJU9gBO3bczJRkmsY2O5Xy9+JUqoBgIVM6gs2ZWwwWP0vCGJfnChxfScnXuwGDTVo0vYCkZAi5
	x6ADux0c5ndqnVOOHbJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKwyP-0005m2-Tp; Mon, 29 Apr 2019 03:28:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKwyM-0005ky-0u; Mon, 29 Apr 2019 03:28:55 +0000
X-UUID: 5adfd84b2409421b85c67e7e7b6dda07-20190428
X-UUID: 5adfd84b2409421b85c67e7e7b6dda07-20190428
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 663994682; Sun, 28 Apr 2019 19:28:46 -0800
Received: from mtkmbs03n2.mediatek.inc (172.21.101.182) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 28 Apr 2019 20:28:44 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs03n2.mediatek.inc (172.21.101.182) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 29 Apr 2019 11:28:36 +0800
Received: from mtkslt306.mediatek.inc (10.21.14.136) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 29 Apr 2019 11:28:36 +0800
From: <xiaolei.li@mediatek.com>
To: <david.oberhollenzer@sigma-star.at>
Subject: [PATCH] mtd-tests: nandbiterrs: Fix issue that just insert error at
 bit 7
Date: Mon, 29 Apr 2019 11:28:34 +0800
Message-ID: <20190429032834.7550-1-xiaolei.li@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9A82CE3685D45613FF70AD94047C4EFBDECF68D727A0E7098B1954AE24CC1DB42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190428_202854_064684_F31F6F4E 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: srv_heupstream@mediatek.com, richard@nod.at, bayi.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-mtd@lists.infradead.org,
 xiaolei.li@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Xiaolei Li <xiaolei.li@mediatek.com>

The function insert_biterror should be designed to insert error at
the first '1' bit starting at offset byte.

But now, only bit 7 of each byte is checked, because checking mask
is always 0x80.

So, do right shift for checking mask after each checking to check
the whole 8 bits of each bytes.

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 tests/mtd-tests/nandbiterrs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/mtd-tests/nandbiterrs.c b/tests/mtd-tests/nandbiterrs.c
index 24a6c03..f583c14 100644
--- a/tests/mtd-tests/nandbiterrs.c
+++ b/tests/mtd-tests/nandbiterrs.c
@@ -333,7 +333,7 @@ static int insert_biterror(void)
 	int bit, mask, byte;
 
 	for (byte = 0; byte < pagesize; ++byte) {
-		for (bit = 7, mask = 0x80; bit >= 0; bit--, mask>>=0) {
+		for (bit = 7, mask = 0x80; bit >= 0; bit--, mask >>= 1) {
 			if (wbuffer[byte] & mask) {
 				wbuffer[byte] &= ~mask;
 				printf("Inserted biterror @ %u/%u\n", byte, bit);
-- 
2.18.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
