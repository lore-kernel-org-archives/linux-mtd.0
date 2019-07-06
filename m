Return-Path: <SRS0=tQsQ=VD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A02CC0650E
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Jul 2019 20:54:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CC9720838
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Jul 2019 20:54:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V6QED+IU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRi7KWnT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CC9720838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwOP/y66AoTsKBThcUbVNUp52iNRbrThkCvXHHBUIv8=; b=V6QED+IUUjqmbz
	y4suGOcWQQHTNeRMQS93E3zAfnemekZoM63bfy0By8w2EOktWXLsrTc7G6ty9qky6cEq0R+niN0/c
	lFCUM04PdwyM+/MGmUtxfQ23qz14kD8HdqLOz41BMHVxKdSdZnGtd+lkZhVDFr38UgBBDYmfHb5Sq
	HcSOpSXb6toj+hby1phee0rmON1+EUk2qML/OesqslHDgG/LIenzA1I6mMVYuZlnZYeUfmWXA2A3C
	tKZ04eaHiM+mc54Z2Rv0atR0jX+8xjOsD9r7R8iNn9BXsE0wRD5AfRLuxl7F6f6kWoOft38RAy07M
	dTxqMNBjs5eYgqU9B7Ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hjrgd-0006Ds-QY; Sat, 06 Jul 2019 20:53:35 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjrga-0006DL-Li
 for linux-mtd@lists.infradead.org; Sat, 06 Jul 2019 20:53:34 +0000
Received: by mail-wr1-x441.google.com with SMTP id z1so8485982wru.13
 for <linux-mtd@lists.infradead.org>; Sat, 06 Jul 2019 13:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eZxx6Pxsrk0X5EPCBTh5hNaOTsYWBXI1kx0Fs4oLurU=;
 b=jRi7KWnT/yGplKFMITKucJlqi2sTyxn2tTIfmJet6FtunfICdtKFtnujXb16cm7g0c
 MEqXczpN7RKCV94UBnV3LZqhWORYFzsurg4p6LiPMusczjFGLtBXPLf3GUxP44/LFPtk
 L7CNGHKA9u9H2xZh+FNpNXm74Wr5ufgZ5aQcCIUzGS9VpYH+05iBlEdTN3ujDHLYgTRA
 Ee6hM7KH3QH6Q1/ptR45uD83cq/tZOV/1gQr4FxfW1U9qM8jLNm3/PYr8vi4WmKl9EqV
 7TSDr5BpMN1cpGR4+D7nhkC3cSSb35QUKh5bU/uMds8WpaVLyAv89JDQ3n2BnPEgUAqu
 HKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eZxx6Pxsrk0X5EPCBTh5hNaOTsYWBXI1kx0Fs4oLurU=;
 b=YSXWcxNKKpaIaV0XMmOMSRxhPL5O5cS9GAViYX6NnMCqdCmKL2lNBpYLLliDix6YXx
 PuygVK5FtP1FcwTKbetnxJ5QSxPpTJpkvS1g6iTmO67UR0HMEFPb3qHyLyes3RE18DkY
 FtB6HyDMhIxlVfju0XmH4rFK22iAVscP4Eqv67/7W7Li70jIHeiv0rMyKEgYcUtaJjq+
 FosCWEpglgocvf6xOehYDiGHqOqG36NQxjN1QfajsHcEwgpRtp63yp6zqHcY8J/CXjvh
 s4pE299+c6ZlOP2J8RthYd3vI6yNVhIhQyASw2yaEbIxj/YhUEPQkjgjb3kpVviOKuFW
 8zTA==
X-Gm-Message-State: APjAAAWOqyfRxZPxQSIXXeRWlpCOnkZAmt5t8DNcF67AQqLy6NV1pRo9
 6Z72eROe3wbFUgzF7Ae0C6+G9KxLWdNxKcHWXZ0=
X-Google-Smtp-Source: APXvYqwr9goCyH9H6PbiB2qbwebE+ooDF9skGo2eHZ9KTl2ausMTsqGIdd9R3HG6GE64LIj6UxF0yRVklQdartryqB4=
X-Received: by 2002:a5d:514f:: with SMTP id u15mr1055932wrt.183.1562446408682; 
 Sat, 06 Jul 2019 13:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190705235649.72b513b1@xps13>
In-Reply-To: <20190705235649.72b513b1@xps13>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 6 Jul 2019 22:53:17 +0200
Message-ID: <CAFLxGvwbwRqq1jfzJ2ut=cGOaEWHsODJAh_06Pu8AHBt8jnaXA@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: nand: Changes for 5.3
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190706_135332_738303_41533E7B 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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
 Frieder Schrempf <frieder.schrempf@exceet.de>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdWwgNSwgMjAxOSBhdCAxMTo1NyBQTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxvLAo+Cj4gVGhpcyBpcyB0aGUgTkFORCBQ
UiBmb3IgNS4zLgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKPgo+Cj4gVGhlIGZvbGxvd2luZyBjaGFu
Z2VzIHNpbmNlIGNvbW1pdCBmMmM3Yzc2YzVkMGE0NDMwNTNlOTRhZGI5ZjA5MThmYTJmYjg1YzNh
Ogo+Cj4gICBMaW51eCA1LjItcmMzICgyMDE5LTA2LTAyIDEzOjU1OjMzIC0wNzAwKQo+Cj4gYXJl
IGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4KPiAgIGdpdDovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IHRhZ3MvbmFuZC9m
b3ItNS4zCgpQdWxsZWQsIHRoYW5rcyEgOi0pCgotLSAKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
