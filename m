Return-Path: <SRS0=3D+l=5R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D34C43331
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Apr 2020 15:43:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23B31212CC
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Apr 2020 15:43:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GaNCdAm+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNuvGIDJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23B31212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GbhSjQEpFmnSJU/QmTikrKov9wfe6Gdx6JebHQLes+M=; b=GaNCdAm+OO0J7H
	3yy9C+NNvsE1OGTUmD9KFwxlIQ35CF7Z7i1CfcJpX1sCVv5PolQQZ35iZvgfNlb5FPLUvbJhZu+nX
	r1nEYAv4+IGGLOfJSSlCrq4C1uJCYEMWXCa77KwVFUEeRNorspBalK0VFQG8Vb4J71tPm26fdpHzf
	9QcFLsyLmqMLr8LOJZIwqTVSXnWMSLbzhH6YTckgwLk/C7WFd31SYJ4vz4t90D2HmO4hIXP0koo+5
	qs56iR+AW58Kcj5YA2jvbcRzNUXPhivlmKHU/Y9HS3xYFgf+g+DEDRHqhZNCc/+UX1wY7NEAPilQw
	CDeWA9w5K/58phikCUWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJfW3-0007VS-7p; Wed, 01 Apr 2020 15:42:55 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJfW0-0007Ux-Cc
 for linux-mtd@lists.infradead.org; Wed, 01 Apr 2020 15:42:53 +0000
Received: by mail-ot1-x341.google.com with SMTP id l23so26377718otf.3
 for <linux-mtd@lists.infradead.org>; Wed, 01 Apr 2020 08:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Bux3KnXS9FSFldUTKrFgipiZ74154WhkDc1Y3oKGJwc=;
 b=SNuvGIDJUmhXdf0K8zC9cGdLTermV+BTq22yiBXyxhV37MwWfbT6BnvA5iWYxtVNEm
 FA8CEklc7/SItW7uoamuJhz9X7dI4rHFySFKMSGXrcBAyDzXRNypaG8KVyqjwXDxXJQh
 CGT4PKWKkW7Kkn+LchdDoaD8DsVshbMxcorNBJchw5HkMCzVdW5Ca28QZXaub29veUoW
 ZpOlaWLLRujOvrzcaLeakLZLvpqhtJ5oHxPQ+T3X+ZzzJluB2HIAwWv2Q2F4eaOWrltI
 691881spKkkOARk2HODjiPENL3NJPBP5XjlE/hEsrLcO8tCn6fuGIKptTNd7KSUOYVo7
 tYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Bux3KnXS9FSFldUTKrFgipiZ74154WhkDc1Y3oKGJwc=;
 b=uXowEgXNfTZJrFTE17EIe42B+u/uj7uYfwEw6Dp0+tnkRfoNPlvAcN4w4mBAthDevx
 IaNL4U4xYPQFVZ21CJ6KymFJw9DW073sNEz/VMl3Jg5p18VpQY1SAtb9wBNkAre79pHm
 4r4EnleAiJkDuyrhR/s1zMYDtinN4T+YBFc1+AgX6CUoZg6Rpk8hVCfdbfGETfUHfrLz
 kdwcVYfXeCKTnAXCOz95k5Av8aHRf7kHaXOSZ2sUiN2izi4lspD46kVz92zGvvIhgM8u
 5AQ/XqoDGs0z5z2PdcJKTG5Ey0Ozr0SiNiR8QYYvi00z4WDy9Cg/hULpgEVfnpU4nArv
 hj3A==
X-Gm-Message-State: ANhLgQ3ihf4MV6Mbp9WBxoZDWBLtticCnmH23NJCLb1+q/nx+r5sUuAG
 b2Q41iyad5ziwlRI9/WScxhqx2+Mq7N/pFjCGtk=
X-Google-Smtp-Source: ADFU+vtI2gGPMTf1kzw8+sVdcM9KiouP57limg3an/xV5hL//hDXdjyLPU/gjQtOV0VqGpd0wGiVIFftXdS2efUa8FI=
X-Received: by 2002:a9d:412:: with SMTP id 18mr17070955otc.134.1585755771112; 
 Wed, 01 Apr 2020 08:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAP6exY+LQ4Cz3Wq3P=MP78HhHCovMYDfwhpVuASp17h3s2sgMw@mail.gmail.com>
 <CAP6exYJ_jzrB0D=RLXMNeegu4BwQq8raXVOMugkqzX2ZP_JSqw@mail.gmail.com>
 <20200327155608.GM2564@lahna.fi.intel.com> <20200327171907.7a7ffc73@xps13>
 <20200327164802.GN2564@lahna.fi.intel.com> <20200327175238.784cf47c@xps13>
 <CAP6exYJ4-pBBZKA0z8TKPqh_0tKzJadjXEBZk9dc9ij8BJ9Xew@mail.gmail.com>
 <20200327171619.GO2564@lahna.fi.intel.com>
 <CAP6exYJWWT2SFLjPCdjAEEjmZYwqYuTxd_aRaf=xEELmXqfMpA@mail.gmail.com>
 <CAP6exY+p-Chi2R4Y1H8UvcbE6rvEpMiK3UaX2OyBq=ZO6uULpg@mail.gmail.com>
 <20200330060859.GR2564@lahna.fi.intel.com> <20200330092722.2ff41863@xps13>
 <CAP6exY+F2VoEZkwcYp38HNt7NyZucQrdQ8MqQyTQ62U12pAcSw@mail.gmail.com>
 <20200401094148.1786d48a@xps13>
