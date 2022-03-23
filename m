Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF3DC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Mar 2022 17:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAgpdOzzDtwSAExU4eK2+JlplIh0djF3+szZSh60eZI=; b=xs3Ri7MVvyfyXt
	qKbjc5u1BUgzqYtj7Gt+Pk/0PGW3umo6aWzlYcP+5MBLiZngUEC+VTWLSlo1X5n9kWcPUUK8vonvh
	QUpAttE9W1Xb21gdmodQB+oE2vKDia6KtKCdDsRzLtY5qBP6ZZ4UMHZD1fhKrvQ2MBdkC5VfNgXIN
	OW4Y97WdQarGo1hqZfR3OW5u9gSgVq3IRcDShM3io11n8U8/V+quDDL/bTnbElbyCV7t+3AvPVW45
	jDKOBViMiJgSZW9R3gy7fu+ZoQBUPCma7QGBrTFLrDGqsE7cOcrA42zeKLpL2DfTeMDFxHcrSimgM
	1GVbFJaFvtA244Sv+KpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX4dC-00EOtC-UV; Wed, 23 Mar 2022 17:18:47 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX4d9-00EOsD-De
 for linux-mtd@lists.infradead.org; Wed, 23 Mar 2022 17:18:44 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 o6-20020a17090a9f8600b001c6562049d9so2473904pjp.3
 for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2022 10:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jQLWpmb2yBoXx5CkAqgF3Ybn1bXGBUFp1JgPMI2OO5Y=;
 b=qL5RHQZUCJjK9OwzEG03GNL286tYg07vTRMn2kf3EwBpQbuBhKA2ejFByKmk4+nb+k
 rGulnVd/gq4fhkYd653F8Ls8jjCX4ovUCYnUAHgBOnwWnNpeWXf8d6Of4zgDnSJU9ALz
 E2FMa/mgz3WTqTKm2BmgmU15kLBy7raHpW8MOfCW5L73ycxBi046Jrz9CDJ21J4G1gsl
 2URrhRz+fp4F2rjOKzCNbFYhsJOxdCQSCyaBCJYTFFtBRsdhW/PPn9Ue09Eoj17ktSmZ
 fW5giXVcXAhnYLE+JrrIgrPhkE+tViMvVbXKxKRmwcQb2s6rJZbzeF26U9E25caio4vX
 t/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jQLWpmb2yBoXx5CkAqgF3Ybn1bXGBUFp1JgPMI2OO5Y=;
 b=m6DHqXt+wDpzWnqMbA25T+j4Rcqwa46mr5rTgRQmFYpoGVEDlPJOqegb87w6UtMVOf
 LMB8D/zx4Xd1bTYjO5ks8oaL27HqhGq5VFJlMoJZEBviqiLcZc2kbF0lsHOCEz5EOb3h
 wwGpbzv4Nd+BSW1Xf51/jVM5HRVgy9wEdel1J+W08rDeeXtpFcKKwDYGHDhVZMRVzimW
 FYwgbzH7k9ojlpU7svMlAq6FMvVuSreOKKQEHXVvA57j/eI8c0EGxYOggMaZwYYpuegx
 tbWWzfM9YkPB9wNyCWdvon72jKhp75lUZxNtgq2/Ij829gB8/nNVWBnOT8eFDD0+SALp
 +4fw==
X-Gm-Message-State: AOAM53095RAYKBsytD6PrLjZtuRcc6qjOZDz+ScI2CVSTwWJJV5SQL80
 OT/vC19cNz9ctYuHSqMhEEc=
X-Google-Smtp-Source: ABdhPJx8Sn5oQkd9PRPgNXW3Zb2MZz+9uaKgkMnV9CcrXNU0H9LOV6HrEub11QwzqoKdBIoy0i8Jqg==
X-Received: by 2002:a17:902:d482:b0:154:6f46:a602 with SMTP id
 c2-20020a170902d48200b001546f46a602mr988992plg.155.1648055921268; 
 Wed, 23 Mar 2022 10:18:41 -0700 (PDT)
Received: from ?IPV6:240b:10:2720:5500:98c:eff5:b721:5f7b?
 ([240b:10:2720:5500:98c:eff5:b721:5f7b])
 by smtp.gmail.com with ESMTPSA id
 bh3-20020a056a02020300b00378b62df320sm335532pgb.73.2022.03.23.10.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 10:18:40 -0700 (PDT)
Message-ID: <9fd54dbc-a4a9-9aac-3f8f-d0443da6c162@gmail.com>
Date: Thu, 24 Mar 2022 02:18:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 3/3] mtd: cfi_cmdset_0002: Rename chip_ready variables
 and add ID definition
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20220322234952.25520-1-ikegami.t@gmail.com>
 <20220323090257.298130d3@xps13>
 <48459921-b3a4-a399-3a8a-86bd2695a601@gmail.com>
 <20220323175345.619ba991@xps13>
