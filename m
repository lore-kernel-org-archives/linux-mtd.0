Return-Path: <SRS0=zMDb=SA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B819C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 02:14:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 098E2204FD
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 02:14:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lNgeELyS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="BVqEHbX7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 098E2204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BpRpIyHEzdLI2o7ci3MUi3VSTefzyrCHdUO7eI57/fY=; b=lNgeELySgI/6kC
	qZeCh0WVLUqTKBvGWdw33jir1TksJ70FUNo0ZcQlqAom39A3HGoYRAXfEFeBK5LPgAkQnFKHFZR7x
	04bhCMsTmZAI1CTC2i3myn74Yek85ir3hQpFKcqLygTbJTBmu6mT7mVFdczFIk0j0hoTkqs+QfmBz
	XTF63PNi27kF5NKv/reLB5/TV12uZPGIR0oR/RiAxQPFlSQM02wWx59VnMZAeo7KzPipWnCH9pu8T
	15k4hXDo9BycpchifqWXU5rssEoqMk9YBZ1tZBoj+I3wizTZ9t1W737JrKs1gMfaRfatf0cvK1Xrj
	L7vN3lQLLVwn4bzSgs7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9h1p-0005oW-KC; Fri, 29 Mar 2019 02:13:57 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9h1Z-0005MX-A8
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2019 02:13:46 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 0D027806CB;
 Fri, 29 Mar 2019 15:13:35 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1553825615;
 bh=7NBDjca8CqFcBIzIKTpm1tSjsqP/Let6MA2LwzfnQeE=;
 h=From:To:Cc:Subject:Date;
 b=BVqEHbX7T+G4H9rkif2z5q90e33vt6sRRDIzdillvHDLGmvVKNoznFPGF82Tvii8g
 Ul1EieSw1MTpyIZCs1qUO/Vp1vJsHSzCmP4UcEGw+DJq48wIFd7Ui/ZbYKDdkJv/yO
 tbONob6hBON/2MHIqLiwGo31z3TksweLNdlfVPh0M0fAHkhOCP8GxL+6sbuZfSO85l
 Kz1DGI0q6e6Shae+aP/+YSjayFNk8GgKA1pGzEj1HwbE2fYiATz9vD9Tv2bSMlu9LQ
 mgiFJKBk56/Ai+7dMDVpel0WivHw0KHeYlvUvXE3HMiZDoNxnTbFozpJFxOW2rKyuH
 OVLzdQo+EZwcQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5c9d7f4d0000>; Fri, 29 Mar 2019 15:13:33 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
 by smtp (Postfix) with ESMTP id E1C0A13EC56;
 Fri, 29 Mar 2019 15:13:34 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id C09C21E1124; Fri, 29 Mar 2019 15:13:34 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: bbrezillon@kernel.org, computersforpeace@gmail.com, dwmw2@infradead.org,
 marek.vasut@gmail.com, richard@nod.at, robh+dt@kernel.org,
 mark.rutland@arm.com
Subject: [PATCH v2 0/2] mtd: physmap: Using gpio-addrs
Date: Fri, 29 Mar 2019 15:13:20 +1300
Message-Id: <20190329021322.6833-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_191342_694054_B8756DE8 
X-CRM114-Status: UNSURE (   7.79  )
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
Cc: devicetree@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I have a system with ADDR24 of the flash chip connected to a gpio pin. This
series fixes a bug in physmap-core.c and adds an example for using gpio-addrs
to the dt-binding based on the system I'm using.

Chris Packham (2):
  mtd: maps: physmap: Store gpio_values correctly
  dt-binding: mtd: physmap: Add example using addr-gpios property

 .../devicetree/bindings/mtd/mtd-physmap.txt      | 16 ++++++++++++++++
 drivers/mtd/maps/physmap-core.c                  |  2 ++
 2 files changed, 18 insertions(+)

-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
