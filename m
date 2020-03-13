Return-Path: <SRS0=YEqx=46=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84CE1C2BB1D
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2020 05:21:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 587A1206E2
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2020 05:21:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vg7PQ+MT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Svd9gP/s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 587A1206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H8I3QKwTgKhAS0iAkvDGtigLi79esMAuE63lWwolL68=; b=Vg7PQ+MTxPU3UE
	YwABE4xi7734vnfBJkQ+/vn2aTCaj+c+4V0c+cFFidi3z+6mIUiY+MXJkPKzj1Cdk7opk3ojn7z9S
	7az6CF69Uq6lGyTzAPxBzxL6tzjjfcZDOFhgGW75iG7lO1bz4Sb/bSk5bsk3h+envRDLos6KBXPkZ
	v42vhObdUD9TEmqtgEP74jPYrVdLkTXsjFtyLU23z1Gl0FHB3b8Y0r6DT/c/5bcIv6B/ulck+ZNho
	BjDXOvqelznaxFaLoARVShQjW9Mu1UQ9Aobz44SAFvdtgXdkecNOr7wC0vwyIIIZACAUmJ6wuv/LX
	v40J61qR0bbAxbAYYvcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCcke-00013f-8w; Fri, 13 Mar 2020 05:20:52 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCcka-0000xv-B2
 for linux-mtd@lists.infradead.org; Fri, 13 Mar 2020 05:20:50 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02D5KeNO028004;
 Fri, 13 Mar 2020 00:20:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1584076840;
 bh=MhgbKjR4D6SEiAR1AWkA3+bInj0q1Gy2mgldTAXLnzQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Svd9gP/sBjAMMBQcq3qR189PwSq6HQBYAlpyW+iykY9h/FWlxKlvE0hgn658+5vbp
 UYbliNhWZIzWxL5PzdW5GWO9LCR8bX82ND231yQ0/S0pvvRbyYVfJIUs2U2Uvdizxo
 B9Sxpz3Vkt6fOUSGcaHe5lYjrp28Rs0+Euvn1/Uw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02D5Kex0093139
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 13 Mar 2020 00:20:40 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 00:20:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 00:20:40 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02D5KcwT039234;
 Fri, 13 Mar 2020 00:20:39 -0500
Subject: Re: [PATCH RFT 1/2] mtd: hyperbus: move direct mapping setup to AM654
 HBMC driver
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <fd1360ab-8872-f750-1314-77c6d432b413@cogentembedded.com>
 <114b97fe-c800-7ff7-ce6a-b38085f44adc@cogentembedded.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <3db31689-4553-b331-76f1-6117d9cdeecc@ti.com>
Date: Fri, 13 Mar 2020 10:51:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <114b97fe-c800-7ff7-ce6a-b38085f44adc@cogentembedded.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_222048_438512_5CB9F8DA 
X-CRM114-Status: UNSURE (   9.75  )
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
Cc: Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 30/01/20 2:07 am, Sergei Shtylyov wrote:
> The Hyperbus core expects that HyperFlash is always directly mapped for
> both read and write, but in reality this may not always be the case, e.g.
> Renesas RPC-IF has read only direct mapping. Move the code setting up the
> direct mapping from the Hyperbus core to thh TI AM554 HBMC driver.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 

Thanks!

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git cfi/next

Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
