Return-Path: <SRS0=bXaR=LX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED91C11F67
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jun 2021 15:11:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE93861DC4
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jun 2021 15:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE93861DC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ami.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cPlB12+YeL/zM53yFw29tITGcxMs8sDO1Uv2K3z4Z3E=; b=yNbgb+DVIi0djF
	jfws33QwLJK9nnMP7c5aN/cSLebQ4OhAlcaem6m7YcfQa0xrsGGpRNTsMHxBPZ+mwCBTb7pZA9PwJ
	2XtZm+FYG2jlA99NJgx4KjOyQDsIXKVdHnWUexwoubO/KWgQSsC6ZWN0GlWrUKNwoDRYZt/qbVlWn
	dpTwVOR0n00znvQ3OFgAZG3ozN3NpGRxtBfZjDRsjJkTH7lm+ClLgwo3zXOtYoQP/fBxLHOmfNqxX
	bEH4nu10h/vIEjaJbpsGhq+WdLU7uhZBmM6H8eaiFCTzxKKUphFEuuyCbwJSgHvSU4rZnkz60JSS1
	dz9xObLgcH1gA650M1aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyFNP-00BPtr-B6; Tue, 29 Jun 2021 15:10:15 +0000
Received: from atlmailgw2.ami.com ([63.147.10.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyFNL-00BPr0-Cq
 for linux-mtd@lists.infradead.org; Tue, 29 Jun 2021 15:10:14 +0000
X-AuditID: ac10606f-903ff70000006d35-7a-60db37ccab66
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 D2.DB.27957.DC73BD06; Tue, 29 Jun 2021 11:10:05 -0400 (EDT)
Received: from ami-us-wk.us.megatrends.com (172.16.98.207) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.498.0; Tue, 29 Jun 2021 11:10:04 -0400
From: Hongwei Zhang <hongweiz@ami.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>
CC: Hongwei Zhang <hongweiz@ami.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/1] mtd: spi-nor: Add some M45PEx ids
Date: Tue, 29 Jun 2021 11:08:45 -0400
Message-ID: <20210629150846.21547-1-hongweiz@ami.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.16.98.207]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNLMWRmVeSWpSXmKPExsWyRiBhgu5Z89sJBt8nS1lc3jWHzWJ30zJ2
 i7enN7Bb3H3+g93i4xIHB1aPzUvqPe78WMrocfzGdiaPz5vkPA7sbWELYI3isklJzcksSy3S
 t0vgyph4bwVbwUvGildv97A1MG5i7GLk5JAQMJH4MPUYkM3FISSwi0mibV8vG5TDKLFy3wuw
 KjYBNYm9m+cwgdgiAiUSa9q/gNnMAukSr76eZwaxhQUsJaZdbmcBsVkEVCWWz/jOBmLzCphK
 bJn8lwVim7zE6g0HmCHighInZz5hgZgjIXHwxQuwuJCArMStQ4+ZIOoVJR78+s46gZFvFpKW
 WUhaFjAyrWIUSizJyU3MzEkvN9JLzM3US87P3cQICcD8HYwfP5ofYmTiYDzEKMHBrCTC+zbv
 VoIQb0piZVVqUX58UWlOavEhRmkOFiVx3lXuR+OFBNITS1KzU1MLUotgskwcnFINjOcmnxJb
 WnDu0YJtrlGdcz5F7tvgsn+jd0DHHrazwokP8903nt5f3un3Ityw8MiLe/t3ijH+Xa1dtc7c
 iOEUm9267VUdbe7f7XdPtDE4+vx/Iv9qpVsfczZHK923enb3YrFZdIlNm/v7v5V/s788Sle6
 fnT7+hzbhRseXbReL9V2snzFk0C/ldpKLMUZiYZazEXFiQAhBnBLLgIAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_081011_560785_78351111 
X-CRM114-Status: UNSURE (   7.32  )
X-CRM114-Notice: Please train this message.
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

Dear Reviewer,

Add some Micron M45PEx flash memeories into the IDs table.

Hongwei Zhang (1):
  mtd: spi-nor: Add some M45PEx ids

 drivers/mtd/spi-nor/micron-st.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
