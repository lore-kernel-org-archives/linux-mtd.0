Return-Path: <SRS0=Yjms=OI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB2CC433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Sep 2021 21:28:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11E4C60F45
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Sep 2021 21:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11E4C60F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=3e8.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hQc9l7LFxenj2V7+3oJjQYy3qYQigy0+XYKIC2I6Mic=; b=yTnx+RWY9EMpg+QiNBl6odNpob
	rI84QJX1dLF29K9CSXT7EfQMjGoEMHjVkuEYfr5xKkkpc6DGJ11w9neAJnY2OBOytl3XXiZW+a5Tz
	MWUI0VpAi472i8UxIq5lBE6TudjedKmDReEcVoKXBCu3tNk+Je/d8AQd+fUp1VicIx8wCM8JzwnEW
	eYDmZW8SV5Ut/+Wax95LtZQ0LCGAyP4LJlAloNjlhEfoaZ1uOXLbLETIbluIDB1BdLthyH+Cn1t7u
	4I+IB1sCDJdOIQrXTCgaMkY1OzPSbsV4Tukh68puxqcckDmhtXZFxB4MS8tLnMJnfVhBbFm6Z+pHa
	S/r0PUvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRhra-00GNmI-DU; Sat, 18 Sep 2021 21:27:10 +0000
