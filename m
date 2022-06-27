Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D0BC43334
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jun 2022 10:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IvvMM7IADvUhqSHsK8QMcdWYrRudKnjVuYQHALtl1vU=; b=Re9kf1zomZNkWa
	JPYIoeQ8j+oryXOn/9zb9jKY5UB13VUR1uZ027j3hZ0iXXlxqXr9kEHjEuuqWyksjCZGFKK3LXmeU
	tZl1KvE982Hci7LCtxHz7d+GM2n/fi6Fg4YFV90nVVlAWh1YRg0DN2mOqCIN4CjSpTKjx2caQ3A03
	bWbTlpIA4pQZxeqsF01mLbvci3zkVo5FZCKKxNbHwHl6ssojLYwyAWiuRGY0vUYp779rRZGTahuoq
	nH9/CVTKGQkMkNth1fYwpJhnoxAKLvfn3kSFWSwAewolz/iinhsY5Pl+/fJaHBFyFDrTSRACd6wTt
	7FEFeMpdEto/4jQVMk4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ll1-0001fR-Vl; Mon, 27 Jun 2022 10:14:16 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5lky-0001ck-Km
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2022 10:14:14 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25RAE1CH062963;
	Mon, 27 Jun 2022 05:14:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656324841;
	bh=9bMmTKVjcLPMKrJJxAuSuYuZPxEu3volikjsDyd5Roo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fsMYmNDTiPs/+9+ya+HH1/wAEhnPBxUkqbqeIzGwij5SNjCONvbqQcnvahiIRZUOL
	 cQn3MCPMXgMNh+6ACpv+P/POw5Zg9UDB3OTQrpZaKIJsmR1RmtFhVAeVtHnV5dW9i8
	 HrzVyfb/t+uZESzxOXW5vjAycVo2fQYb3zMQFPdU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25RAE1al113300
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jun 2022 05:14:01 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 27
 Jun 2022 05:14:00 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 27 Jun 2022 05:14:00 -0500
Received: from pratyush-4F-325.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25RADw0T055445;
	Mon, 27 Jun 2022 05:13:58 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
        Michael Walle
	<michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: spi-nor: move SECT_4K_PMC special handling
Date: Mon, 27 Jun 2022 15:43:57 +0530
Message-ID: <165632480084.4063881.11417937215807229649.b4-ty@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220418112650.2791459-1-michael@walle.cc>
References: <20220418112650.2791459-1-michael@walle.cc>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_031412_743665_A7BA31AA 
X-CRM114-Status: UNSURE (   8.10  )
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

On Mon, 18 Apr 2022 13:26:50 +0200, Michael Walle wrote:
> The SECT_4K_PMC flag will set a device specific opcode for the 4k sector
> erase. Instead of handling it in the core, we can move it to a
> late_init(). In that late init, loop over all erase types, look for the
> 4k size and replace the opcode.
> 
> 

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next, thanks!
[1/1] mtd: spi-nor: move SECT_4K_PMC special handling
      https://git.kernel.org/mtd/c/77d4ac6d38

--
Regards,
Pratyush Yadav
Texas Instruments Inc.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
