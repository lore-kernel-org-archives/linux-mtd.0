Return-Path: <SRS0=g52K=I3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE6BC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:54:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C44E61934
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C44E61934
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lRmXgzj6CnETNWHUqP7VxNtg3VVISGSAFZ7i7L9SlHc=; b=S13qEpwUuEgOJ86KnXAhDfEoe
	DoYu35fEAJzeqe1z9bagkFW6RbvBZ2P4ehz6jeJKu3K04MusSUqcznoYrBg9M0r6FL0jVDkaM6nHh
	WcH+zvY4HwZXOYZuKOjmG2F8pUwg+1ujlhjnVfCkKvxNehJlQZfEFmyk9izIaawDGYf9bIIFoQVZI
	zr4JS7IRnT0ow6y9dmkVqY6AGjrdHLDoYQQos4r84358IBGu4Qj9TDwW7rzF5w1l0rMUXQTEi31IO
	rUqBT1EtA2ND6BHF/285I5DlEYyul1A+K+D1o0Ts1a4NInqRnQ/HyB0uJiC7vfUQjMdoTWcegch69
	W/mSYHi+A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQw4c-000wqO-8S; Mon, 29 Mar 2021 17:53:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQoxb-000ZfS-Ij
 for linux-mtd@desiato.infradead.org; Mon, 29 Mar 2021 10:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=gapkEp95iL56ACGqeO1uGGhDq0uNOK5vzHbGgocST54=; b=F0sCmga7N0H70rfE7FmygbK2EZ
 9jqZspkEd+gmWHqe2KLMmIJ3Yxe2sBx0RUcX3Ix+9spnH5jrhB+cOg7FJd9k12A+VxT9YQSljEyWB
 1nHLSOX/Nv+LlkokVCA+ij8+ZPoa2tfqeSg7klJpXpDRrLzvM4tIh/TwaYVQeqlQdjkL55L0GQcP6
 NBST9ITgYvjFHSRJ0oNEu6hrd2i79GLQ8c0GmTmSkqbgoBsWBBG3hnbr6JuOVlogDtnFkyfeOv9Y3
 swdbdvwuBU1v3gAVD+uGF6/jdvEuq8olSjJ/RYHcph5U+foy3r9PmMPz58aYb4OOxT0C6EETkb5It
 V+ekGWpA==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQZDY-000Kgw-Mh
 for linux-mtd@lists.infradead.org; Sun, 28 Mar 2021 17:29:00 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D54C9240007;
 Sun, 28 Mar 2021 17:28:28 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ansuel Smith <ansuelsmth@gmail.com>,
 =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] mtd: core: add nvmem-cells compatible to parse mtd
 as nvmem cells
Date: Sun, 28 Mar 2021 19:28:28 +0200
Message-Id: <20210328172828.10003-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210312062830.20548-1-ansuelsmth@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'658c4448bbbf02a143abf1b89d09a3337ebd3ba6'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_182856_158237_EDD43EB9 
X-CRM114-Status: UNSURE (   7.34  )
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

T24gRnJpLCAyMDIxLTAzLTEyIGF0IDA2OjI4OjE5IFVUQywgQW5zdWVsIFNtaXRoIHdyb3RlOgo+
IFBhcnRpdGlvbnMgdGhhdCBjb250YWlucyB0aGUgbnZtZW0tY2VsbHMgY29tcGF0aWJsZSB3aWxs
IHJlZ2lzdGVyCj4gdGhlaXIgZGlyZWN0IHN1Ym9ub2RlcyBhcyBudm1lbSBjZWxscyBhbmQgdGhl
IG5vZGUgd2lsbCBiZSB0cmVhdGVkIGFzIGEKPiBudm1lbSBwcm92aWRlci4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBBbnN1ZWwgU21pdGggPGFuc3VlbHNtdGhAZ21haWwuY29tPgo+IFRlc3RlZC1ieTog
UmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKQXBwbGllZCB0byBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG10ZC9u
ZXh0LCB0aGFua3MuCgpNaXF1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
