Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312CFC77B7E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jun 2023 07:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oQIL7qvfaCQBdffyHndQTsfmmtFf/4Mj43ayOGmFl0A=; b=mmbbNNnTuDG6fb
	f3arqXxLq7MrkBODAWYka8g1OlGGfeYnWBhDIBUQ0sjB4riXGTv7B74z3tyTa1tgyED5jBAAJ8z8r
	o8QHyPToPpgaw7mOF1zLki6LSWQXKl65pmyYzBmmhrC2k8+pTzJU8SE9xsfOW3dAxilE67Dr0a8Vt
	/cKR66/3BGdN1X6IqGXcNB7vsyQrHBAxn97v10tbQs3BxYWwFY860oUi/iFuBmcHy6oY3fEJKRfxX
	Uh8Ab7xhGgj1ebiry52aI/SV76k+27iEq1fuMFRQ0vHTesoU070CAuYnEr4JQmj6HD+sn9kfO5BWa
	uyo7PTZZElxhOVA5PirQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4cm5-002MoR-0v;
	Thu, 01 Jun 2023 07:31:09 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4clz-002Mls-0l
	for linux-mtd@lists.infradead.org;
	Thu, 01 Jun 2023 07:31:08 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id 1BB9B837BE; Thu,  1 Jun 2023 08:30:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1685604658; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=iP/UiyBQ3turY/xz6mUrp5oJ29si0Do8j4ri8NID3EUL/fTLuX9fu2/gnAZwJy3kE
	 Ocbd95IENeEQFRkYnv8kKx3yZ5ReMsomafzMiL3f4peomFfVmiU7gWS1efEoMw/JzW
	 +DrKAPS9d037ihcx5z4nmOcFgR6UdMZeUKEQevv+9QammHYCKLiM4JMIU7jWPRdf6O
	 XJBSgAd3ifR6+T3zxTLqzH6yV8nHP8Cgw8v4w28M8JROxTyLclCBAPVeSRyAJJ+6V9
	 kDWHvuGrfQuL9gD0S+CSQsjymAcIKr3RTgi1h3SR/kRLwE+ghI5/b7Igh6HIEZ3sxE
	 vytiJ885dvR3g==
Received: by mail.lokoho.com for <linux-mtd@lists.infradead.org>; Thu,  1 Jun 2023 07:30:57 GMT
Message-ID: <20230601074503-0.1.6c.2g40i.0.lkyw90itin@lokoho.com>
Date: Thu,  1 Jun 2023 07:30:57 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_003103_498312_0F3D81D0 
X-CRM114-Status: UNSURE (   2.24  )
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
