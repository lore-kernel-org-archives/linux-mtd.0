Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331CEEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 08:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oQIL7qvfaCQBdffyHndQTsfmmtFf/4Mj43ayOGmFl0A=; b=Duvx+UPlwxJBBO
	Ax7pInBaNZFWEqJDoYDdvk9FKJvHFb493rp0aWp3Gx1MdvFUDTD39OJ9cCJbSL+zpxf8647YPXXFK
	I6jps6CeTJ+XaJiYFe0DJhVQ+TN8wdcQz35Co3wULWjdzRfRkWJOC1d+nmpRQjtC/z79fqYRkZIJj
	YZuSPvqbC4W5lMMK8PPTe4rnAJkWCFUbf6sNYNLAf/b6estrQ2e8um95uHQS5IB10TYes1EbZ53Vw
	3uchtdfeVd2r8CYpsXVWr5v7a0rYAcdobrw6HDY2dESUBjg/PKtIvLdeV3bh5w7PlZfMsoSuVbSZ5
	jYXMj/2V0QJKqPEAZN8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJUuR-00GruL-2U;
	Wed, 12 Jul 2023 08:09:15 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJUuO-00Grsb-25
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 08:09:13 +0000
Received: by mail.lokoho.com (Postfix, from userid 1002)
	id E5F7F86D22; Wed, 12 Jul 2023 10:05:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1689149134; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=FMdwk9f13N94nuPSiEpAa9d9OAlXUvPtG97P0TdnG8hzdk2Cz2AMSnjtzNqn4IYMl
	 muv+KfVcRxoN12hYeDlE4lnltHX95AeRBrpLQMnvZrKSsM1fORFe7oJI0DVYTfXJbE
	 si9ExC8g6EMeUTaJcOnOf1EqJuaGfio+NfMa92JrNFWoMBHskuiPttJVwx/4LJxlNy
	 ynY2DMWjDiWnf78faRUp0k1iaNL/GfqO1h/geTU2GH2poHmGJszjUZCrj6YWy4Uk7m
	 x8Y8zhLfmslt7sI1xRZn7z/2NTJxqVKjSntWBzsjUsK8l9+XQPQ89pM3w479GxmFbX
	 AvKp/xVCo/mgQ==
Received: by mail.lokoho.com for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2023 08:05:10 GMT
Message-ID: <20230712084501-0.1.9.2iqi.0.9t5nj13a7o@lokoho.com>
Date: Wed, 12 Jul 2023 08:05:10 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_010912_821340_EE0AACC3 
X-CRM114-Status: UNSURE (   1.09  )
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
