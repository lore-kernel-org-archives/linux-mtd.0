Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67447C83F25
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jul 2025 08:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xoVRPUqkcP72GyOzBSNrgYpVjqUjyEROPt8DsVIFemc=; b=jvhih+HEtivdKc
	Rcalc/Mt/zz60RBen9pUduuwchVPeC6zm3JhhgyOoEvOeI6Ni3O519aB9snKXnm4os1vfV/g3otp7
	txL9KWopSIr49RuW1P8kdmKbHGAvros2CiVZefWNGKVG1XopWlTXbfRts7fNg8xASw+VNxWssPwDT
	CbN8Fre3eEBD6l6OzL0twNA7XyFsVYXy+gRDk9gZer4zthourDHJ1n4EnEkTI4ygzE8wdjCEVoRks
	Zvw2IDGvxMW1kVPs+HcMy0QJxmtSkFCjuP+fAipR+ATVyz6V7sr6H4cWkAfpm5WhQJbqHkITwC2lt
	FaaX5oDXFavAzmj7c3MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8gZ-00000001syc-0gRc;
	Tue, 22 Jul 2025 08:49:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7XS-00000001gfe-2ij4
	for linux-mtd@bombadil.infradead.org;
	Tue, 22 Jul 2025 07:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=H2qKgXE2kH8cJbbzmMD4Hpjt6I9O7VcxhCsYYCpgFnQ=; b=NXreSgBojKPhU5rhIWHr9x2EAb
	sDsBVvDVHrvPDEL7mCtY63MgJG1MmMJQ9cV9OAI7elI11ziYt1JbQeFajxkHwH74p3VxNPJbJqXL7
	VZpgMXqTktB8a2jg6eU7LH8pRi3/WDKeFWDBxbw5xjyIz225HNZc8/LWMM7B4cQaMCTr0qADm086E
	9MxjXbH97RPh+whVKP7ZroeKuyGpyHFVMmDodMsrDjYKayvokTOM1R6LjJ3k5qSbgGpko9A/LqtfI
	7iy+REdcGg5m+6ggVsckzgkOFQee7Ma5Dq/HV5E0fdk2HGrW+vAkVagzhtZ7OrhXD6LLBloKIrZpR
	x7AZrbng==;
Received: from mail.monetoro.pl ([217.182.69.186])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7XP-0000000BE2X-2DNx
	for linux-mtd@lists.infradead.org;
	Tue, 22 Jul 2025 07:35:49 +0000
Received: by mail.monetoro.pl (Postfix, from userid 1002)
	id 9A9DA489FA; Tue, 22 Jul 2025 09:35:42 +0200 (CEST)
Received: by mail.monetoro.pl for <linux-mtd@lists.infradead.org>; Tue, 22 Jul 2025 07:35:31 GMT
Message-ID: <20250722084500-0.1.hc.36lje.0.z3ib99q3gm@QuantumQuest.pl>
Date: Tue, 22 Jul 2025 07:35:31 GMT
From: =?UTF-8?Q?"Tadeusz_=C5=81ukomski"?= <tadeusz.lukomski@monetoro.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.QuantumQuest.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_083547_776523_971230F1 
X-CRM114-Status: UNSURE (   0.95  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbSBzZXJkZWN6bmllClRhZGV1c3ogxYF1a29tc2tpCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
