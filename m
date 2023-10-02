Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE915E784AD
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Oct 2023 14:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4Wpf5eF/C+8NLiDZY8D3hM0+VRQOoRKO0zuqT/RXGf0=; b=PEFWcKHyTg5BE9eCZzbikWRio+
	V35oQ7EfwFtZgEJY1ehrtRaHiGqAwSPETH9sWwT89Owfd17/1I7r3ChM6w286xhDJp8OOZWcrmqfU
	qg0DxzM0gvUD9GIVr8WrhwRwIzebAQziL4YImTaozJ57l2718cc+M2m7Aryt+U5O+C/JxV44E6Nl5
	l/3Ap0B9UmbKNLulej7AHzJXGQIIcM9/hyvN8UiEIVwMIGnUxj3IXeMpiVU0oSsH6xUgoPqBEw8HO
	5tp18xABjIRP06ceqSaWt5g6t6p+8LtXAAlTGA9XGol6++Lm/wXrrjCiK+13tbYFi4l567mL2rk50
	7wWzwK1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnJhX-00CrRu-0m;
	Mon, 02 Oct 2023 14:15:11 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnJhU-00CrQN-1O
	for linux-mtd@lists.infradead.org;
	Mon, 02 Oct 2023 14:15:10 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 81F156340DEF;
	Mon,  2 Oct 2023 16:15:01 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id RNrDw-EqjTxU; Mon,  2 Oct 2023 16:15:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2FB386340DF3;
	Mon,  2 Oct 2023 16:15:01 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id iti3kq3l0Lc0; Mon,  2 Oct 2023 16:15:01 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0ABAE6340DEF;
	Mon,  2 Oct 2023 16:15:01 +0200 (CEST)
Date: Mon, 2 Oct 2023 16:15:00 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Lee Jones <lee@kernel.org>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, Yu Hao <yhao016@ucr.edu>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <918629851.25781.1696256100853.JavaMail.zimbra@nod.at>
In-Reply-To: <20231002140437.GA8453@google.com>
References: <CA+UBctD_w=75wChmePZHp7KsBSNPWYGDBtzHPRPPtaFoqhGvXA@mail.gmail.com> <412779912.228444.1682023015809.JavaMail.zimbra@nod.at> <ed510d18-47f1-7f46-03dd-84e043cab6d9@huawei.com> <1366603418.245114.1682236940160.JavaMail.zimbra@nod.at> <951e4cf7-a0ea-b3ec-931d-e6a394ddc2ab@huawei.com> <20231002101117.GA175828@google.com> <43988304.25483.1696242486225.JavaMail.zimbra@nod.at> <20231002140437.GA8453@google.com>
Subject: Re: BUG: divide error in ubi_attach_mtd_dev
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: divide error in ubi_attach_mtd_dev
Thread-Index: so9tCiFxUShqxZrF607c9ZOlLvgfjA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_071508_624062_3A20EBAC 
X-CRM114-Status: UNSURE (   2.50  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkxlZSBKb25lcyIgPGxlZUBr
ZXJuZWwub3JnPgo+IEV4Y2VsbGVudCwgdGhhbmtzLgo+IAo+IEknZCBsaWtlIHRvIHRyYWNrIGl0
LiAgV2hhdCdzIHRoZSBzdWJqZWN0IHBsZWFzZT8KCiJ1Ymk6IFJlZnVzZSBhdHRhY2hpbmcgaWYg
bXRkJ3MgZXJhc2VzaXplIGlzIDAiCiAKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
