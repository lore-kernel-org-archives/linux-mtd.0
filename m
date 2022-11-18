Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C83C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Nov 2022 08:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D833JDIT8aZK2ZE455Oaz4HMPST/bW2jGdccXi7vdQ0=; b=l/GpXxNFrfhbfgqVXuDszQeka0
	wnigAgIgxzgDrOhXmz7bPUQnLTOUEO5CyobQeWAxW0OoWSFQ8f6T8NlqnFTjDzJ0viBLVtVb2+v6h
	SkKT1DtWN4l7oWYxALCqTFrLu6uF0wZ5svGCiFIkREQTXBDTmYwwzFot7JzBvP58KE6JGf3lAHoH9
	CpMvnxP0kvr/jLKNkm/PF6rlbQLgTv/YcUunxsxKkKbN7YpsBe8Vi8mnjRD7kMfqC/B6rvfyWC3XA
	jA9F8KdTNfcJ8G52OupJfDc2S2UtSWVEL0Y7nk36j1vjsGL16zMeyQDo6kCbRX08aNWuzufcDSX48
	0Qz72fwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovxD6-002uXE-M6; Fri, 18 Nov 2022 08:58:56 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovxD4-002uWK-7W
	for linux-mtd@lists.infradead.org; Fri, 18 Nov 2022 08:58:55 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ND9ft2npvzHw25;
	Fri, 18 Nov 2022 16:58:14 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 16:58:46 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 16:58:45 +0800
Subject: Re: [PATCH 0/6] ubifs: Fix wrong space calculation while doing budget
To: Richard Weinberger <richard@nod.at>
CC: Sascha Hauer <s.hauer@pengutronix.de>, Miquel Raynal
	<miquel.raynal@bootlin.com>, linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, yi zhang <yi.zhang@huawei.com>
References: <20221011034732.45605-1-chengzhihao1@huawei.com>
 <8207d8f9-8b30-cfbb-9a5f-56294cb35601@huawei.com>
 <16338722.252938.1668761788563.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <96ecfd93-f74f-5a43-2124-85168a08b00c@huawei.com>
Date: Fri, 18 Nov 2022 16:58:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <16338722.252938.1668761788563.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_005854_452502_8EA36FF6 
X-CRM114-Status: UNSURE (   5.57  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjIvMTEvMTggMTY6NTYsIFJpY2hhcmQgV2VpbmJlcmdlciDlhpnpgZM6Cj4+IOWcqCAy
MDIyLzEwLzExIDExOjQ3LCBaaGloYW8gQ2hlbmcg5YaZ6YGTOgo+Pgo+PiBIaS4gUmljaGFyZAo+
PiBKdXN0IGEgcmVtaW5kaW5nLiBDb3VsZCB5b3UgcGxlYXNlIGxvb2sgdGhyb3VnaCBmb2xsb3dp
bmcgc2VyaWVzKFNvbWUgb2YKPj4gdGhlbSBpcyBzZW50IHNldmVyYWwgbW9udGhzIGFnbyksIEkg
d2lzaCB0aGVzZSBjYW4gYmUgbWVyZ2VkIGluIDYuMSwKPj4gdGhhbmtzIGEgbG90Ogo+Pgo+PiB1
YmkgaW5maW5pdGUgbG9vcDoKPj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0
L2xpbnV4LW10ZC9saXN0Lz9zZXJpZXM9MzA0NDg1Cj4+IHViaSB1YWYgaW4gc3lzZnM6Cj4+IGh0
dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1tdGQvbGlzdC8/c2VyaWVz
PTMxMTk1Ngo+PiB1YmkgZmFzdG1hcDoKPj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9w
cm9qZWN0L2xpbnV4LW10ZC9saXN0Lz9zZXJpZXM9MzEzMDYzCj4+IHViaWZzIGFzc2VydGlvbiBm
YWlsZWQgYWJvdXQgd3JpdGVwYWdlOgo+PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvbGludXgtbXRkL2xpc3QvP3Nlcmllcz0zMDI3NzYKPj4gdWJpZnMgc3BhY2UgYnVkZ2V0
Ogo+PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXgtbXRkL2xpc3Qv
P3Nlcmllcz0zMjIyMjAKPiBTdXJlLiBMZXQgbWUgY2hlY2sgd2hhdCBoYXBwZW5lZCB0byB0aGVt
LgpPSy4gVGhhbmtzIGFnYWluLgo+IFRoYW5rcywKPiAvL3JpY2hhcmQKPiAuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
