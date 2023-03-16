Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9DBC6FD1F
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Mar 2023 08:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ipQaRZX6LOJPamvFPeVha0lXEHL3Lyiw1eCgfQlSnbY=; b=Vdpo2g/SlTiL8V
	Yu8gpXbNDf+MHl/VcuDWkhkzzs2c7i+Dt2ZDd5zyhoS7TMMXkPDXkqccj3tN0GJ43dnakXoxvJKE+
	VIyhsetMeLFE47W6mpxF3qCWcrcVgqwA/AfoDgEI/emncnxW5WeA2eNzXxp5Ev4o75LBCERbztjGK
	x5egJ6yJ7uIvQTLIUpEj962VhFNdHrP01mKkoClg/Kij4i8IE9IjOfpGE7icc7oBhEaK+e3j2yhco
	AQcGWDjQlI+0BzjbJ7qjpUZP3TE3qW2a2Byn26DQ/o6SYPem3sL/uBhvyd5m/ciXDp4xGsOeveiX5
	50efR0GXZfRSTz4LjzFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcjB0-00FhS7-2S;
	Thu, 16 Mar 2023 08:41:34 +0000
Received: from mail.paretdee.com ([141.95.17.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcjAx-00FhQm-0i
	for linux-mtd@lists.infradead.org;
	Thu, 16 Mar 2023 08:41:32 +0000
Received: by mail.paretdee.com (Postfix, from userid 1002)
	id E838AA2BDC; Thu, 16 Mar 2023 08:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=paretdee.com; s=mail;
	t=1678956076; bh=FLMIyM7qOCOVEMp1o/ltkgnLeuU0ZBlT9xWiZMBZ7Ag=;
	h=Date:From:To:Subject:From;
	b=qrkNdTcI2E0el/Ae+BGAdMkDFWoJvqwvhQx1tPxE1lkgzwsfNuVb/bPc8HxIU1Kya
	 hnCynu+UwxBkcNwbjbyhAtrlPP99B3pDpA4fe7iZT1TFd48MPbFaCvj7QBwpjlM8Si
	 PrNSEY79WLjfehranUtDAjfRUvP2ks63TcXvBx5tgGNSABy+ufgwsAMFRrfIn46hmR
	 /TapHp8mvrBhPFpJEEDJsZwZejgGOXEjSs0P/AOgQYKhH353LQVz+z/Rcd9WJsBeRM
	 2F945NYJkzHvIE/qwICZDoROUq744B/zU+MWch1H5x9tJkOGBrWtIrKUDBqGTvx8S/
	 ZCMkrBCs11QNQ==
Received: by mail.paretdee.com for <linux-mtd@lists.infradead.org>; Thu, 16 Mar 2023 08:40:33 GMT
Message-ID: <20230316074500-0.1.5h.cm95.0.hcr4w49dpb@paretdee.com>
Date: Thu, 16 Mar 2023 08:40:33 GMT
From: "Zbynek Spacek" <zbynek.spacek@paretdee.com>
To: <linux-mtd@lists.infradead.org>
Subject: Rubber Molded
X-Mailer: mail.paretdee.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_014131_427946_0AAF85E0 
X-CRM114-Status: UNSURE (   1.35  )
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

Good morning,

we can offer unbeatable conditions for the supply of various silicone compounds and rubbers, liquid silicone rubber (LSR).

In our assortment you will also find cross-linking agents, stabilizers, dyes and individual silicone mixtures that we will develop for your needs.

Do you want to know what we can offer you?


Best regards
Zbynek Spacek

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
