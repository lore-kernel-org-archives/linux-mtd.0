Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59F4C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 20:31:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D77420880
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 20:31:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qDtT1l+0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D77420880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ogura.tv
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F2918JWazCzcih7oSaubZL0SLH+P/oxkJFJmN9sUud0=; b=qDtT1l+0yF++Ob
	q7c4OmThnXagVFeCFIZPgJxgrK/t3g0SgS4WCsGhzic5OavtwyryNySc3vhNaSMYM0jVymkJ7CB8N
	HSgMM2yR569IAKGNij0nELB75Wf6UVovKCt57ozsWft0t8lJsCoZ2xepIRZSPOrpdK+W2JUGZEkEy
	xV/AFAz2H5l8/jhhG9Dgd8ccbApYD9YeCCzI/JXXVh97KaIBWVApuSvjYrmUCPxPNOiVkMB37wzt1
	ZV/iQwIeBXSFrHzvAawI/x97udYLhDOS6bJ9GNgu61fEN6smswivTNj0sKz3c9ogqkcg++t7KoRiw
	glbPyqAeZ1lTOD7KjMPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwYWL-0006U5-Jq; Wed, 20 Feb 2019 20:31:09 +0000
Received: from [211.8.19.6] (helo=ns19-6.japansecurity.net)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwYWI-0006Th-GW
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 20:31:08 +0000
Received: from ogura.tv (unknown [113.53.132.4])
 by ns19-6.japansecurity.net (Postfix) with ESMTPSA id F0EAB1633D5
 for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2019 05:20:30 +0900 (JST)
To: "linux mtd" <linux-mtd@lists.infradead.org>
From: nik_bin_nek_alwi <ogura@ogura.tv>
Subject: =?UTF-8?Q?=F0=9F=91=8B_Hallo!?=
Message-ID: <26e947cf-8e10-416f-b6fc-110e078a9d57@ogura.tv>
Date: Wed, 20 Feb 2019 12:22:14 -0800
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190220_123106_665236_F51C3F43 
X-CRM114-Status: UNSURE (   1.95  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

UGjDpG5vbWVuYWwhCkRhcyBBbmdlYm90IGlzdCBiZWdyZW56dCwgRGV0YWlscyBoaWVyIGh0dHBz
Oi8vbGVtdXNsaXRlYjE5ODAuYmxvZ3Nwb3QubGkvCgoKClZpZWwgR2zDvGNrIQoKCm5pa19iaW5f
bmVrX2Fsd2lAeWFob28uY29tIAoKCjIwLjAyLjIwMTkgMTI6MjI6MTQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
