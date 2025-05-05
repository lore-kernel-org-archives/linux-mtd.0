Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FF1C3ABB0
	for <linux-mtd@archiver.kernel.org>; Mon,  5 May 2025 08:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z5Y0orVJyc7qtL5VBvJNZSLzipjiUoZe2ZIeUvA40X8=; b=ujLkD+Yb6asiki
	rrQPqTdKbJBXn0KsnLDO+RO3guG2sPDrHVN6PdfFn+5HCIsszTEYN55BOjzcytlQz0D/PrQ+7MnKQ
	EWg0lE/psfbw8BUE9QTo+Ia3ZNAikLNnGwNFmqX07nVoYhsjJ/+RilmCIvIWFkwElNrbY3kNhhsmK
	uJ8+d17ymnrM9UA/9brim1DoHykH/QkbDDOaG414tQexFHhr2j0Ikv+/eM3wEQiyjiTPLfAW6DjMf
	gE+y4OSwYMOjppsrEVO+/eOyKBDN0wReFBonL4uRnzk98Yi5o1aRDOEp09wWBc8otNE6ceRvdJQhC
	7xA+D648OP6v8/UMaT1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBqnu-00000006jOw-31MJ;
	Mon, 05 May 2025 08:03:58 +0000
Received: from mail.bizotrix.pl ([217.61.97.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBqlE-00000006ipg-1X5l
	for linux-mtd@lists.infradead.org;
	Mon, 05 May 2025 08:01:13 +0000
Received: by mail.bizotrix.pl (Postfix, from userid 1002)
	id B396283E01; Mon,  5 May 2025 09:56:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizotrix.pl; s=mail;
	t=1746431794; bh=lA009qM0j4YRzFUfPgrXk13BGm3QuXjamWZpOmZ+a7M=;
	h=Date:From:To:Subject:From;
	b=jHhAW93StUuokkag7d+6MrErmoOwDCTFjfOsyXw9eDYyUzZAQfIGQSBvu9QjGSJ79
	 2A8Z/xD6Cci+48yPe0T0w+nUmx0lh3dTsyT26ohr1SS5z6O1S3VlTvcU4z8P53bAEF
	 aC3gdSgse3sAFjTPL/KrUjoH83re27N4UNRhjDJjeGoSpqaHUSY1j7hs9Wp0qLARur
	 6Dasro9Dw2I0boGzrlSFXdHdqDwfsiAniKu++DGB+Bj1dZVv38yD1FaiaJbKj7S3+U
	 9COkS8Yln3DqLK9B9UrDucZK7pTGZw14BwGXZ3O0rcndpMEKlQfpgrK6tGViOdnB29
	 yLNQdfgn8vl2g==
Received: by mail.bizotrix.pl for <linux-mtd@lists.infradead.org>; Mon,  5 May 2025 07:55:44 GMT
Message-ID: <20250505084500-0.1.9x.k2f6.0.1vhk0apb1s@bizotrix.pl>
Date: Mon,  5 May 2025 07:55:44 GMT
From: "Filip Gerlowski" <filip.gerlowski@bizotrix.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania_?=
X-Mailer: mail.bizotrix.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_010112_534738_4EE3EDCD 
X-CRM114-Status: UNSURE (   1.00  )
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

RHppZcWEIGRvYnJ5LAoKemFwb3puYcWCZW0gc2nEmSB6IFBhxYRzdHdhIHN0cm9uxIUgaSB6IHBy
enlqZW1ub8WbY2nEhSBwcnp5em5hasSZLCDFvGUgcHJ6eWNpxIVnYSB1d2FnxJkgaSB6YWNoxJlj
YSBkbyBkYWxzenljaCByb3ptw7N3LiAKClBvbXnFm2xhxYJlbSwgxbxlIG1vxbxlIG3Ds2fFgmJ5
bSBtaWXEhyBzd8OzaiB3a8WCYWQgdyBQYcWEc3R3YSByb3p3w7NqIGkgcG9tw7NjIGRvdHJ6ZcSH
IHogdMSFIG9mZXJ0xIUgZG8gd2nEmWtzemVnbyBncm9uYSBvZGJpb3Jjw7N3LiBQb3p5Y2pvbnVq
xJkgc3Ryb255IHd3dywgZHppxJlraSBjemVtdSBnZW5lcnVqxIUgxZt3aWV0bnkgcnVjaCB3IHNp
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKClBvemRy
YXdpYW0KRmlsaXAgR2VybG93c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
