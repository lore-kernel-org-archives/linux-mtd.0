Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129EAC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 04:12:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B975A61A3A
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 04:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B975A61A3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdWmrNzeDBqOK8ttp95rPG1AX0iKICgHTnyBMLx5xAY=; b=KDDuh2kPJMhEDZ
	2XSh5QDPXDDQBrDS8NNTg6KgQAF0R7hWNle5i/mgJBc8zqVPKqnNQfLi1OBgwOYwhhz1l+FRKmQh1
	/NROoG/+reSOZLzaroMKhR9eODrv0ZEHYZLla2WewWiOj1W66QrF92bW47xR+0ZwQWRDtmCnMgUCv
	0ne3x5Ux320UjGspiBN3xQkznt+URZOm3AH51WzucwENI0zHfrzJKKAJDGogZN9I5zZyAqbZXj0dw
	HD41qVpl9q6vcqxNXJLCbdvf3E1jHWbpMYg55TWyxWKxo3djeKlR6bdZ4yixV1AwZkt2zSMcBigkC
	g7E11m8cy/VJCP6fLEwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnCIS-003IWU-Sa; Wed, 17 Nov 2021 04:11:44 +0000
Received: from mail-pf1-f181.google.com ([209.85.210.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnCIQ-003IVG-Ko
 for linux-mtd@lists.infradead.org; Wed, 17 Nov 2021 04:11:43 +0000
Received: by mail-pf1-f181.google.com with SMTP id c4so1419547pfj.2
 for <linux-mtd@lists.infradead.org>; Tue, 16 Nov 2021 20:11:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Bjo6JYh6swD0+7pP1y5ezzsjdxB7C1Snz29o1nBUET8=;
 b=co+2rrD0KV3du7SLufph6b7anGv/jId3V1d3Ph75MXVnI8HC15nMVVp1zOrEW1gC7V
 daTr3yYCnjHsQRXRxxcQ3ehdQrSFhbN/8qG7wIVsuKZWkt0GZfHNGGT7JYZu0uNbQGwU
 0au70zyBu8qFrkA2dGnreY3NUQXTJn/Tt1ZiIU0NUWVUOiVpKhGVANwgOtAcDO8uybUe
 D0LMnxFUTcdlk2RRDT9XAmaQCYCkYECO1+xAH1wfVm4FAb4JzsOXbQrTKpg3CkU213KY
 IJcho50OiqN4MkMUstn1OGZFGX1Sv2SNPBr21K+5f9h482GSsSbmjRG96PnKpn/wIFp7
 04Xw==
X-Gm-Message-State: AOAM532MvLzDGv/kuLxSGZikSC6UkSC5zjI5Cgb3J2ADzp8ryyb0NT6M
 woXyu6eAZ3zWf4yAC2oJkYQ=
X-Google-Smtp-Source: ABdhPJxdovCRZWHCUQmOXeEIepOsGeHCMeOPUMgMASc6+IqAP1LSKlMrUCGgVueBcWmjWd+R1CZCrA==
X-Received: by 2002:a05:6a00:1150:b0:4a2:7328:cce6 with SMTP id
 b16-20020a056a00115000b004a27328cce6mr36018798pfm.67.1637122301246; 
 Tue, 16 Nov 2021 20:11:41 -0800 (PST)
Received: from ?IPV6:2601:647:4000:d7:feaa:14ff:fe9d:6dbd?
 ([2601:647:4000:d7:feaa:14ff:fe9d:6dbd])
 by smtp.gmail.com with ESMTPSA id ng9sm4111639pjb.4.2021.11.16.20.11.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 20:11:40 -0800 (PST)
Message-ID: <59cb2cfd-3890-9fb4-9e77-a4b084d088e9@acm.org>
Date: Tue, 16 Nov 2021 20:11:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [QUESTION] blk_mq_freeze_queue in elevator_init_mq
Content-Language: en-US
To: yangerkun <yangerkun@huawei.com>, ming.lei@redhat.com,
 damien.lemoal@wdc.com, axboe@kernel.dk, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
Cc: linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
 yi.zhang@huawei.com, yebin10@huawei.com, houtao1@huawei.com
References: <d9113bf8-4654-cb04-f79c-38e11493cb2c@huawei.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <d9113bf8-4654-cb04-f79c-38e11493cb2c@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_201142_702981_8127F0D1 
X-CRM114-Status: GOOD (  13.35  )
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

T24gMTEvMTYvMjEgMTk6MzcsIHlhbmdlcmt1biB3cm90ZToKPiBUaGlzIGNvbW1pdCBhZGQgYmxr
X21xX2ZyZWV6ZV9xdWV1ZSBpbiBlbGV2YXRvcl9pbml0X21xIHdoaWNoIHRyeSB0bwo+IG1ha2Ug
c3VyZSBubyBpbi1mbGlnaHQgcmVxdWVzdCB3aGlsZSB3ZSBnbyB0aHJvdWdoIGJsa19tcV9pbml0
X3NjaGVkLgo+IEJ1dCBkb2VzIHRoZXJlIGFueSBkcml2ZXJzIGNhbiBsZWF2ZSBJTyBhbGl2ZSB3
aGlsZSB3ZSBnbyB0aHJvdWdoCj4gZWxldmF0b3JfaW5pdF9tce+8nyBBbmQgaWYgbm8sIG1heWJl
IHdlIGNhbiBqdXN0IHJlbW92ZSB0aGlzIGxvZ2ljYWwgdG8KPiBmaXggdGhlIHJlZ3Jlc3Npb24u
Li4KCkRvZXMgdGhpcyB1bnRlc3RlZCBwYXRjaCBoZWxwPyBQbGVhc2Ugbm90ZSB0aGF0IEknbSBu
b3QgcmVjb21tZW5kaW5nIHRvCmludGVncmF0ZSB0aGlzIHBhdGNoIGluIHRoZSB1cHN0cmVhbSBr
ZXJuZWwgYnV0IGlmIGl0IGhlbHBzIGl0IGNhbiBiZSBhCmJ1aWxkaW5nIGJsb2NrIG9mIGEgc29s
dXRpb24uCgpUaGFua3MsCgpCYXJ0LgoKZGlmZiAtLWdpdCBhL2Jsb2NrL2Jsay1tcS5jIGIvYmxv
Y2svYmxrLW1xLmMKaW5kZXggM2FiMzRjNGYyMGRhLi5iODVkY2I3MmE1NzkgMTAwNjQ0Ci0tLSBh
L2Jsb2NrL2Jsay1tcS5jCisrKyBiL2Jsb2NrL2Jsay1tcS5jCkBAIC0xNjcsNiArMTY3LDcgQEAg
dm9pZCBibGtfZnJlZXplX3F1ZXVlX3N0YXJ0KHN0cnVjdCByZXF1ZXN0X3F1ZXVlICpxKQogIAkJ
bXV0ZXhfdW5sb2NrKCZxLT5tcV9mcmVlemVfbG9jayk7CiAgCQlpZiAocXVldWVfaXNfbXEocSkp
CiAgCQkJYmxrX21xX3J1bl9od19xdWV1ZXMocSwgZmFsc2UpOworCQlzeW5jaHJvbml6ZV9yY3Vf
ZXhwZWRpdGVkKCk7CiAgCX0gZWxzZSB7CiAgCQltdXRleF91bmxvY2soJnEtPm1xX2ZyZWV6ZV9s
b2NrKTsKICAJfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
