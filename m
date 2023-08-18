Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B38C7112B
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 08:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ac/QB9ch82+yt77vAllt2tyt/yjedgtsrWARWkJ7MdE=; b=vnEkRuhAUAtYmm
	3/nWGVi6tK80VOTxfDFWep56n6BGqThopl+Rtr6Xf1bOGYYX9CMgA4/xKWFuNshQ5I6vFVkhvCEmb
	khpMmXWqVyuXC6cOZgGvql+ByU0ntEoMnDBGvN0Dkn9eGQUJB48uCgKoDj1mDHtPQ2TjOJiTt2Z11
	sXFQZo9mbwY/633NskMqpTSvAoX+pP7vetpnLrZsKNEZlAKL8R0sGWSxrwwofqk7tN2VB/BGqnOcw
	nO21Rn8fJBZ6RjcdaXqc369hRzFz54pPliN/lqje4gO+b8WIozkxXwHBLTNV38gnEd/+DOJ3wq2Jz
	99S7IxQTBDOetwFAOJkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWugd-007yqq-1b;
	Fri, 18 Aug 2023 08:18:27 +0000
Received: from mail.leachkin.pl ([217.61.97.203])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWugV-007ymO-0Z
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 08:18:25 +0000
Received: by mail.leachkin.pl (Postfix, from userid 1001)
	id 68C6384222; Fri, 18 Aug 2023 09:16:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leachkin.pl; s=mail;
	t=1692346580; bh=elHzctRz/z3PfTIhGYJKd0TeBTmca98Y+JNgX4gfsPI=;
	h=Date:From:To:Subject:From;
	b=h5t0qpGo7kgjPc+8y3QkjyGcW1f1k8yL9zO39mxbenUdrTojrNDTyy1Kn/iopugn6
	 zfiFC0F8GFmjPdJbCeudBlXwBjiHKq2xNVAtcRGbOz4nrES3u7HR7Z7cEoufCyM0EB
	 xvv0x1I+2nBEDWXZDZN3m1XH4oRFzZS5cINvamjU7qNiAaMtb01jb5tytOlQLGpvBX
	 //BgnnNOWn8zbMO89PSc0AE23ILEmG3zLTY1bdDmBlKhDqGuMd5GTQ7YqRsmAAegp1
	 4yImPwGnp+Rl4cjjMNK6tf9t2ehFt13qHe7xcq8mMEOK41r7fzHz0eEDxnHJetk61H
	 aM7UpKQQcuGEw==
Received: by mail.leachkin.pl for <linux-mtd@lists.infradead.org>; Fri, 18 Aug 2023 08:15:51 GMT
Message-ID: <20230818074501-0.1.4u.cu0g.0.14xul2jdcr@leachkin.pl>
Date: Fri, 18 Aug 2023 08:15:51 GMT
From: "Jakub Lemczak" <jakub.lemczak@leachkin.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.leachkin.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_011819_351428_9A44D2B6 
X-CRM114-Status: UNSURE (   1.57  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGludGVyZXN1amUgUGHFhHN0d2Egcm96d2nEhXphbmllIHVtb8W8
bGl3aWFqxIVjZSBtb25pdG9yb3dhbmllIHNhbW9jaG9kw7N3IGZpcm1vd3ljaCBvcmF6IG9wdHlt
YWxpemFjasSZIGtvc3p0w7N3IGljaCB1dHJ6eW1hbmlhPyAKCgpQb3pkcmF3aWFtLApKYWt1YiBM
ZW1jemFrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
