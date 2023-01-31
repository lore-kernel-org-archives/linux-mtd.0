Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CB1C38142
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Jan 2023 08:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oQIL7qvfaCQBdffyHndQTsfmmtFf/4Mj43ayOGmFl0A=; b=bkHKzC83v88h1i
	pi3sOPxlR2eTzkBJTb/44SaQrrzEOkl+wUGk1Wou9bAfaP2y1uQ43vzgeM4NQg416048zWC18zaR/
	ELSVYxui1abZobDWdXkiY5Q21DQvkYGXOQ1g6AY/UxiuIbOahEPi2Ij/qJrrabZgym7/pxQblfV6q
	KAjdxTxzQK7O6N4FPq07nQG5CtOCDixjY/FMnMeCAiEtOSK72XXg37CBK/Gh5qh65SzixuPCSYrZy
	EUPfj6Rg4BPVcheLdRAe+506MZpdY96tidXIN/lJERfliFoI6RLL60hDHi2JPc+0heo0aVxumSTH+
	r+A3NxoqfRWaR4eMRSig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMm7m-006lMN-Cv; Tue, 31 Jan 2023 08:36:18 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMm7j-006lLH-5h
	for linux-mtd@lists.infradead.org; Tue, 31 Jan 2023 08:36:16 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id C656483DC4; Tue, 31 Jan 2023 08:35:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1675154173; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=KRJJSxU92lApeyHA48D+SIpSkHTREcRg7ALgbgYb2k4xL3zAi0NF2CKTivRSEKUaQ
	 t+ZpVq1zv4boeFngXJp6VQSq/JrU9cItOGYgBUUODGXyM2xg5kXBLNlqybt+Zc6oFH
	 HXzYfqU0kLzKSMXbNB+gsa0Ak6dzemk60hrDgmjvKeRRHdDvwNJIBPEogKo62ifYf8
	 C3gsDgcvNNbK7FbDvrsOw9AZ7nqjnezFoP6PnxA0xZ5cNwTQq5vfPTxlY/FpxQzote
	 Hf0lHc8DifL4DoVBk/TztYyWYSjf8BfvT/0q6O/+FnQVXzLAWBwHOlYDk+HmZquL4A
	 /x/0S7PhdYwog==
Received: by mail.lokoho.com for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2023 08:35:43 GMT
Message-ID: <20230131074501-0.1.3q.w1ha.0.1g3cfq5cy5@lokoho.com>
Date: Tue, 31 Jan 2023 08:35:43 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_003615_371436_CD5C787A 
X-CRM114-Status: UNSURE (   2.02  )
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

RHppZcWEIGRvYnJ5LAoKemFwb3puYcWCZW0gc2nEmSB6IFBhxYRzdHdhIG9mZXJ0xIUgaSB6IHBy
enlqZW1ub8WbY2nEhSBwcnp5em5hasSZLCDFvGUgcHJ6eWNpxIVnYSB1d2FnxJkgaSB6YWNoxJlj
YSBkbyBkYWxzenljaCByb3ptw7N3LiAKClBvbXnFm2xhxYJlbSwgxbxlIG1vxbxlIG3Ds2fFgmJ5
bSBtaWXEhyBzd8OzaiB3a8WCYWQgdyBQYcWEc3R3YSByb3p3w7NqIGkgcG9tw7NjIGRvdHJ6ZcSH
IHogdMSFIG9mZXJ0xIUgZG8gd2nEmWtzemVnbyBncm9uYSBvZGJpb3Jjw7N3LiBQb3p5Y2pvbnVq
xJkgc3Ryb255IHd3dywgZHppxJlraSBjemVtdSBnZW5lcnVqxIUgxZt3aWV0bnkgcnVjaCB3IHNp
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKClBvemRy
YXdpYW0KQWRhbSBDaGFyYWNodXRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
