Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2715DC77B76
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Apr 2023 09:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oQIL7qvfaCQBdffyHndQTsfmmtFf/4Mj43ayOGmFl0A=; b=vazhrWktEbAenn
	sRfAt0ZeLmB758kh6m0xvNFGL4CS7dJblxFVD3FXKyZadY8TT2zR6qUAKMs3DgYZj6Nv2SI909w0K
	INT6FZwQHU5LTMZXqbe6xfDM30LH2xAN4N8Lm/tMXRMXLxelkIUtR9M6gn0lSoHMfy1sCLa9u4M0b
	rM0fS1XgUcTmUqlwXn6NeKBHonZBhppEq//L1wH06/CNy+6hRYJHW8ojQC/9Ql78//MHEdTUkrMGC
	4DtjtspGQzhKBmAnLgQk9XJxOaBb+tTgHM9DTRjzUf3fyje0ceeRp4sf1zRiMo84De3OFREMSvkIR
	3zU1S3D0odAKWH5V2aEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prFEr-000gJi-2G;
	Tue, 25 Apr 2023 09:45:33 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prFEn-000gGU-1K
	for linux-mtd@lists.infradead.org;
	Tue, 25 Apr 2023 09:45:30 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id 952BB7FF9E; Tue, 25 Apr 2023 10:44:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1682415911; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=hNIa4yVLDWYsPnTCpOUQYxbqJ2OJxODuejp95gxbEtxl6WHYbIy3hjUBuqee5FPd7
	 jR6WUU2ErLFeBPc2cLRcNpqZkQIkRAwiQnp/R9zrVdbXScE4wuXAPzxQBESGmtH285
	 zZmL8agXhphHG4dbt/K/UY7VQtp9Gh8S+FbKIZMax3IODo0auwcSeMQ9uBJJ3wFbD0
	 su6sEaG6fAQj5HRj8YoHBdM85Faafr+4xgciAHJNxGQjS6ZCOpi+ZMdl5/Kwnk0K4L
	 nsUl+yZ597NWia+7mb7pbmCL/PktsJrOqHsq8TPwb6a+3MhgigRfHC7Ru0s6c8nsNB
	 LtIeAfTdsg5uw==
Received: by mail.lokoho.com for <linux-mtd@lists.infradead.org>; Tue, 25 Apr 2023 09:42:51 GMT
Message-ID: <20230425102243-0.1.5k.201y0.0.heq7yu54dq@lokoho.com>
Date: Tue, 25 Apr 2023 09:42:51 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_024529_590907_767EDE1D 
X-CRM114-Status: UNSURE (   2.32  )
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
