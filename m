Return-Path: <SRS0=hsQV=GV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B642C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jan 2021 11:08:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 350D2221F8
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jan 2021 11:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 350D2221F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LaxU3EhtEoAIIXII4vArz8+5EXlQuEX3YDGB5RjU+Sw=; b=iXnO00H71kLpxc1XhKZb0gtjD
	qL4DKQPzDBcRqm887oaiwkbAZtpbYg7hogc62ePunjgT6mg/CdHp8xDaUePoyHKCzduO7c2ztgTnX
	65Aeou/W9L/xWlYZs5ZvHQEOWpA7NUw4Ps49efA4b9EHu2vhncBtMXseVdrfBBOtLgdo0j3yLAhmQ
	ToJWag2KXYDUb7YBYcEHCaOB3PjzyBNVGpKbq/fJZgKDkWZe8t8quu9K4ts5MGE8kkBT4R4XYGTbU
	t7GvydUfK8JsEny5YXMiB3RqY1vt8csHkJ4MAwWSM8m84Rs7Hqz3s82ge/f8txOKlBSvZBbnQ/vpY
	HfJmfIlMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1SNM-00036O-Sc; Mon, 18 Jan 2021 11:07:12 +0000
Received: from first.geanix.com ([116.203.34.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1SNJ-00035k-GI
 for linux-mtd@lists.infradead.org; Mon, 18 Jan 2021 11:07:11 +0000
Received: from [IPv6:2a06:4004:10df:1:da27:a6d2:5305:fd0a] (_gateway
 [172.21.0.1])
 by first.geanix.com (Postfix) with ESMTPSA id 3A4374E4AB0;
 Mon, 18 Jan 2021 11:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1610968022; bh=UTAJNPJuZKiKbfUBeRRbDLiD/CF2iT9OqIJEUKLZjSg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=Tiv7/dTBeoLW2y/Q0CJ2i9yYTSgsUTs05XiBVVAbT0G2YNfJbyQacgZ1tQPHtsopZ
 B9xgQENVDqVlFdlCIv4+BABOgUMvNJvHgrochkOLOUlOZ1z/9prZ/QM2CIjfkKVKZ4
 REgrSogzi3jXycvyU8bumgD+/7+26mt+aB7mFn/0mGkvP74CnHRxcRKrpaxm+yPMVf
 ek1jqNu/9QwTNARD0xUVQoOkMbQrdDSk0O8vVBf05n6aC42aTXo7PlQ72h119/5SvI
 cyOlxC0dKiFQU8+K3obUGjib1ePXAK/m8QxJZqtu6VRBIopV1xUfRTD8UYhq7hMj91
 WTWiCfu1s3fNw==
Subject: Re: [PATCH] mtd: rawnand: gpmi: fix dst bit offset when extracting
 raw payload
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20210104103558.9035-1-miquel.raynal@bootlin.com>
 <7db4b36e-23a6-6075-132c-214d043e78bd@geanix.com>
 <20210104121516.3d50fb58@xps13>
From: Sean Nyekjaer <sean@geanix.com>
Message-ID: <d3ebfc3c-4842-a506-512a-28c6c02f6c42@geanix.com>
Date: Mon, 18 Jan 2021 12:07:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210104121516.3d50fb58@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_060710_495126_8701ABF6 
X-CRM114-Status: GOOD (  13.37  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Han Xu <han.xu@nxp.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAwNC8wMS8yMDIxIDEyLjE1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIFNlYW4sCj4K
PiBTZWFuIE55ZWtqYWVyIDxzZWFuQGdlYW5peC5jb20+IHdyb3RlIG9uIE1vbiwgNCBKYW4gMjAy
MSAxMTo1MDoxMCArMDEwMDoKPgo+PiBPbiAwNC8wMS8yMDIxIDExLjM1LCBNaXF1ZWwgUmF5bmFs
IHdyb3RlOgo+Pj4gT24gTW9uLCAyMDIwLTEyLTIxIGF0IDEwOjAwOjEzIFVUQywgU2VhbiBOeWVr
amFlciB3cm90ZToKPj4+PiBSZS1hZGQgdGhlIG11bHRpcGx5IGJ5IDggdG8gInN0ZXAgKiBlY2Nz
aXplIiB0byBjb3JyZWN0IHRoZSBkZXN0aW5hdGlvbiBiaXQgb2Zmc2V0Cj4+Pj4gd2hlbiBleHRy
YWN0aW5nIHRoZSBkYXRhIHBheWxvYWQgaW4gZ3BtaV9lY2NfcmVhZF9wYWdlX3JhdygpLgo+Pj4+
Cj4+Pj4gRml4ZXM6IGU1ZTU2MzFjYzg4OSAoIm10ZDogcmF3bmFuZDogZ3BtaTogVXNlIG5hbmRf
ZXh0cmFjdF9iaXRzKCkiKQo+Pj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4+Pj4gUmVw
b3J0ZWQtYnk6IE1hcnRpbiBIdW5kZWLDuGxsIDxtYXJ0aW5AZ2Vhbml4LmNvbT4KPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBTZWFuIE55ZWtqYWVyIDxzZWFuQGdlYW5peC5jb20+Cj4+PiBBcHBsaWVkIHRv
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51
eC5naXQgbmFuZC9uZXh0LCB0aGFua3MuCj4+Pgo+Pj4gTWlxdWVsCj4+IEhpIE1pcXVlbAo+Pgo+
PiBXaWxsIHlvdSBwbGVhc2UgcXVldWUgdGhpcyBmb3IgZml4ZXM/IEl0J3MgcXVpdGUgcmVsZXZh
bnQgZm9yIDUuMTAgTFRTIDopCj4gUmlnaHQsIHRoYXQgd2lsbCBiZSBxdWlja2VyIHRvIGhhdmUg
aXQgaW4gTGludXMnIHRyZWUuIEkgbW92ZWQKPiB0aGUgcGF0Y2ggdG8gdGhlIG10ZC9uZXh0IGJy
YW5jaC4KPgpIaSBNaXF1ZWwsCgpBbnkgZ3Vlc3MgdG8gd2hlbiB0aGUgbXRkL2ZpeGVzIGJyYW5j
aCB3aWxsIGJlIHB1bGxlZCBpbnRvIExpbnVzJyB0cmVlPwoKL1NlYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