In-Reply-To: <20200401094148.1786d48a@xps13>
From: ron minnich <rminnich@gmail.com>
Date: Wed, 1 Apr 2020 08:42:39 -0700
Message-ID: <CAP6exYJYT23SiRcJUyzVzN6o_pYkakOPs5hPwWYTsjXmk3WXMg@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd/intel-spi: Support cmdline-based partition
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200401_084252_429017_D47992B1 
X-CRM114-Status: GOOD (  21.71  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

eWVhaCwgSSBhZ3JlZSB3aXRoIHlvdSwgYW5kIGFtIHdyYXBwaW5nIHVwIHRoZSBwYXRjaCB0byBz
dXBwb3J0IHRoZSA6Cgp0aGFua3MgZm9yIHlvdXIgY29tbWVudHMhCgpyb24KCk9uIFdlZCwgQXBy
IDEsIDIwMjAgYXQgMTI6NDEgQU0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4gd3JvdGU6Cj4KPiBIaSByb24sCj4KPiByb24gbWlubmljaCA8cm1pbm5pY2hAZ21haWwu
Y29tPiB3cm90ZSBvbiBNb24sIDMwIE1hciAyMDIwIDA4OjUzOjIyCj4gLTA3MDA6Cj4KPiA+IE9u
IE1vbiwgTWFyIDMwLCAyMDIwIGF0IDEyOjI3IEFNIE1pcXVlbCBSYXluYWwKPiA+IDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Cj4gPiA+IFdvdWxkIGl0IGJlIGhhcmQgdG8g
c3VwcG9ydCBhbiBleHRyYSAnOicgYWZ0ZXIgdGhlIE1URCBkZXZpY2UgbmFtZT8KPiA+ID4gVGhp
cyB3YXkgd291bGQgd291bGQgYWxsb3cgYW55dGhpbmcgaW5zaWRlIHRoZSBvcHRpb25hbCAnKCcg
JyknIGJ1dAo+ID4gPiB3b3VsZCBrZWVwIHRoZSB0cmFpbGluZyAnOicuCj4gPiA+Cj4gPiA+IHRv
VGF5Ogo+ID4gPiAgICAgICAgIG10ZHBhcnRzPW5hbWU6cGFydDEscGFydDIKPiA+ID4KPiA+ID4g
U286Cj4gPiA+ICAgICAgICAgbXRkcGFydHM9KDAwMDA6MDA6MWYuNSk6MjUxNjU4MjQoQklPUyks
LShzcXVhc2hmcykKPiA+Cj4gPgo+ID4gSSB0aG91Z2h0IGFib3V0IHRoYXQgJzonIHRvby4gSXQg
ZG9lcyBhZGQgYSBiaXQgbW9yZSB0byB0aGUgY29kZSwgYW5kCj4gPiBhIGJpdCBtb3JlIGluIHRo
ZSB3YXkgb2YgZXJyb3IgY2FzZXMuIEkgYWx3YXlzIHdvcnJ5LCB3aGVuIGNvZGUgaXMKPiA+IGdv
aW5nIGludG8gZmxhc2gsCj4gPiBhYm91dCBlcnJvcnMgd2hlcmUgc29tZXRoaW5nIGxvb2tzIGNs
b3NlIHRvIHJpZ2h0IGJ1dCBpcyB3cm9uZy4gKHNheXMKPiA+IHRoZSBwZXJzb24gd2hvIGp1c3Qg
dHlwZWQgaXQgaW5zdGVhZCBvZiBpcyBhIGZldyB0aW1lcyA6LSkKPiA+Cj4gPiBXaGF0IGlmIHdl
IGRpZCB0aGlzOgo+ID4gbXRkcGFydHM9WzAwMDA6MDA6MWYuNV0yNTE2NTgyNChCSU9TKSwtKHNx
dWFzaGZzKQo+ID4KPiA+IElzIHRoZSAiXSIgJ2Vub3VnaCBkaWZmZXJlbnQnIHRoYXQgd2UgZG8g
bm90IG5lZWQgdGhlICc6Jz8KPiA+Cj4gPiBJIGtpbmQgb2YgbGlrZSB0aGUgW10gYmV0dGVyIGFu
eXdheSBhcyBpdCBtYWtlcyB0aGUgbXRkaWQgc3RhbmQgb3V0IGEKPiA+IGJpdCBtb3JlIGZyb20g
dGhlIHBhcnQgbmFtZXM/IEJ1dCBpcyBpdCBlbm91Z2ggdGhhdCB3ZSBkb24ndCBuZWVkIHRoZQo+
ID4gJzonPyBXb3VsZCB5b3Ugc3RpbGwgcHJlZmVyIHRoZSAoKSBhcyBvcHBvc2VkIHRvIHRoZSBb
XT8KPgo+IEkgbGlrZSB0aGUgW10gYXMgd2VsbCwgbWF5YmUgbW9yZSB0aGFuICgpIGJlY2F1c2Ug
YXQgbGVhc3QgaXQgZG9lcyBub3QKPiBjb25mbGljdCB3aXRoIHRoZSBwYXJ0aXRpb24gbmFtZXMu
IEJ1dCBJIHJlYWxseSBwcmVmZXIga2VlcGluZyB0aGUgOiBpZgo+IHRoZSBjb2RlIGlzIHN0aWxs
IHJlYWRhYmxlLgo+Cj4gSXQgaXMgbXVjaCBlYXNpZXIgdG8gZXhwbGFpbiB0byBwZW9wbGUgOiAi
aWYgeW91IGhhdmUgYSA6IGluIHRoZSBuYW1lLAo+IGVuY2xvc2UgaXQgd2l0aCBbXSIuCj4KPiBU
aGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
