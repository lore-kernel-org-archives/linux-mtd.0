Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD35C282DE
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 13:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djJNDKtflabG2AzAjoelpNX5HLq8EkwDpIL8oJVwKOQ=; b=GKnoF/P8va3cQK
	Sb/6eFKQrfoA2wghIV3GRBG14QhjTlAZD5wZ1BJSC3iOSM/ljkvvpcPsJGYxNZxPxMgmGiZJXw1OK
	4hYxm3+Df3mEhiJK8BDT7S7SAK9DAXAHO4X8u68NmAYz3R5nmrim84TIhwZppUXuEx4Nnz1L7KG6s
	FAzd/s658TH8dOzSkH3AZftwNYeaWs5wL4K/LEUgYGkEJGJnSP2s5ZeLXVmbeMcYo/DkjwXmhEb+i
	yTVvMQs82ufAzGDxysgc/UAI0btyqeuezhf7ng9Gk5VeJGuJZf42l5FmjQZPHNCAZFXhPVJNUuxR8
	AIFtWUP51Lf8I7rLlEDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsj4N-0000000BTIV-30nv;
	Thu, 13 Mar 2025 13:57:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsj3f-0000000BTDy-0Uq9
	for linux-mtd@bombadil.infradead.org;
	Thu, 13 Mar 2025 13:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CSYFjYhMdwhI/VzknzzTVfgN/YkVrdrLRVv9f9QzC58=; b=a2FoB6H0JWHyvgBtiaGtVHiVBG
	GC26ff0XsenjL7SliRHV0mbhYAoRRPu+E+rddW5d3inv583IuSGOTsgOvziKtd37iyORxGVwLgcDx
	QnaYlLdc3GO1DyeOFhDSUG/hPIsizazSFfIyH5ciV3WXHuwlD2EQB5muEouJmIXT3E8+uvUN11G5T
	DxmoBlanTZ0LuCxxHAd/4zLiKUc/heKrUtWResIxArjsulFZm28+r9YHHlo9Pcpj4y/3AnZRbYPBz
	7uKxhCmhHRBXVlzAueTJ3xYF649TI+BB5Z9qpXKkiCaBY3EYrYk/feeG23LA+WpprBKGKsGhQMZ35
	HK0Z5L+A==;
Received: from mgamail.intel.com ([192.198.163.10])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsj3b-00000002f7r-3bN1
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 13:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741874228; x=1773410228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=LGMAZVxMLMP4zoINiImPzFOYs0NI6DAPitF/gHKG7v4=;
  b=cvZlpfYcNnmVLHNbTBuPA3eqlmqR5VNUtchb7XMK8BPxp+hnUO3+QImp
   2OYzmZTm/fJYXeRmVT4yET3MgwPsf03VHdhwMPbEiCWEb8QR4oueTSiYK
   wa9nbx+VDp5djalqqhsPQNaycE00thMrOh8TcTQfTHou4y3E44fU9QLuK
   162yKXdZTABtRsTHmwzNxNnFSqkeD9pAULIj6I8Sx8fYGkyRrzlp5OECJ
   CopQVscnaPKhl0zPsGN4qWbafVs3v0BGpom3y9S9cfolFY8Y+h/l3U2KR
   i+TVTAVYNZVumMbJIPPUrFopgc43gS7a0ixYusF8pQZZELFfXCRPOzt8Z
   g==;
X-CSE-ConnectionGUID: Zd8qze4BRPyGsYOP/c70ow==
X-CSE-MsgGUID: 5K3NjZW/S8m7UnNfgQQnOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="54364734"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="54364734"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 06:57:01 -0700
X-CSE-ConnectionGUID: /DiW6qIxT324umM7RI1qug==
X-CSE-MsgGUID: jY5Rv8mzRpiuSYHqa61QlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="121016098"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 06:57:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tsj3R-00000002BzV-10we;
	Thu, 13 Mar 2025 15:56:57 +0200
Date: Thu, 13 Mar 2025 15:56:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/1] mtd: mtdpart: Do not supply NULL to printf()
Message-ID: <Z9LkKLLl2Z5cANga@smile.fi.intel.com>
References: <20250313091631.243346-1-andriy.shevchenko@linux.intel.com>
 <f17a1851-7360-3f18-4e89-dbf6948eeaff@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f17a1851-7360-3f18-4e89-dbf6948eeaff@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_135708_410940_F274CB9D 
X-CRM114-Status: UNSURE (   9.66  )
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

T24gVGh1LCBNYXIgMTMsIDIwMjUgYXQgMDk6MDk6MDlQTSArMDgwMCwgWmhpaGFvIENoZW5nIHdy
b3RlOgo+IOWcqCAyMDI1LzMvMTMgMTc6MTUsIEFuZHkgU2hldmNoZW5rbyDlhpnpgZM6Cj4gPiBH
Q0MgY29tcGlsZXIgaXMgbm90IGhhcHB5IGFib3V0IE5VTEwgYmVpbmcgc3VwcGxpZWQgYXMgcHJp
bnRmKCkgcGFyYW1ldGVyOgo+ID4gCj4gPiBkcml2ZXJzL210ZC9tdGRwYXJ0LmM6NjkzOjM0OiBl
cnJvcjog4oCYJXPigJkgZGlyZWN0aXZlIGFyZ3VtZW50IGlzIG51bGwgWy1XZXJyb3I9Zm9ybWF0
LW92ZXJmbG93PV0KPiA+IAo+ID4gTW92ZSB0aGUgY29kZSBhZnRlciB0aGUgcGFyc2VyIHRlc3Qg
Zm9yIE5VTEwsIGFuZCBkcm9wIHRoZSB0ZXJuYXJ5IGNvbXBsZXRlbHkuCj4gPiBUaGUgdXNlciBj
YW4gZGVkdWN0IHRoaXMgc2luY2Ugd2hlbiBpdCdzIG5vdCBOVUxMIHR3byBtZXNzYWdlcyB3aWxs
IGJlIHByaW50ZWQuCgo+IFJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBo
dWF3ZWkuY29tPgoKVGhhbmsgeW91IQoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZj
aGVua28KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