From: Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <20220323175345.619ba991@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_101843_487723_6D6D5C78 
X-CRM114-Status: GOOD (  21.86  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLXNhbiwKCk9uIDIwMjIvMDMvMjQgMTo1MywgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBIaSBUb2t1bm9yaSwKPgo+IGlrZWdhbWkudEBnbWFpbC5jb20gd3JvdGUgb24gVGh1LCAyNCBN
YXIgMjAyMiAwMTo0NjowMCArMDkwMDoKPgo+PiBIaSBNaXF1ZWwtc2FuLAo+Pgo+PiBPbiAyMDIy
LzAzLzIzIDE3OjAyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+Pj4gSGkgVG9rdW5vcmksCj4+Pgo+
Pj4gaWtlZ2FtaS50QGdtYWlsLmNvbSB3cm90ZSBvbiBXZWQsIDIzIE1hciAyMDIyIDA4OjQ5OjUy
ICswOTAwOgo+Pj4gICAKPj4+PiBUaGUgZGVmaW5pdGlvbiBpcyBmb3IgdGhlIFMyOUdMMDY0TiBt
b2RlbCBudW1iZXIgMDEsIDAyLCBWMSBhbmQgVjIuCj4+PiBQbGVhc2Uga2VlcCByZXNlbmRpbmcg
dGhlIGVudGlyZSBzZXJpZXMuCj4+IEkgc2VlLiAoSW4gdGhlIHBhc3QgaXQgd2FzIG1lbnRpb25l
ZCBhcyBub3QgbmVjZXNzYXJ5IHRvIHNlbmQgYWxsIHBhdGNoZXMgaWYgYSBwYXRjaCBmaXhlZCBv
ZiBzZXJpZXMuKQo+IEdlbmVyYWxseSBzcGVha2luZywgd2hpbGUgeW91IGhhdmUgbm90IGJlZW4g
bm90aWZpZWQgdGhhdCBhIHBhdGNoIGdvdAo+IGFwcGxpZWQsIGl0J3MgYmVzdCB0byByZXNlbmQg
aXQgYXMgcGFydCBvZiB5b3VyIHNlcmllcy4KVGhhbmtzIGZvciB5b3VyIGFkdmljZS4gSSBzZWUg
YW5kIHVuZGVyc3Rvb2QgYXMgaXQgc2VlbXMgdGhhdCBpdCB3YXMgCm9rYXkgaWYgSSByZXNlbnQg
YXMgdGhlIHZlcnNpb24gNSAzLzMgcGF0Y2ggYnV0IG5vdCB2ZXJzaW9uIDYgMy8zIHBhdGNoLgo+
Cj4+PiAgIAo+Pj4+IFNpZ25lZC1vZmYtYnk6IFRva3Vub3JpIElrZWdhbWkgPGlrZWdhbWkudEBn
bWFpbC5jb20+Cj4+Pj4gQ2M6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+Cj4+Pj4gQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4+Pj4gQ2M6
IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KPj4+PiBDYzogbGludXgtbXRk
QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+IFlvdSBkb24ndCBuZWVkIGFsbCB0aGVzZSBDYyB0aGVy
ZSwganVzdCBhZGQgdGhlbSB3aGVuIHNlbmRpbmcKPj4+IGV2ZXJ5dGhpbmcgd2l0aCBnaXQtZm9y
bWF0LXBhdGNoLiBJIGJlbGlldmUgeW91IGNhbiB1c2UgdGhlc2UgZmllbGRzCj4+PiBqdXN0IGZv
ciAiZXh0cmEiIHBlb3BsZSB3aGljaCBhcmUgbm90IG5vdGFibHkgZXhwZWN0ZWQuCj4+IFdpbGwg
ZG8gYXMgc28uIEJ5IHRoZSB3YXkgaXQgd2FzIGNvbW1lbnRlZCBvbiB0aGUgdmVyc2lvbiAxIHBh
dGNoIGJ5IFZpZ25lc2gtc2FuIGFzIGJlbG93IHNvIGFkZGVkIENDIG1haW50YWluZXJzIGJ5IHZl
cnNpb24gMiBwYXRjaC4KPj4gICDCoD4gUGxlYXNlIENDIG1haW50YWluZXJzIGZyb20KPj4gICDC
oD4KPj4gICDCoD4gLi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIC1mIGRyaXZlcnMvbXRkL2No
aXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4+ICAgwqA+Cj4+ICAgwqA+IEVsc2UsIHBhdGNoIHdvdWxk
IG5vdCBnZXQgYXR0ZW50aW9uIGluIHRpbWUuCj4gQW5kIFZpZ25lc2ggaXMgcmlnaHQuIFlvdSBz
aG91bGQgQ2MgdGhlIG1haW50YWluZXJzLCBidXQgeW91IGNhbiBkbwo+IHRoYXQgYnkgdXNpbmcg
Z2l0LXNlbmQtZW1haWwgLS1jYyBmb28gLS1jYyBiYXIuIEFkZGluZyBDYzogbGluZXMgd2l0aAo+
IGFsbCB0aGUgbWFpbnRhaW5lcnMgaW4gdGhlIHBhdGNoIGRvZXMgbm90IHJlYWxseSBoZWxwIGFu
ZCBqdXN0IGdyb3dzCj4gdGhlIGNvbW1pdCBsb2cgZm9yIG5vIHJlYXNvbi4KClllcyBhZ3JlZWQg
d2l0aCB0aGlzLgoKUmVnYXJkcywKSWtlZ2FtaQoKPgo+Cj4KPiBUaGFua3MsCj4gTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
