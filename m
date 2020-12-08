Return-Path: <SRS0=eGw4=FM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF7CC433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 20:23:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ED3C2388C
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 20:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4ED3C2388C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ami.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SJXkarYr2l7bj3B5JM5nfrlp2eXbK7UG1ne5WXFXDnc=; b=tpDVb1of/+t9Tv0gUdHgiN3VXk
	9aLTTPeyZxFnbivhJceq78Pdqj0ELXDdQPqLjFnuvOy2KAq6FECFUhqk6snhqeuOOvAEILM8DwJUC
	nsK+qkrcARR0oPNgp0e+L7SSOmkPPdEhD22MluVttS8d/lqBCj7awxrTiL8OwIQ25DmvUZC9E5Jy/
	8x63HNVw5czkvpmBDx7+ufUXC//n3NkMxZI5/162CiSkJ+f5WDwPCHfcSioX6P09Jkjwk4q6DnTAY
	qcEMNYHDeHMXSNDY//LIXedYRlaLCCb07DVBC+uiCj17KI22Q2j1kQK6kiz73TIY2Ztw96Rb3KeIA
	WvepsyfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmjVh-00030F-Mv; Tue, 08 Dec 2020 20:22:57 +0000
Received: from atlmailgw2.ami.com ([63.147.10.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmjVf-0002zn-P8
 for linux-mtd@lists.infradead.org; Tue, 08 Dec 2020 20:22:56 +0000
X-AuditID: ac10606f-247ff70000001934-18-5fcfe09d6e63
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 81.CE.06452.D90EFCF5; Tue,  8 Dec 2020 15:22:53 -0500 (EST)
Received: from ami-us-wk.us.megatrends.com (172.16.98.207) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Tue, 8 Dec 2020 15:22:49 -0500
From: Hongwei Zhang <hongweiz@ami.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH,Aspeed, v1 0/1] mtd: spi-nor-ids: add Micron MT25QL01G flash
Date: Tue, 8 Dec 2020 15:22:19 -0500
Message-ID: <20201208202220.30302-1-hongweiz@ami.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.16.98.207]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprELMWRmVeSWpSXmKPExsWyRiBhgu7cB+fjDZbv0rHYdZnD4vf5v8wW
 u5uWsVt8XOLgwOJxtX0Xu8fFj8eYPTYvqfe482MpYwBLFJdNSmpOZllqkb5dAlfGrSOTWQua
 mCqebelja2A8ytjFyMkhIWAicfD/SyCbi0NIYBeTxIpTK1kgnJ2MEvcaT4FVsQmoSezdPIcJ
 xBYR0Jd4336bDaSIWWAKo0TrqTVgRcICPhK/uneAFbEIqEic33OeFcTmFTCVmN86kwlinbzE
 6g0HmCHighInZz5hAbGZBSQkDr54ARYXEpCVuHXoMVS9osSDX99ZJzDyzULSMgtJywJGplWM
 QoklObmJmTnp5UZ6ibmZesn5uZsYIeGWv4Px40fzQ4xMHIyHGCU4mJVEeNWkzsYL8aYkVlal
 FuXHF5XmpBYfYpTmYFES513lfjReSCA9sSQ1OzW1ILUIJsvEwSnVwMh0Iv6GZ2CC5RRbF67d
 PIoO170qRa+lTrVOKlmYZXfwS966C56LchPqb0/4FBZzcG7e84t1D/OTdeVkAvq3xcle2Pft
 Z0Wm1qkGiZiNmi39IeEvgj5w3Ji91lRB6QuPeFuQ9tmV29dcb1I+p3pvieulWRMu5RWxRRsv
 eP0yorlc8rRFx36hy0osxRmJhlrMRcWJAE82og8lAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_152255_906064_D4A9431D 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, linux-mtd <linux-mtd@lists.infradead.org>,
 Hongwei Zhang <hongweiz@ami.com>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Reviewer,

Micron MT25QL01G flash is used on AST2600 board, this patch add it in
the table.

Hongwei Zhang (1):
  mtd: spi-nor: add Micron MT25QL01G flash

 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
