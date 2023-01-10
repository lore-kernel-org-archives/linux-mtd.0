Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A8DC46467
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Jan 2023 08:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oQIL7qvfaCQBdffyHndQTsfmmtFf/4Mj43ayOGmFl0A=; b=tCUen3Oy+aACGz
	z+BV4TOdYNKDFo1Qsv9X6QvZZsximUBv+UTEtRFnZKGjPivq5nI+xlbWNgFFKcyCL/CZ19KcV3rwo
	ETRfEXF0FWGyvSkYbmh3+ZeP5t7v7m79mqaIggzd/wWr7hMxryBmhK0OrcZgoCXDk3wMoourH3ibY
	akXFJ7JagA3VeHzNTtJ7YSZGPVL4BXDSBea/sACKiHdKoglNlc2blqxX9bDmEKwR2s/euLYCcOEov
	BdffjluyHQOG7mEznaISn+HyU2Sc2PO1ZAbPSOjxcu1m/Qr0zrlo0XEZVP+K/ld1LGrrRA/ecrCjV
	w4gykGcTukjRNLLS9gZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFACE-005rGD-PX; Tue, 10 Jan 2023 08:41:26 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFACC-005rEw-Ji
	for linux-mtd@lists.infradead.org; Tue, 10 Jan 2023 08:41:25 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id 418F083BC4; Tue, 10 Jan 2023 08:40:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1673340081; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=m2k8O/0/yBhQPQF8Ep3fbhJgV2LxrOBhWRs5DJR9zyGCQhciL1ID7ehPvzOAeJyBA
	 f9NXuDWJQNGAbgg09NA9wQ64T7yfV5i51VJ7wjwQ+HP2rqsZh1LrBTdVafYq8dAbNA
	 QgPCuzvFoMolH/B21dyP/NUEmlO1zXhGaz+yLdYIcAIYZPQmN81HbrbbyzZEAV0JCz
	 J8CdruUJeqvpa+lcZTPKyV4shO0OZu9z7Mpma72Rrqj9bKEgEzfkyh1SqQUAWhyida
	 oV8zGIFCCaELQScBTSWVlG0ZN0hnDntpyFLyQ9Q1n15R9Yne5BtOj556aWY+LpVlv9
	 3JPj3stTtxyFQ==
Received: by mail.lokoho.com for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2023 08:40:32 GMT
Message-ID: <20230110074501-0.1.3b.lhyo.0.ip4vpgov5m@lokoho.com>
Date: Tue, 10 Jan 2023 08:40:32 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_004124_816412_AB7F7A8C 
X-CRM114-Status: UNSURE (   2.52  )
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
