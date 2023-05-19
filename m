Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CBFC77B7F
	for <linux-mtd@archiver.kernel.org>; Fri, 19 May 2023 08:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=me4/GaxUHMhGh0wYJYztgp+6tfwuzPOEMbPf+CKKvHI=; b=R/TtNx2JY2lB52
	GQ/uSEjJeSfLb6Q+QTxEyo7RCMCN6qskeZNMRsWd7grQbkJXlxuuE4k0t7UpEKxSRY7lu8QRhwELY
	UnXlrNDpEy8uC+y6iTJKrIykpVZtz7r4l0sWf3zxsBrNXIeNPYo9Ful8VSTHeNYq2VHM/sI1+0bcH
	SzCli/quE+XbJ1T/eLrsh5QmmenqRgBt73oRPuXB/pernL7JrS/E6ND0G3Z+Xjy9Nkm+KR8HH3osC
	AanGW6iryWmXmiG9smp1zwBATGOoPoCvYJugixVg93chQYN0opUTY/7k0RgHutbeV2jNaDvIgesjC
	kGKs5/83hUe7I11JhNBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzv8p-00FSvJ-2q;
	Fri, 19 May 2023 08:07:11 +0000
Received: from mail.corrib.pl ([185.58.226.145])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzv8l-00FStu-1S
	for linux-mtd@lists.infradead.org;
	Fri, 19 May 2023 08:07:08 +0000
Received: by mail.corrib.pl (Postfix, from userid 1001)
	id C6607A4FB6; Fri, 19 May 2023 09:06:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=corrib.pl; s=mail;
	t=1684483583; bh=85MOfYTjIHwki6Ys5IeFKzEzX5V7umZoL3TytLG0W/k=;
	h=Date:From:To:Subject:From;
	b=u+Af2s2bYQqcOg/Uog58S36wIHqCHtuHL9q02G/dxN5ongH2QJaeuC+SUQqRfYB4j
	 SzPQhlTmWsWI3Actvw1N2oyoh8pfSi2ZHC+l0ycAaRIcg1PJS79HLDpzFBq96KPOZQ
	 VUgCpo0y3mjpGIsVUxEZ3zVPq0rBvZcfoBkY3ijIvQ89VXU5hEL04UNB7EFJltOcAH
	 ZIrSYDwvvMOlrcoPUEw9CBM5NNPq0PATGsk1ff6D2qBXRtO5GMSfS/1ZwLCNalAsql
	 dcHjym4rKQkOtyepz9kXl6DizsvkIt37ib9jkoHIQwBlzLiKlyfLTGftLP7bgNPtZ+
	 EzNdafr1sT9Pw==
Received: by mail.corrib.pl for <linux-mtd@lists.infradead.org>; Fri, 19 May 2023 08:06:12 GMT
Message-ID: <20230519074500-0.1.7b.of9e.0.d3efzifbov@corrib.pl>
Date: Fri, 19 May 2023 08:06:12 GMT
From: "Szczepan Andryszczuk" <szczepan.andryszczuk@corrib.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Faktoring
X-Mailer: mail.corrib.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_010707_622612_27A20C72 
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

RHppZcWEIGRvYnJ5LAoKcm96d2HFvGFsaSBQYcWEc3R3byB3eWLDs3IgZmluYW5zb3dhbmlhLCBr
dMOzcmUgc3BlxYJuaSBwb3RyemVieSBmaXJteSwgemFwZXduaWFqxIVjIG5hdHljaG1pYXN0b3d5
IGRvc3TEmXAgZG8gZ290w7N3a2ksIGJleiB6YsSZZG55Y2ggcHJ6ZXN0b2rDs3c/IAoKUHJ6eWdv
dG93YWxpxZtteSByb3p3acSFemFuaWEgZmFrdG9yaW5nb3dlIGRvcGFzb3dhbmUgZG8gUGHFhHN0
d2EgYnJhbsW8eSBpIHdpZWxrb8WbY2kgZmlybXksIGR6acSZa2kga3TDs3J5bSwgbmllIG11c3rE
hSBQYcWEc3R3byBtYXJ0d2nEhyBzacSZIG8gbmlld3lwxYJhY2Fsbm/Fm8SHIGtvbnRyYWhlbnTD
s3csIHBvbmlld2HFvCB0cmFuc2FrY2plIHPEhSB6YWJlenBpZWN6b25lIGkgcG9zaWFkYWrEhSBn
d2FyYW5jasSZIHNwxYJhdHkuIAoKQ2hjxIUgUGHFhHN0d28gcHJ6ZWFuYWxpem93YcSHIGRvc3TE
mXBuZSBvcGNqZT8KCgpQb3pkcmF3aWFtClN6Y3plcGFuIEFuZHJ5c3pjenVrCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