Received: from srv4.3e8.eu ([2001:67c:12a0:200::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRhrW-00GNlR-8Y
 for linux-mtd@lists.infradead.org; Sat, 18 Sep 2021 21:27:08 +0000
Received: from [IPv6:2003:c6:cf12:5a0:9abc:9583:6f0a:c734]
 (p200300c6cf1205a09abc95836f0ac734.dip0.t-ipconnect.de
 [IPv6:2003:c6:cf12:5a0:9abc:9583:6f0a:c734])
 (using TLSv1.3 with cipher TLS_CHACHA20_POLY1305_SHA256 (256/256 bits))
 (No client certificate requested)
 by srv4.3e8.eu (Postfix) with ESMTPSA id DC4E4600A9;
 Sat, 18 Sep 2021 23:26:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=3e8.eu;
 s=mail20170724; t=1632000412;
 bh=C/aPzaf95uZFHaGAuqSsJ/yKi15mexvt0yMVqlpMCc0=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=aCEWlS9GqO3Zjs5Zm5GbmIGyRXk7bGcFFftlUj+/z2+r7HjfpzrEPg5W3m9O6CI85
 +runf7LnW9zphnEsEY2JfxEee0aPeTTP9eWnI/4zAwGD9kN57g2MoCO0KqaCCfyNH0
 byL6Brvzge3wRPTXeQ0rG9asWgzstoEnsoWujlDWpGV1uZvP37HwCvRf2/zLN7WM5g
 hqjrB1QaTQjb9WZ9oq20EpPYOsfioXCkTknQ86+6yTxpWB8cYg5hfxoE7iutoWkBcD
 EiyRl/0QK/mfa+tzqvoeJimTFxLrVc6gvoLVxR6ahJQyaBFTA/a09/HTEqZh+e5x65
 MF8kl5lbz3WmA==
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Daniel Kestrel <kestrelseventyfour@gmail.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210808072643.GA5084@ubuntu>
 <51f2ebf4-6df1-eba5-99f1-1ec88e475d20@3e8.eu> <20210917190154.76203a9a@xps13>
 <e9dd0653-139f-749b-c088-e756ee2d2132@3e8.eu> <20210917213246.319e60cb@xps13>
From: Jan Hoffmann <jan@3e8.eu>
Subject: Re: [PATCH v2] mtd: rawnand: xway: No hardcoded ECC engine, use
 device tree setting
Message-ID: <14eb0cb7-b0af-87bf-b9a5-3e35eeb43f54@3e8.eu>
Date: Sat, 18 Sep 2021 23:26:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210917213246.319e60cb@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210918_142706_639434_66CF52A7 
X-CRM114-Status: GOOD (  14.85  )
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

SGkgTWlxdcOobCwKCj4gWWVzIHRoaXMgd2FzIG15IHVuZGVyc3RhbmRpbmcsIHRoYXQgb25seSBz
b2Z0d2FyZSBFQ0MgZW5naW5lIHdhcwo+IHN1cHBvcnRlZC4gVGhlIG1haW5saW5lIGRyaXZlciBz
aG93cyBhYnNvbHV0ZWx5IG5vIHNpZ25zIG9mIGhhcmR3YXJlCj4gRUNDIGVuZ2luZSBzdXBwb3J0
Lgo+IAo+IFBlcmhhcHMgaG93ZXZlciB5b3UgbWVhbiB0aGF0IG9uLWRpZSBFQ0MgZW5naW5lIGFy
ZSBub3Qgc3VwcG9ydGVkCj4gYW55bW9yZSBiZWNhdXNlIG9mIHRoZSBlbmdpbmVfdHlwZSBiZWlu
ZyBzZXQgaW4gYXR0YWNoX2NoaXAoKT8KClllcywgdGhpcyBpcyBleGFjdGx5IHRoZSBpc3N1ZS4K
Cj4gSWYgeWVzIHRoZW4gaW5kZWVkIHRoZXJlIGlzIHNvbWV0aGluZyB0byBkbywgcGVyaGFwcyBj
aGVja2luZyBpZiBhbgo+IGVuZ2luZSBoYXMgYmVlbiBhbHJlYWR5IHNldCBpcyBlbm91Z2g/IFlv
dSBjYW4gdHJ5IHNvbWV0aGluZyBsaWtlOgo+IAo+IGlmIChlbmdpbmVfdHlwZSA9PSB1bmtub3du
KQo+IAllbmdpbmVfdHlwZSA9IHNvZnQ7CgpDaGVja2luZyBmb3IgTkFORF9FQ0NfRU5HSU5FX1RZ
UEVfSU5WQUxJRCBkb2Vzbid0IHdvcmssIGFzIHRoZSBlbmdpbmUKdHlwZSBpcyBhbHJlYWR5IHNl
dCB0byBOQU5EX0VDQ19FTkdJTkVfVFlQRV9PTl9IT1NUIGJ5IHJhd25hbmRfZHRfaW5pdC4KVGhl
IGNvZGUgdGhlcmUgc2VlbXMgdG8gZXhwZWN0IHRoYXQgY2hpcC0+ZWNjLmVuZ2luZV90eXBlIGNv
bnRhaW5zIHRoZQpkZWZhdWx0IHZhbHVlLCB3aGljaCBpcyBubyBsb25nZXIgdGhlIGNhc2UgYWZ0
ZXIgY29tbWl0IDUyNTkxNGI1YmQ4CigibXRkOiByYXduYW5kOiB4d2F5OiBNb3ZlIHRoZSBFQ0Mg
aW5pdGlhbGl6YXRpb24gdG8gLT5hdHRhY2hfY2hpcCgpIikuCgpUaGUgZm9sbG93aW5nIGluIGF0
dGFjaF9jaGlwIHdvcmtzOgoKaWYgKGNoaXAtPmVjYy5lbmdpbmVfdHlwZSA9PSBOQU5EX0VDQ19F
TkdJTkVfVFlQRV9PTl9IT1NUKQoJY2hpcC0+ZWNjLmVuZ2luZV90eXBlID0gTkFORF9FQ0NfRU5H
SU5FX1RZUEVfU09GVDsKCkhvd2V2ZXIsIHRoaXMgd2lsbCBhbHNvIHNpbGVudGx5IHVzZSB0aGUg
c29mdHdhcmUgRUNDIGVuZ2luZSBpZiBhbnlvbmUKYWN0dWFsbHkgY29uZmlndXJlcyB0aGUgb24t
aG9zdCBoYXJkd2FyZSBFQ0MgZW5naW5lIGluIHRoZSBkZXZpY2UgdHJlZQood2hpY2ggaXMgb2Yg
Y291cnNlIHVuc3VwcG9ydGVkIGZvciB4d2F5KS4KClRoYW5rcywKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
