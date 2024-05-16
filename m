Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D478DC25B74
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2024 07:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xoVRPUqkcP72GyOzBSNrgYpVjqUjyEROPt8DsVIFemc=; b=JoJDot/TCc81ln
	T3zir8Uv77O4GV+zKM8Sp9WUMvnQUrfjyUT+KkfOYvZ1op+SGUur7UaWr3cvIBH751kESYX1A2LVd
	mdBtf0bnbEKNxADcOST1ayiGorpc5/wL7QManzBnrTaXOgr8j6K8I1ddRR0GWtW3hhVRQU6z6C4q6
	buUOw3vFTK0gjzjfEbj1DnXjrGyDyWLhan81PaZ8DZHIOI4vKuXiZCY8YyEjKfXYK8xDiB7pXbgMg
	PzNaopZ6A10aBSj3ykd5UBBjRJDggAGJFsUeJ83EwlmHrH+SArg0F/qiig6XUuTLO/lGAtkvLgXrX
	bb/gYxEEWPxuKQ+b/fXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7VpJ-000000041xg-2OCi;
	Thu, 16 May 2024 07:46:57 +0000
Received: from mail.haughton.pl ([217.61.0.142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7VpF-000000041wV-3deH
	for linux-mtd@lists.infradead.org;
	Thu, 16 May 2024 07:46:56 +0000
Received: by mail.haughton.pl (Postfix, from userid 1002)
	id 333E582540; Thu, 16 May 2024 09:46:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=haughton.pl; s=mail;
	t=1715845606; bh=H2qKgXE2kH8cJbbzmMD4Hpjt6I9O7VcxhCsYYCpgFnQ=;
	h=Date:From:To:Subject:From;
	b=c/7zXWliwXbNGnFXAnBSARvFupxQbm8JSYoLhTr3+NGhllzDEHWlKIwt3yUtTTjy0
	 +I/7vXPo12bj/mrDxQeQuG0qyQFcy2xMxen8tXCG3Fb2mT17Qdf6XyWpvDLIPQhWo0
	 pfbtJBRp74rO4M+mFCK0QgibJl4i5cHKniUo8a14Z5/eWPYW3hueOLIdr2vmr7ikeQ
	 FoGOFkrpb8tP0kepbzfoOMW2lbP9QwFCG1gE50bFrwh8QqMonPFFWlWjDnLXLD1iKh
	 2SLbKXg4Hvii5y/qx6j/60JmeiGFH6pKPFPz5bXf3BOEakuHDWbZQkGAL1Ouvoyheg
	 yXy5gR893UkMQ==
Received: by mail.haughton.pl for <linux-mtd@lists.infradead.org>; Thu, 16 May 2024 07:46:12 GMT
Message-ID: <20240516084500-0.1.6.2e3.0.nv89ojkgi6@haughton.pl>
Date: Thu, 16 May 2024 07:46:12 GMT
From: =?UTF-8?Q?"Tadeusz_=C5=81ukomski"?= <tadeusz.lukomski@haughton.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.haughton.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_004654_659956_35A711FD 
X-CRM114-Status: UNSURE (   0.24  )
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
