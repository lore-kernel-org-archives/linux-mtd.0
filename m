Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520D9C76195
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 07:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oQIL7qvfaCQBdffyHndQTsfmmtFf/4Mj43ayOGmFl0A=; b=SEsXB2QY+lsyw6
	DG7xMeFfL1o7BXSrNPQDkAyNe4KH3WCnXL2pijAUHUPpUGaAcm9zbX6d1gbj4nMruFgA8LB8L1Wqq
	PtWsyZCxdoPYXlaifn9XzDmWyZlpheOqQjqRlmfDs9BBgfSKBHzgeBScrie5J0LSWQ4g3s7P5jk0m
	5rpGzLrN9DdTaXrov3ElvVLhARAYFg6abTZ52wr3bLdC49twwLx3rkmgcjaBCDQutRJpw3IAw8SPi
	RvkQ9vbPW+62vopAc+h5zOzu6qcDpD+fPKpmlVFC05Z7KGFCCmt0TVmwOLW+Jc3m6cgzqqRiPAsVl
	xLZcLyHrZyRZmj7T4x6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph3yv-00DVm1-2A;
	Tue, 28 Mar 2023 07:43:01 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph3ys-00DVkh-3C
	for linux-mtd@lists.infradead.org;
	Tue, 28 Mar 2023 07:43:00 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id 4787E84593; Tue, 28 Mar 2023 08:41:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1679989374; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=pcsE6QjBo38RL2EfWNYVb+9tBZrzk5x7yV4OS2hQJDkEg1kBVL1bVyeEs/2W0GP8e
	 nxMOx8Ie/vJ2xLuUGo6QMPGF97UPg9YWySoK7DqMipMyJRHU11IXZsqO0AdL0r1P2E
	 n3xvCW+FJqrNDn6jXe1bg92WP2R06A+v2stsaRTR4gvFvHmhCtsPu7CRiGq6GQ61Rx
	 62snRpK2QwENlvS0n8nUHQ8ehg4NQZu7K8/sgs4Jsks4XHmo8ELX8kzjlGqnlwQhdU
	 8t7A5Zj0avPIZhH7p232baDy5QGRKzVw6QZXM8bq1ZRQ6LNDSQmbM9OXAwI4nEL1FA
	 pX+RyA7rYbAzw==
Received: by mail.lokoho.com for <linux-mtd@lists.infradead.org>; Tue, 28 Mar 2023 07:40:50 GMT
Message-ID: <20230328074501-0.1.4x.1mzq5.0.3sxmt0mmgo@lokoho.com>
Date: Tue, 28 Mar 2023 07:40:50 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_004259_177342_3A486524 
X-CRM114-Status: UNSURE (   2.33  )
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
