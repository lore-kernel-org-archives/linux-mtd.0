Return-Path: <SRS0=mJc1=QD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 270C9C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 08:52:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED06661BE6
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 08:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED06661BE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bizjoindeal.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HdPN6goz6HrFVp6lVoEG+wAGhKjGqP1DjV6iwt7+IA8=; b=jDfnYkmIRN4ifj
	Q3zZUqklPtW34lStZ2RrwQRugw9C12WKKPgYKDxlpKNzKvWG/3Qs+MREAhLc1TvSnDVsFbt5uKOEX
	v1ieWyra/Ie/jfSwysP2nqPRL2QnODKsa/grB1RgUy5yZfn+2VbLHgxReXABDa/kRLcGHicO2Ih+R
	PQEVSRmQbJ6DAfgrkQINoJQ5pP50UU1g37nPomAF8JsHxE13Ocp4Tkoml5vPjyNGzSVyJc+44sXf8
	fPYeXP4lpTnjO7W7IR3eKcEqtiKhqQ9smMzoz7xdMQy0QFtmXH6VI3sxPhGJX1OE5/pYq8lGhO0Sy
	CTpo1uo/HuMcympisA5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmuC1-000oBm-7o; Tue, 16 Nov 2021 08:51:53 +0000
Received: from mail.bizjoindeal.pl ([80.211.97.164])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmuBw-000oAP-CB
 for linux-mtd@lists.infradead.org; Tue, 16 Nov 2021 08:51:49 +0000
Received: by mail.bizjoindeal.pl (Postfix, from userid 1001)
 id 047ECA21EA; Tue, 16 Nov 2021 08:51:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizjoindeal.pl;
 s=mail; t=1637052707;
 bh=JZuQ1fK7zFtz2oeUB7Xfid9vb7kUywdmDd2OluR8ywA=;
 h=Date:From:To:Subject:From;
 b=wJ15r8tuRcPWRL6OsueYX3O/wxwb/u8WnvxkZXxQcYf8pCpvpbhGsiE+Aabca5+mM
 O6ZC1tV3peatdjCn+2XLto+94NJdV5aGUUsGrT1UU3w4DvyrcLq2RS9InlX9KXGKwm
 ys21T3wKp4BjgCzIPXhtQUgyPgi81ccvZ7eXcWKzzbyWJE5jmTSn3DPkXQbubDJOuj
 Bz9+3hIOkXTNnRHlPq9aca3yfqm7S+svPI18t9yeonx2Xpjq1S5EzB3eZ1lF3dEniJ
 ot0TspvsOzNUIKUuga8tJdNyz1egcJXJweUK54x/VB60dXVRizX7tzKSNvYzye3/cV
 Ilrr6Bbwuntpw==
Received: by mail.bizjoindeal.pl for <linux-mtd@lists.infradead.org>;
 Tue, 16 Nov 2021 08:51:12 GMT
Message-ID: <20211116074500-0.1.60.f0x5.0.jp541ci5np@bizjoindeal.pl>
Date: Tue, 16 Nov 2021 08:51:12 GMT
From: "Dorian Kwiatkowski" <dorian.kwiatkowski@bizjoindeal.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Fotowoltaika dla firm
X-Mailer: mail.bizjoindeal.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_005148_576598_E447FFFF 
X-CRM114-Status: UNSURE (   1.99  )
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

RHppZcWEIGRvYnJ5LAoKa29udGFrdHVqxJkgc2nEmSB6IFBhxYRzdHdlbSwgcG9uaWV3YcW8IGRv
c3RyemVnYW0gbW/FvGxpd2/Fm8SHIHJlZHVrY2ppIG9wxYJhdCB6YSBwcsSFZC4KCk9kcG93aWVk
bmlvIGRvYnJhbmEgaW5zdGFsYWNqYSBmb3Rvd29sdGFpY3puYSB0byByb3p3acSFemFuaWUsIGt0
w7NyZSBwb3p3YWxhIHd5Z2VuZXJvd2HEhyBzcG9yZSBvc3pjesSZZG5vxZtjaSB3IHNrYWxpIHJv
a3UuCgpDaGNpYcWCYnltIHBvcm96bWF3aWHEhyB6IFBhxYRzdHdlbSBvIHRlZ28gdHlwdSByb3p3
acSFemFuaXUsIGEgdGFrxbxlIHByemVkc3Rhd2nEhyB3c3TEmXBuZSBrYWxrdWxhY2plLgoKQ3p5
IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaT8KClBvemRyYXdpYW0sCkRvcmlhbiBLd2lhdGtv
d3NraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
