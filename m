Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B82C46CD8
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Dec 2023 11:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ggOCbpmFoyDNORIvy6Tr+vWLpHyqHeHIMbiZB4FP9xw=; b=GJkJUpmaJdClrM
	6BYhgzs2oQvhJ5NZSoYJrFoLf6zqM2vz/1bpE2JpaAhZTVtt3hvbtU+QMYIWQBTnX+9zz6Uhvmkc2
	yE1PENy0N0TSSYpOqCfXvNIY+pPbwZNbsRn7BfAloTbFNY25CGrgEhMOUTvvpvg6MoFB7cIT+hymf
	I8NBkzxGQd8lOgbKQuM5Y+oZIv21L4bYhNU/tuPJnt0ecY54wF9DQx5stSCVf8RANX+qagN/5fSgT
	Eda8Pi3bfAryFmJh0f78Jb5gD2fhxXj0bbOApJcIl91Lju5xodPXQISstDDuaKEpr3Y63RsHPa9rq
	0rO6qTE9BG3MXp7S0fow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdqn-005i88-23;
	Fri, 22 Dec 2023 11:37:57 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdqk-005i3V-23
	for linux-mtd@lists.infradead.org;
	Fri, 22 Dec 2023 11:37:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E05C24000E;
	Fri, 22 Dec 2023 11:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703245070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R01f3eF8gHCc+LoT7UClRI30ZMja+F3GQI6BRyQW3Ls=;
	b=jxrIlGbGTjp3Ch+a5Ur88yZMX6EBC+5Il34mJCCpHjHWn7Bjsjp/JCs+3ATRdiJ9apbbB4
	rRa9kpUx6rWeyKlMb55NDrMkjXDF61BbXjV2c+F05u57F83KJwhkT2xxsCg/xDPMeOeQ86
	Xmhru/gAg/5oJx4Z8pukrRoecCM/qvEEZxiMTUhgZGNAwEHZH/mNzlFVaY5M1S397r6K9n
	kToiR+NPGy+HAcR8J6H7be2qay3RG5dXAUFRfAo3nSRu3rpghUQRfE9enJhGBbUuzpQOTi
	tP4906qHt+nhjxOeGYyaJWLlbze0Yp471LmSafSjf1+THk5nhVfzrj04cLpxpQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	eagle.alexander923@gmail.com,
	mans@mansr.com,
	martin@geanix.com,
	=?utf-8?q?Sean_Nyekj=C3=A6r?= <sean@geanix.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/4] mtd: rawnand: Fix core interference with sequential reads
Date: Fri, 22 Dec 2023 12:37:45 +0100
Message-Id: <20231222113745.786779-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215123208.516590-3-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e576b41164bed85aa249ddfd3632c2efd42340b6'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_033754_814441_11F25479 
X-CRM114-Status: GOOD (  15.41  )
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

T24gRnJpLCAyMDIzLTEyLTE1IGF0IDEyOjMyOjA2IFVUQywgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBBIGNvdXBsZSBvZiByZXBvcnRzIHBvaW50ZWQgYXQgc29tZSBzdHJhbmdlIGZhaWx1cmVzIGhh
cHBlbmluZyBhIGJpdAo+IHJhbmRvbWx5IHNpbmNlIHRoZSBpbnRyb2R1Y3Rpb24gb2Ygc2VxdWVu
dGlhbCBwYWdlIHJlYWRzIHN1cHBvcnQuIEFmdGVyCj4gaW52ZXN0aWdhdGlvbiBpdCB0dXJuZWQg
b3V0IHRoZSBtb3N0IGxpa2VseSByZWFzb24gZm9yIHRoZXNlIGlzc3VlcyB3YXMKPiB0aGUgZmFj
dCB0aGF0IHNvbWV0aW1lcyBhIChsb25nZXIpIHJlYWQgbWlnaHQgaGFwcGVuLCBzdGFydGluZyBh
dCB0aGUKPiBzYW1lIHBhZ2UgdGhhdCB3YXMgcmVhZCBwcmV2aW91c2x5LiBUaGlzIGlzIG9wdGlt
aXplZCBieSB0aGUgcmF3IE5BTkQKPiBjb3JlLCBieSBub3Qgc2VuZGluZyB0aGUgUkVBRF9QQUdF
IGNvbW1hbmQgdG8gdGhlIE5BTkQgZGV2aWNlIGFuZCBqdXN0Cj4gcmVhZGluZyBvdXQgdGhlIGRh
dGEgaW4gYSBsb2NhbCBjYWNoZS4gV2hlbiB0aGlzIHBhZ2UgaXMgYWxzbyBmbGFnZ2VkIGFzCj4g
YmVpbmcgdGhlIHN0YXJ0aW5nIHBvaW50IGZvciBhIHNlcXVlbnRpYWwgcmVhZCwgaXQgbWVhbnMg
dGhlIHBhZ2UgcmlnaHQKPiBuZXh0IHdpbGwgYmUgYWNjZXNzZWQgd2l0aG91dCB0aGUgcmlnaHQg
aW5zdHJ1Y3Rpb25zLiBUaGUgTkFORCBjaGlwIHdpbGwKPiBiZSBjb25mdXNlZCBhbmQgd2lsbCBu
b3Qgb3V0cHV0IGNvcnJlY3QgZGF0YS4gSW4gb3JkZXIgdG8gYXZvaWQgc3VjaAo+IHNpdHVhdGlv
biBmcm9tIGhhcHBlbmluZyBhbnltb3JlLCB3ZSBjYW4gaG93ZXZlciBoYW5kbGUgdGhpcyBjYXNl
IHdpdGggYQo+IGJpdCBvZiBhZGRpdGlvbmFsIGxvZ2ljLCB0byBwb3N0cG9uZSB0aGUgaW5pdGlh
bGl6YXRpb24gb2YgdGhlIHJlYWQKPiBzZXF1ZW5jZSBieSBvbmUgcGFnZS4KPiAKPiBSZXBvcnRl
ZC1ieTogQWxleGFuZGVyIFNoaXlhbiA8ZWFnbGUuYWxleGFuZGVyOTIzQGdtYWlsLmNvbT4KPiBD
bG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC9DQVAxdE52Uz1OVkFtLXZm
dllXYmMzazlDeDlZeE1jMnVaWmttWGs4aDFOaEdYODc3WmdAbWFpbC5nbWFpbC5jb20vCj4gUmVw
b3J0ZWQtYnk6IE3DpW5zIFJ1bGxnw6VyZCA8bWFuc0BtYW5zci5jb20+Cj4gQ2xvc2VzOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQveXcxeGZzNmo0azZxLmZzZkBtYW5zci5jb20v
Cj4gUmVwb3J0ZWQtYnk6IE1hcnRpbiBIdW5kZWLDuGxsIDxtYXJ0aW5AZ2Vhbml4LmNvbT4KPiBD
bG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC85ZDBjNDJmY2RlNzliZmVk
ZmU1YjA1ZDZhNGU5ZmRlZjcxZDNkZDUyLmNhbWVsQGdlYW5peC5jb20vCj4gRml4ZXM6IDAwM2Zl
NGI5NTQ1YiAoIm10ZDogcmF3bmFuZDogU3VwcG9ydCBmb3Igc2VxdWVudGlhbCBjYWNoZSByZWFk
cyIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwg
UmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKQXBwbGllZCB0byBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG10ZC9u
ZXh0LgoKTWlxdWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
