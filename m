Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AC1C0219C
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2025 16:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VKiGoUcu1Q0VdvMIEybpZYff/U3R1GSxE0b5AgMJUtE=; b=vgleijj/cchq3X
	6YhMsrje86A6kf3vkLdvOTEbc81Tcq0cAadOH94kwAxTZyaHRbd7yskMahA+fqi3RCdmfcKfg5Lat
	wV4Evq32V5lWPn2YCMv43XSVEQ+6IfeQ1FvDxSiAqIGpYE5FUhhvMItGnXaNeIxpR9wfhi/aMqryd
	YqiM7BZLCfgKTEm7BrTC5xFA6A6NXGRuB9zCtCRSdhwAbLE5jXtTsjXHSuGcPQVsYiJc/ST2nzise
	S+qdeXu3uG3rxhSjbkIiD1sME7+1qFtUk69MBlzQiuLI/21D1cS6Fd9BfgiAkP793mDzj5bhhKX5m
	hn/Ns4tu8QJAQe0m8/ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5Dk-00000006vGL-2OWp;
	Thu, 06 Feb 2025 16:59:20 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5DB-00000006vBE-1uh1
	for linux-mtd@lists.infradead.org;
	Thu, 06 Feb 2025 16:58:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5503344120;
	Thu,  6 Feb 2025 16:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738861119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=54udYs+xLDljQYkiA18WIt8yRAThdRISYzwfpUmkHzc=;
	b=fxc9kl16k6rTWF7UcziTvb6qxwT5lUtLUKvlu/Pof52O9nKR4reeV3MssSEsgsnl43Heg+
	d3i34yM2xytHudcfr6a8Y6mccKiMd3tutoqFGKY0Hj+fNAbDds3BxP/huA9u2MfF4Yw+lx
	DVD8UaFj39pPRXe5FAa3BuVLuuzuHtQVs7/7B+3fR/fgvGkPBvPBYzpoOg7/S+uyN5eHqz
	YD95D/txvilnz8wpEQ6n4dFjk8HCOGxDCnHQ9rdU5eUNJ1s/i4hu4Z15iD9F4VgPMg2Eej
	9Cecr5pXTDt+zJsBnIXKGUphLJTqZYhmfm7SnBIhf6/vDz7Zq6YR2ra/cq0kDw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Edward Adam Davis <eadavis@qq.com>
Cc: syzbot+074732af3fc6c528f8a0@syzkaller.appspotmail.com,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,
  richard@nod.at,  syzkaller-bugs@googlegroups.com,  vigneshr@ti.com
Subject: Re: [PATCH] mtd: capture device name setting failure when adding mtd
In-Reply-To: <tencent_B7365D9CDDA8990DCF8C0DFE25B28DB31207@qq.com> (Edward
	Adam Davis's message of "Sun, 2 Feb 2025 09:31:45 +0800")
References: <679cd60e.050a0220.d7c5a.0045.GAE@google.com>
	<tencent_B7365D9CDDA8990DCF8C0DFE25B28DB31207@qq.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 06 Feb 2025 17:58:37 +0100
Message-ID: <87ikpn57sy.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopegvrggurghvihhssehqqhdrtghomhdprhgtphhtthhopehshiiisghothdotdejgeejfedvrghffehftgeitgehvdekfhekrgdtsehshiiikhgrlhhlvghrrdgrphhpshhpohhtmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggru
 gdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehshiiikhgrlhhlvghrqdgsuhhgshesghhoohhglhgvghhrohhuphhsrdgtohhmpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_085845_947882_6BC244B3 
X-CRM114-Status: UNSURE (   7.91  )
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

SGVsbG8gRWR3YXJkLAoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY29yZS5jIGIvZHJp
dmVycy9tdGQvbXRkY29yZS5jCj4gaW5kZXggNzI0ZjkxN2Y5MWJhLi5hNzFjZDc1ODU4ZTQgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbXRk
Y29yZS5jCj4gQEAgLTc0MSw3ICs3NDEsOCBAQCBpbnQgYWRkX210ZF9kZXZpY2Uoc3RydWN0IG10
ZF9pbmZvICptdGQpCj4gIAltdGQtPmRldi50eXBlID0gJm10ZF9kZXZ0eXBlOwo+ICAJbXRkLT5k
ZXYuY2xhc3MgPSAmbXRkX2NsYXNzOwo+ICAJbXRkLT5kZXYuZGV2dCA9IE1URF9ERVZUKGkpOwo+
IC0JZGV2X3NldF9uYW1lKCZtdGQtPmRldiwgIm10ZCVkIiwgaSk7Cj4gKwlpZiAoZXJyb3IgPSBk
ZXZfc2V0X25hbWUoJm10ZC0+ZGV2LCAibXRkJWQiLCBpKSkKClRoYW5rcyBhIGxvdCBmb3IgdGhl
IGFuYWx5c2UgYW5kIGZvciBmaXhpbmcgdGhpcy4gTWF5IEkgYXNrIGhvd2V2ZXIgdG8KZm9sbG93
IGEgbW9yZSBjb21tb24gcGF0dGVybiBmb3IgZXJyb3IgY2hlY2tpbmcgdGhhdCBpczoKCiAgICAg
ICBlcnJvciA9IGRldl9zZXRfbmFtZSguLi4pOwogICAgICAgaWYgKGVycm9yKQogICAgICAgICAg
ICAgICAgZ290by4uLgoKVGhpcyB3YXkgaXQgaXMgY2xvc2VyIHRvIHRoZSB1c3VhbCBlcnJvciBo
YW5kbGluZyBhbmQgYWxzbyBhbGlnbmVkIHdpdGgKdGhlIHJlc3Qgb2YgdGhlIGZpbGUuCgpPdGhl
cndpc2UgTEdUTS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
