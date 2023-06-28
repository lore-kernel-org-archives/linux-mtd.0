Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A9BEB64D7
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Jun 2023 07:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oQIL7qvfaCQBdffyHndQTsfmmtFf/4Mj43ayOGmFl0A=; b=oyu5bTL4KgxGUM
	TH7xSKY76lNPjBU19azyOMR9xHsF3ssqrMNZSUEcJNN0y2HqdUCS3oQ8YEozvouIu/WIdFfHD+SyF
	szFC38Z9iKOROnnUQUXHvN1deLQT1MFiV5CMig51/QQD/++Am+xUVQe/DFsCi1KiSV6Msd4wbF9Hn
	nIkHm4fLUBJO7kZIsa1bZix4f71Jo9Gj8uE9JNpAOItiwJTe1J0kYRSF0Xnai8hQrLxplRgxX4oif
	akIAefF9u3kA6JgiE5h25qrfOhBW02a6l7CseydxaL+c2dyJzLr10nlYRWCNoUQmlX/2mxs3M/TRk
	oyqw290ofi5cyQfHJ/SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEQ0G-00F6Bu-1g;
	Wed, 28 Jun 2023 07:54:16 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEQ0E-00F6Ar-0J
	for linux-mtd@lists.infradead.org;
	Wed, 28 Jun 2023 07:54:15 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id B4ACA87CD8; Wed, 28 Jun 2023 08:52:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1687938735; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=SpcFFS2JlM5Lp6H5T7z+SK3MFNTDA/l1ZG/VuJoFEzJSGtlSNWtbHKzqpHsAMbKhY
	 qk79pk3Bs17IHOu+92E8g3RvoXUsuKpLX+pcIqyPiGHgupmboDxMrpvSflme4JkRgs
	 muMotK9uyAg077FnYPd5EPmDwzX5xTqcb2FiGZSGvlREecpDyBEMjdNu+YpQ+in80q
	 0Li/aF9NZ0CQvYCkFSaHr2HVwtwY4OASbTS7gE7VI+pjnVZ2wFvatTQG2MNp/8Nm/p
	 kmYAmJRfl11nK3dL6ca9PYMxjU6HEeHIdzvypK8ujvarbv6EP8IKzYd7gD55WeL91F
	 b8Fan8qdHUnAg==
Received: by mail.lokoho.com for <linux-mtd@lists.infradead.org>; Wed, 28 Jun 2023 07:50:51 GMT
Message-ID: <20230628074502-0.1.6x.2si5c.0.jh3nfb74t5@lokoho.com>
Date: Wed, 28 Jun 2023 07:50:51 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_005414_374943_65626475 
X-CRM114-Status: UNSURE (   2.31  )
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
