Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D293BE784B7
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Oct 2023 14:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9zKU3zYNso99g8Tw5VY3t19n/kf/WSHVhfH7m2SseTM=; b=d0OOtHmVafdo+h
	V6TI4uu9l+oUXQMyJ2N9Rtci3SfTOD4LgEuBH4GDLzy23U3y3Urze97WZks9n6mBXZUxA8yDXf7SD
	Dc/eA9O8TbxgwHqCPDQnWdEceBCeQfU+giJz7zoWumg2usbE9XANRNXVMZPBkPyHfe0apHatE3j9N
	zKVBFmN77+5Br+fB3R36PAPQvg9WojlWC4sZYPRnJpe2Jacc7UogW4AXzFUYzY3Q1hbSIKVNdGK/m
	QB/wInO8h/UQ3UwtW4Y1WKJWXgrYKzCQ8BGdZqY3EqYh2/Rh2Y6JyXoKJtvINS5II65nj4Acl8TwQ
	aBA4/IgC/+5fE0bGMGSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnK28-00Cted-25;
	Mon, 02 Oct 2023 14:36:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnK25-00CtdV-3A
	for linux-mtd@lists.infradead.org;
	Mon, 02 Oct 2023 14:36:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A1712B80E5F;
	Mon,  2 Oct 2023 14:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BB5C433C9;
	Mon,  2 Oct 2023 14:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696257384;
	bh=ViIMzQtiwxZ76FMvkMoS/FCCi7hvSNTyNa/YQnxasRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H1nf5x0ge5ivb7BeTnH+lPAbQpQ3mdFVSb40BSsIQhUHRQJC8/bjphwKQAtNiV5bF
	 QGX4NiIkaYJc3zZubv0mUSMJMtHYVkDA7lJV3wq0/qjF8J3o+gP+jv5NM1Fb+sdh4Q
	 QMMd0NgqOInVs4jRZU8BP9TGKb9tkOmZmJP3+CAzYDBRzAmmHqqQ4CDom2QjXeTesa
	 OUmeSEY7xqKH6pJCkq8gSHhxo9nYHho2b2Xj4ou00xE5+aGsB9vjuDEWIUkDmgUDeo
	 e9M4EIQcP2YzHqWSQalrGYLYACbrFt+H9+81Ez4g3r1QeLvF+IoKmPp0YWahnG/Jrl
	 i24Aob9JNK4hw==
Date: Mon, 2 Oct 2023 15:36:19 +0100
From: Lee Jones <lee@kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, Yu Hao <yhao016@ucr.edu>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: BUG: divide error in ubi_attach_mtd_dev
Message-ID: <20231002143619.GC8453@google.com>
References: <CA+UBctD_w=75wChmePZHp7KsBSNPWYGDBtzHPRPPtaFoqhGvXA@mail.gmail.com>
 <412779912.228444.1682023015809.JavaMail.zimbra@nod.at>
 <ed510d18-47f1-7f46-03dd-84e043cab6d9@huawei.com>
 <1366603418.245114.1682236940160.JavaMail.zimbra@nod.at>
 <951e4cf7-a0ea-b3ec-931d-e6a394ddc2ab@huawei.com>
 <20231002101117.GA175828@google.com>
 <43988304.25483.1696242486225.JavaMail.zimbra@nod.at>
 <20231002140437.GA8453@google.com>
 <918629851.25781.1696256100853.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <918629851.25781.1696256100853.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_073626_161158_982A18FD 
X-CRM114-Status: UNSURE (   6.67  )
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

T24gTW9uLCAwMiBPY3QgMjAyMywgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgoKPiAtLS0tLSBV
cnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gPiBWb246ICJMZWUgSm9uZXMiIDxsZWVAa2VybmVs
Lm9yZz4KPiA+IEV4Y2VsbGVudCwgdGhhbmtzLgo+ID4gCj4gPiBJJ2QgbGlrZSB0byB0cmFjayBp
dC4gIFdoYXQncyB0aGUgc3ViamVjdCBwbGVhc2U/Cj4gCj4gInViaTogUmVmdXNlIGF0dGFjaGlu
ZyBpZiBtdGQncyBlcmFzZXNpemUgaXMgMCIKClRoYXQncyBncmVhdCwgdGhhbmsgeW91IFJpY2hh
cmQuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
