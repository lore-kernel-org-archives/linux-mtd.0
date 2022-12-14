Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13428C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Dec 2022 09:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oQIL7qvfaCQBdffyHndQTsfmmtFf/4Mj43ayOGmFl0A=; b=Eo7YHbiNKRhH6D
	xcg13FnQ1muSszbW+QxhvKbyTltpThE6LH4jGcjXIjlNqA7afBZfb8V5RJeEbtmbwbq5cO2TzEbmM
	/047ibZuRLwVwX7mkKcGxBPAbtt1sOlrIMK4+IpY5bHFDW9CLlU52pJ5MzV3GV3h++HTMYIWsTiTT
	jQm6j47AN2t8i7Aq4XIXugfGUPsSxKXFIZWm1Mr6etD8JHtkQn8kbyZkDONIlfZOVEdifFggtZxsE
	6oM0TLnCoP/blYbVuq/BtUAdW8kYiyT+V5TT/zQ8AI31KuqNVv4YM3tVYHylV4p9nw2hurKC0Mi9F
	XM3+7bNioWMeXtzhg/uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Nmb-00EyJx-4d; Wed, 14 Dec 2022 09:10:33 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5NmX-00EyGi-0V
	for linux-mtd@lists.infradead.org; Wed, 14 Dec 2022 09:10:30 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id 447D785501; Wed, 14 Dec 2022 09:06:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1671008882; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=FFdspt1t9VqOZX5j55WvXEGBDZk8kyPalBbarKiLDYlGnPhPy2cyD/m/Fx/CEl0vu
	 PcIIMnNn91HAwIiOoY0LFrfXNAnRz9Eb+RMDa1YAVwWJ6GkF9KBnMsX9TXH6zSIZzT
	 M3HWlhyjs9CDuKG4HnVA2S4i5fQMhHoHl778PS3fEyHEYA9c1H7e8izJcjfsobNYXN
	 9Bx0Ts+ZMyFBe15cut8JuoKZSZ5qyQRTjoukQ6+8sTotMeoa8eEB7R/ZNQnOroyDUc
	 TkLWOTRMgfOF2lOc1mt47giUxNcqE7YZRzcHYntGJs+Pj15fQ0d8czFaeH7CtZvoSo
	 CjB0VvSxZXrDw==
Received: by mail.lokoho.com for <linux-mtd@lists.infradead.org>; Wed, 14 Dec 2022 09:05:06 GMT
Message-ID: <20221214074502-0.1.2t.9s3j.0.6yskhxg94d@lokoho.com>
Date: Wed, 14 Dec 2022 09:05:06 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_011029_199461_B36C6050 
X-CRM114-Status: UNSURE (   1.76  )
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
