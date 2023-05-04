Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBDCC7EE21
	for <linux-mtd@archiver.kernel.org>; Thu,  4 May 2023 07:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sh3efjAyxoKHcaLW6uvQmVgmt/p6M0bK1Qbz94o8CuU=; b=us+NYZFbpu+BWW
	nB+5mclLm0yDQXRp2Fr6ut6TjtCEQKOaTkm6auhhuiXvzMh5on7PRbIwD1+ZOm3pXsOveM/CExCSO
	+X4TdSZ1Ew7G1dy9lGDb58B2Uqu0CxXLx3ZAHzxO8Bvk8N3TRPin1hnKCiFgoWN/pmV9BoU5MPd1F
	CvNAafTBftkSlhZhnUrFeMaFFuO+VUyCBYvubo2xtIkantZlmlm85Xa7n8JzWEsPXa5m4LkWu1eNJ
	Z3ToFTXLAkb4tN1KZcINYs4W+4g1yGEKRx3kKvlGT2pIHZuWyS3si3yMEqW0mYPDKdjHOxcUUokNV
	FEh9O0P1tyDfIcGayyvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puTaB-006vtq-1u;
	Thu, 04 May 2023 07:40:55 +0000
Received: from mail.neston24.com ([37.187.225.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puTa6-006vqn-1v
	for linux-mtd@lists.infradead.org;
	Thu, 04 May 2023 07:40:53 +0000
Received: by mail.neston24.com (Postfix, from userid 1002)
	id 4BD1D22008; Thu,  4 May 2023 07:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neston24.com; s=mail;
	t=1683186049; bh=5T/I5ALH265FnsfRMA5qkcy2CLiS4J17pa3P6HzpuT0=;
	h=Date:From:To:Subject:From;
	b=CDJItnLi1Mgv+UA1f49GImIbbHLoUld/4iUiUsg2MvDBzXM4ifoUhh7mniwdBUYxm
	 sD5gYokVViOfz470DcHd633ECnon9M1ATBDKT0/sjB8bwwPzP8RGeq7/R0BQ9y6VTw
	 v3Lwv32hcFeA2Y6PlmtQXfng8w/DKsw/XTFGyJlQwUFuaPzhB4ujARoJu+gUCim/4L
	 JRDzpWMAv30qEa49kUZ1dZJRsW52RRpu9tkJ8o3vsaVpPR+enYlIPYhlVScWSzT9lH
	 2aJp58kY5dbYGbGFo/JbSBsmXpHevQpWI8EJLI87gGJ+qYDWRzgUOvE2Fph12FJIH7
	 USznYSiUm438w==
Received: by mail.neston24.com for <linux-mtd@lists.infradead.org>; Thu,  4 May 2023 07:40:13 GMT
Message-ID: <20230504064500-0.1.6m.d0ki.0.hfo0g1eh5w@neston24.com>
Date: Thu,  4 May 2023 07:40:13 GMT
From: =?UTF-8?Q?"Leo=C5=A1_Sl=C3=A1dek"?= <leos.sladek@neston24.com>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Fotovoltaick=C3=A9_rozvodnice?=
X-Mailer: mail.neston24.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_004050_783608_67583CEC 
X-CRM114-Status: UNSURE (   1.33  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RG9icsO9IGRlbiwKCm9icmFjw61tIHNlIG5hIFbDoXMgam3DqW5lbSBkbG91aG9sZXTDqWhvIHbD
vXJvYmNlIGZvdG92b2x0YWlja8O9Y2ggcm96dm9kbmljIHVyxI1lbsO9Y2ggcHJvCnNvdWtyb23D
qSBpIHByxa9teXNsb3bDqSBwb3XFvml0w60uCgpEb2TDoXbDoW1lIGZvdG92b2x0YWlja8OpIHJv
enZvZG5pY2UgbmEgemFrw6F6a3UgYSBqc21lIHNjaG9wbmkgcmVhbGl6b3ZhdCBpIHR5IG5lam7D
oXJvxI1uxJtqxaHDrQpwb8W+YWRhdmt5IGluc3RhbGHEjW7DrWNoIGZpcmVtLCB2ZWxrb29iY2hv
ZMWvIGEgZGlzdHJpYnV0b3LFry4KClZ5dcW+w612w6FtZSBuZWprdmFsaXRuxJtqxaHDrSBrb21w
b25lbnR5IGEgbWF0ZXJpw6FseSwgxI3DrW3FviBkb3NhaHVqZW1lIHZ5xaHFocOtIG9kb2xub3N0
LCBzdGFiaWxpdHUKcHJvdm96dSBhIG9jaHJhbnUgcHJvdGkgdm9kxJssIHZsa3UsIHByYWNodSBh
IG7DoXJhesWvbS4KClYgbmHFoWVtIHNvcnRpbWVudHUganNvdSB0YWvDqSBvbWV6b3ZhxI1lIHDF
mWVwxJt0w60gQUMvREMsIGt0ZXLDqSB6YWppxaHFpXVqw60gb2NocmFudQpmb3Rvdm9sdGFpY2vD
vWNoIG5hcMOhamVjw61jaCBpbnN0YWxhY8OtIHDFmWVkIG5lZ2F0aXZuw61taSBlZmVrdHkgcMWZ
ZXDEm3TDrSBhIGNocsOhbsOtIHphxZnDrXplbsOtIHDFmWVkCmVmZWt0eSBwxa9zb2JlbsOtIHDF
mWVwxJt0w60gYSBibGVza292w71jaCBwcm91ZMWvLgoKQ2hjZXRlIHNpIHZ5emtvdcWhZXQgbmHF
oWUgxZllxaFlbsOtPwoKClMgcG96ZHJhdmVtCkxlb8WhIFNsw6FkZWsKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
