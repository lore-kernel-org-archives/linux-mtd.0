Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651FDC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jun 2022 08:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PC9cskeV0cduTZtGBGPxGO22z9DwX6AHOzbJdD+ZWbk=; b=2RpwP/cw+1poBz
	mlkQz01GsrNxDgDV8tCCy6dQPOf8rmoyaIR81vLZdl9ZK7PgzNAsGMArUyT61mhTyaxZNpJq5UrLa
	ItHytVwjyaMIUgeDKRlVU4stJFqpDkhRdfY7nFAQcG1sqxaFm/JoWnxE9of2YILA/YEwivOpdyghX
	4V8Ouz6eNYdSMndvLS+1zKhc0XQfamtE/o7P9HUPvMiFfn21b+qIybBl4xdudhmC1BJ9U4/9SInc0
	7/Sh9OKhDEeGBEgRmy+RaeOh1uOM7LzemhpNDrKF5AZj2ECa+560U8hHP84sIVMPE0pAkS88uGjSI
	Bc3AqEtyE7kNEzZYWWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyqhe-00Bops-EX; Wed, 08 Jun 2022 08:06:10 +0000
Received: from mail.puregrowthonline.pl ([51.38.124.91])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyqhT-00Bolv-Bz
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2022 08:06:00 +0000
Received: by mail.puregrowthonline.pl (Postfix, from userid 1002)
	id 1CBBDA2B3B; Wed,  8 Jun 2022 08:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puregrowthonline.pl;
	s=mail; t=1654675558;
	bh=CSKXLMgcdpWkXuTgJn5+jsCVobtU9JEF4vCnS5z6McM=;
	h=Date:From:To:Subject:From;
	b=LR7viTG+QwBr+0m52Bbm5lIQl2GsSvkdWmt8UgRg/FKKmVVi/hHRxtbZFEj+9ZwuW
	 AloPqRzL5rF0X3IEfiO/PT0DKda56wi6Thar85tyw2qvR1hy+Yy+DwCMf/Sf4rFeua
	 yEsQIog/UrtxKu9+eaCc9QtN/SCdTwz8P0lbvvTmTpENfV+XHA4X8j/y8hg5VtljXi
	 dbDhFJPJh/ZKEYogOKXQ6BZQELBBx8xo5pX+dfn+0w5KheYQ3nC3s+zCDh0RqxsCTm
	 bJ0ZdWsDHFaAvjJvOOuUnlMpnYIYp9EdsjHQVeuV2vT1y+e6nvsT8gXTi7eXQFLnZM
	 rGzcCFF+spcbw==
Received: by mail.puregrowthonline.pl for <linux-mtd@lists.infradead.org>; Wed,  8 Jun 2022 08:05:19 GMT
Message-ID: <20220608064500-0.1.41.cy36.0.81h6uodo4n@puregrowthonline.pl>
Date: Wed,  8 Jun 2022 08:05:19 GMT
From: "Wiktor Nurek" <wiktor.nurek@puregrowthonline.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Nap=C5=82yw_Klient=C3=B3w_ze_strony?=
X-Mailer: mail.puregrowthonline.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_010559_599745_7F579531 
X-CRM114-Status: UNSURE (   1.77  )
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

RHppZcWEIGRvYnJ5LAoKY2hjaWHFgmJ5bSBwb2luZm9ybW93YcSHIFBhxYRzdHdhIG8gbW/FvGxp
d2/Fm2NpIHBvenlza2FuaWEgbm93eWNoIHpsZWNlxYQgemUgc3Ryb255IHd3dy4KCldpZHppbXkg
emFpbnRlcmVzb3dhbmllIHBvdGVuY2phbG55Y2ggS2xpZW50w7N3IFBhxYRzdHdhIGZpcm3EhSwg
ZGxhdGVnbyBjaMSZdG5pZSBwb21vxbxlbXkgUGHFhHN0d3UgZG90cnplxIcgeiBvZmVydMSFIGRv
IHdpxJlrc3plZ28gZ3JvbmEgb2RiaW9yY8OzdyBwb3ByemV6IGVmZWt0eXduZSBtZXRvZHkgcG96
eWNqb25vd2FuaWEgc3Ryb255IHcgR29vZ2xlLgoKQ3p5IG3Ds2fFgmJ5bSBsaWN6ecSHIG5hIGtv
bnRha3Qgendyb3RueT8KCgpQb3pkcmF3aWFtIHNlcmRlY3puaWUsCldpa3RvciBOdXJlawoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
