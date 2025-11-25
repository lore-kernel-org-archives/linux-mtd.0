Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71711D0EE0D
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Nov 2025 17:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VdqxOy0GswL4ZyAdE7ewYWKzYPNBVh1Bpt6RXGHQhOU=; b=D2tolRkgvN+FTa
	MZ2QAy8bDIkuIGIqsGEpODsQy0/0egZVKaIk/RfmDTfH63hOWunrIt/xmeRAL1qOLQEtvp/WuXTKv
	ALZ0Vr30eQICvHD0yADSl6M1opeA198vkWCVb4OhYdq/kfSUvLzbTU3QFHCJUOU5chS1wGXk6Hfgh
	Wno4XGxDXtoYlGf0gBJniSHqGzE4OSXFOyJXiVVoCZ6kSl6rtYJMPHmlsS7wkV9VSX0ss4zOPvOdA
	YycjvAo/M5G4r/WlO7nglHgv551tfwMTe9kkgL7vDjr4OsAHh+AlV70fDaogtlxHaqMTPyl6YfjoZ
	m1jWCO0NSfHtIAAbz4Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNwtc-0000000Dfex-1eBN;
	Tue, 25 Nov 2025 17:32:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNwtb-0000000Dfer-1tIm
	for linux-mtd@lists.infradead.org;
	Tue, 25 Nov 2025 17:32:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 98B8860148;
	Tue, 25 Nov 2025 17:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C63C4CEF1;
	Tue, 25 Nov 2025 17:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764091926;
	bh=kP5/fJWMNMSXZ8ed7AiowQq4T3kL7YPPysXPzM8izAc=;
	h=From:To:Cc:Subject:Date:From;
	b=tWQdZwpv2T9LybEYr137pGMQYAxNBeR7X6/GaTeoduZ+wp3MjEui2c0YRn/v/cw1s
	 WCE7etHIqF7xzVkrxDO186udB2bYNOHf+DOI8BwSwYlm1+5D8PfuNMS2bp4PH/akVm
	 vWNQ8wzIZMxky1DlLTwiwlmLcCfhHOPcmt71RV9ILaMGy3mjKHfwwlV3MAlmyvnoo3
	 BpALf/X37sv/3hWrBAtSMtKQbkkF9ofLOG1yVQl7oAx639f91/I10u5qlK8L/TUfrR
	 +6ErejF14+svTg/LugLE6izbpxRjkrzSrKqw8kdXoLUAz1wluQZ++wk9Jf8v44LCzw
	 fpAogXg2hNrig==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	linux-mtd@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mailmap: update Pratyush Yadav's email address
Date: Tue, 25 Nov 2025 18:31:49 +0100
Message-ID: <20251125173151.29430-1-pratyush@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
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

I will stop having access to my Amazon email soon. Map it to my kernel
email.

Signed-off-by: Pratyush Yadav <pratyush@kernel.org>
---

Notes:
    Sending this patch to linux-mtd@ and linux-mm@ since those two are the
    lists I am most active on.
    
    I plan to take this patch through my SPI NOR tree [0]. Miquel, let me
    know if you have any concerns with that.
    
    [0] https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/log/?h=spi-nor/next

 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index d2edd256b19d6..cf42344098ffe 100644
--- a/.mailmap
+++ b/.mailmap
@@ -632,6 +632,7 @@ Peter Oruba <peter.oruba@amd.com>
 Peter Oruba <peter@oruba.de>
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev> <pierre-louis.bossart@linux.intel.com>
 Pratyush Anand <pratyush.anand@gmail.com> <pratyush.anand@st.com>
+Pratyush Yadav <pratyush@kernel.org> <ptyadav@amazon.de>
 Praveen BP <praveenbp@ti.com>
 Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com> <pradeepc@codeaurora.org>
 Prasad Sodagudi <quic_psodagud@quicinc.com> <psodagud@codeaurora.org>
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
