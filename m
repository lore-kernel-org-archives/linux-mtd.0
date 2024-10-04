Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70469CFA74C
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2024 07:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xoVRPUqkcP72GyOzBSNrgYpVjqUjyEROPt8DsVIFemc=; b=RcABJp7hakdzoT
	EQn3GVHVMN7Ua397jTdyJkG2ptWAIQhnKv/MOX6SNtOdrrRTzuiT392wdshZh/3CvEF0fbxCG15JP
	/da1ESTV4OBcNvtgYQDzMED7Cb/2A+uHEDPPAiYNhWeqK0aMWpvYiq7ULzAfRUoxPptKGeMfOdsfu
	nnOZ2l7csXTlZ5XhrHTQ8MdzsX4chfYk4QPy5eZGa79BQf6fZKjcGX+HN+9/NxYNY9jSQVV5gt0pA
	Kbd4VCB9pYjAosPvOf+NNi/VyGR1TroKPE/y7cNFs0WrRw/gv6PuhTYh5Bv9HvVsFBSjAehSc147O
	IccORztqdNLtjeRjGHKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swcwv-0000000BFEp-3MqU;
	Fri, 04 Oct 2024 07:42:05 +0000
Received: from mail.craftyimpact.pl ([51.195.47.69])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swcws-0000000BFDP-1Y37
	for linux-mtd@lists.infradead.org;
	Fri, 04 Oct 2024 07:42:04 +0000
Received: by mail.craftyimpact.pl (Postfix, from userid 1002)
	id 0BCE7A41CA; Fri,  4 Oct 2024 09:41:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=craftyimpact.pl;
	s=mail; t=1728027719;
	bh=H2qKgXE2kH8cJbbzmMD4Hpjt6I9O7VcxhCsYYCpgFnQ=;
	h=Date:From:To:Subject:From;
	b=C4NaM3o6gszSCN4ybMjynRJJxmap5SZfabyWfSn/54qL3viBMC+PSDhUbtBDuiGQA
	 YztelyywQkQavhaWE2qiXnJaaF4CYmLgNbX8hc8pgsd58VXQyeY86eIJJ/bqNHIeFG
	 PbBcddcCE2FOHqHaU6FI9YQAD7BOyo909hpwCVJCvhLMax9I0NRJEjkbf43rYo6pP/
	 GqMVXgQzKjlCOVWnAon2Ky0iBh084O8C5ENWKSpvttPkLW9fqpVKqSa8aEfC0yPU+F
	 DMcvkqyCxpMr7zgEszEOZnjhdJFB3+F56GzkmDa3BWa/a6ZAHvwN9jBl1VJk44HxkX
	 aqOi+ixM7l48g==
Received: by mail.craftyimpact.pl for <linux-mtd@lists.infradead.org>; Fri,  4 Oct 2024 07:41:10 GMT
Message-ID: <20241004084500-0.1.jo.16sza.0.dy80gr2ggg@craftyimpact.pl>
Date: Fri,  4 Oct 2024 07:41:10 GMT
From: =?UTF-8?Q?"Tadeusz_=C5=81ukomski"?= <tadeusz.lukomski@craftyimpact.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.craftyimpact.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_004203_121221_08907133 
X-CRM114-Status: UNSURE (   0.64  )
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
