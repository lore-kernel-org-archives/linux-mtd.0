Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF89C25B4E
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Jan 2023 17:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ChsYlhYdrnbk+skY+DCIfJ1bPzX7W52rsg29fFolQw8=; b=LBAKwLaWSEtl+F
	W7Sv6ciiVVCfkrJ4cSbEjxJSby2TRVMcT3iW8DGcUQfe/foG7m9wPm0DSOdax76uAKml0FzcIePlD
	F/ssnlqieFWO0C9Y80awMrCLMU949q5hlPnAQAy7Bpm7wl7GD8T7RXA2I+5rMcUJliwXPfVBkxjU9
	x5MA7bHCEAKkLTFoDerCLIbgZbBRquNFHUpH2bmwI8NWc4ZU1cRwnGgYbBuHNNrAgiArC94BIEZya
	DuWjjDSB6mOooSkaSsOK0WYXgB99PVzvXzHBwaIjdXBfWz2Q+EEH5Zwb88z3HP6K6yVi9f4WtJZ7y
	QJNdG3r4b1chWam1bRBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIvLQ-00BfBe-On; Fri, 20 Jan 2023 17:38:28 +0000
Received: from smtp-fw-9102.amazon.com ([207.171.184.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIvLM-00Bf5H-6B
	for linux-mtd@lists.infradead.org; Fri, 20 Jan 2023 17:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1674236305; x=1705772305;
  h=from:to:cc:subject:references:date:in-reply-to:
   message-id:mime-version;
  bh=VjofiAXhO5C80JdyAXswdYDTLZEOnLHRkk1uSsByVus=;
  b=mi8nSNWlfVMsfLQCOvMfDoFToPXp7liNHuw4tppjxwMowaMDRGt2oatb
   yATHnMAkD7pweFNwLv7BXS21Vk9W/JeiFuX4SoohHWtIjfl9STq8/Q8jS
   jOB7t6RpqmO3nuCzox1rqoxyjKFA5xvejFZodPvl5ii5L+pXycEaZc0w3
   I=;
X-IronPort-AV: E=Sophos;i="5.97,232,1669075200"; 
   d="scan'208";a="302491059"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-iad-1a-m6i4x-93c3b254.us-east-1.amazon.com) ([10.25.36.210])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 17:38:10 +0000
Received: from EX13MTAUEB002.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-iad-1a-m6i4x-93c3b254.us-east-1.amazon.com (Postfix) with ESMTPS id 473B7E5D3C;
	Fri, 20 Jan 2023 17:38:06 +0000 (UTC)
Received: from EX19D001UEB002.ant.amazon.com (10.252.135.17) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1497.45; Fri, 20 Jan 2023 17:38:06 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX19D001UEB002.ant.amazon.com (10.252.135.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.7;
 Fri, 20 Jan 2023 17:38:06 +0000
Received: from dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (10.15.11.255)
 by mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1497.45 via Frontend Transport; Fri, 20 Jan 2023 17:38:06 +0000
Received: by dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (Postfix, from userid 23027615)
	id 2B9BB20D16; Fri, 20 Jan 2023 18:38:05 +0100 (CET)
From: Pratyush Yadav <ptyadav@amazon.de>
To: Rob Herring <robh@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: mtd: partitions: Fix partition node name
 pattern
References: <20230120020454.3225796-1-robh@kernel.org>
Date: Fri, 20 Jan 2023 18:38:05 +0100
In-Reply-To: <20230120020454.3225796-1-robh@kernel.org> (Rob Herring's message
	of "Thu, 19 Jan 2023 20:04:53 -0600")
Message-ID: <mafs03585cdj6.fsf@amazon.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_093824_340305_25700944 
X-CRM114-Status: UNSURE (   8.30  )
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

On Thu, Jan 19 2023, Rob Herring wrote:

> The 'partition' node name pattern is missing start and end anchors, so
> anything is allowed before or after the regex pattern. There's no in tree
> users needing that, so add anchors to the pattern.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Pratyush Yadav <ptyadav@amazon.de>

-- 
Regards,
Pratyush Yadav



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
