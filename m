Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28914D3F069
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Jan 2026 14:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ciNuDzxB73tN/RmZfGbxE92mtgCd2PwZGL3u2w5GHCg=; b=B5wetOZJKigc+H
	KbnMbvuP7eQZmUCFiOdCQdEIF48afpevyeqZ8UtSJs/O5cVmU3lMx3BSmR0aA0y+iZuSQ7kO+Rrkr
	iFELKhWX/p0atBJ8WkDPjSkkB0zYzoIoZp9A857ZGMbVYF9L7YDjI3V9XztlhvCSrw+V5wFgFrpaf
	JJaawIgMslOda/jUnoUnTvJTJwhyCaXyOFg+Ei6H4idYkYL6GOev3mebMiAisCpx0NJ4smhgPvBGU
	GAiDnLyiajgdcZpqAEUugRkE50703vj+u3s6bU5b2+Ss6bvxUgHBLING+4twnjDhAofS2zWxm51aA
	7gxcuR1Sjzo3v3Jz61og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6J7-0000000G9Jf-1KEg;
	Wed, 28 Jan 2026 14:14:09 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6J4-0000000G9J9-337P
	for linux-mtd@lists.infradead.org;
	Wed, 28 Jan 2026 14:14:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B876BC211E7;
	Wed, 28 Jan 2026 14:14:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 321D66071F;
	Wed, 28 Jan 2026 14:14:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8013B119A8801;
	Wed, 28 Jan 2026 15:13:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769609643; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ws3luuLYkZ0uOhioCUNbEqgIzoIgh5ljL8mxNOKgJ6I=;
	b=QonMFsWePHktG/indanJbrSHvacEEguYH9qqLfq/orHpuE+tRTtn1vVoKSRb7nPlozZVCI
	A9RVFvKDIa/qN5ghBArp2AVlZgGcHaOpzjlhhWWY94Ag9JqUp7fDFsncVlcqrhmemBb5eR
	wqq87/35VntFmdWiq25QR47ZbWJqcQOB9bJNTCMWipeLgTXST0bTXTdDE3B6gUYZQxdcyK
	lrkcXsTJPo8JyKEVNniSosJ3mfs+LP87LKx7lP/PH8lcqqHlnyq4RCV2Tojl7sa9ulFeXa
	7yaZ9fJe/xrm6XItbCR5bw2O59lgTrAzqqYS0043jcdg8B59jOA1pdvkrid2Gw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Junhao Xie <bigfoot@radxa.com>,  Bjorn Andersson <andersson@kernel.org>,
  Konrad Dybcio <konradybcio@kernel.org>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-arm-msm@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  Xilin Wu <sophon@radxa.com>
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
In-Reply-To: <d0652707-c983-4deb-981c-b1584168e330@oss.qualcomm.com> (Konrad
	Dybcio's message of "Wed, 28 Jan 2026 14:26:23 +0100")
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
	<d0652707-c983-4deb-981c-b1584168e330@oss.qualcomm.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 28 Jan 2026 15:13:59 +0100
Message-ID: <875x8ln7tk.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_061406_956130_ACD43C5D 
X-CRM114-Status: UNSURE (   9.65  )
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

SGVsbG8sCgo+PiBKdW5oYW8gWGllICgyKToKPj4gICAgICAgZmlybXdhcmU6IHFjb206IHNjbTog
QWRkIFNDTSBzdG9yYWdlIGludGVyZmFjZSBzdXBwb3J0Cj4+ICAgICAgIG10ZDogZGV2aWNlczog
QWRkIFF1YWxjb21tIFNDTSBzdG9yYWdlIGRyaXZlcgo+PiAKPj4gIGRyaXZlcnMvZmlybXdhcmUv
cWNvbS9xY29tX3NjbS5jICAgICAgIHwgMTYxICsrKysrKysrKysrKysrKysrKysrCj4+ICBkcml2
ZXJzL2Zpcm13YXJlL3Fjb20vcWNvbV9zY20uaCAgICAgICB8ICAgMyArCj4+ICBkcml2ZXJzL210
ZC9kZXZpY2VzL0tjb25maWcgICAgICAgICAgICB8ICAxNyArKysKPj4gIGRyaXZlcnMvbXRkL2Rl
dmljZXMvTWFrZWZpbGUgICAgICAgICAgIHwgICAxICsKPj4gIGRyaXZlcnMvbXRkL2RldmljZXMv
cWNvbV9zY21fc3RvcmFnZS5jIHwgMjY1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+PiAgaW5jbHVkZS9saW51eC9maXJtd2FyZS9xY29tL3Fjb21fc2NtLmggfCAgMzQgKysrKysK
Pj4gIDYgZmlsZXMgY2hhbmdlZCwgNDgxIGluc2VydGlvbnMoKykKPj4gLS0tCj4+IGJhc2UtY29t
bWl0OiA2MzgwNGZlZDE0OWE2NzUwZmZkMjg2MTBjNWMxYzk4Y2NlNmJkMzc3Cj4KPiBUaGlzIGlz
IDYuMTktcmM3LCBwbGVhc2UgcmViYXNlIG9uIGxpbnV4LW5leHQvbWFzdGVyICh0aGUgc2VyaWVz
Cj4gZG9lc24ndCBjdXJyZW50bHkgYXBwbHkgYmVjYXVzZSB0aGlzIGJhc2UgaXMgZXNzZW50aWFs
bHkgYSBmdWxsIHJlbGVhc2UKPiBiZWhpbmQpCgpJZiBJIG1heSwgSSBldmVuIHNraXBwZWQgdGhl
IG1haWwgZW50aXJlbHkgYmVjYXVzZSBpdCB3YXMgbm90IGFib3V0IG10ZAppbiB0aGUgZW5kLiBU
aGVyZSBpcyBhIHNpbmdsZSBiaWcgcGF0Y2ggbGFiZWxsZWQgImZpcm13YXJlOiBxY29tOiIuIEkK
YmVsaWV2ZSB0aGUgc2VyaWVzIHdvdWxkIGJldHRlciBiZSBzcGxpdCBpbiBzbWFsbGVyIGNodW5r
cy4gVHlwaWNhbGx5Cm9uZSBmb3IgdGhlIHN0b3JhZ2Ugc3VwcG9ydCBhbmQgYW5vdGhlciBvbmUg
Zm9yIHRoZSBmaXJtd2FyZSBwYXJ0LCBhdApsZWFzdC4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
