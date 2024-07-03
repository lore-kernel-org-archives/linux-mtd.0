Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67F1C2BD09
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jul 2024 15:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dvElM5XS2DkX0AAfVzKDakM1Z07bN7zFet0ZafG+1Q4=; b=yUr5NmyrTD2/0TO6AYGT0Vm/kN
	XV2AK5UrXSj1Hf4IDcnAU57l+Ele/aUp5rXHIuqtHtjGpVk4klITxy6v3FHUjzKsxWiyrKzTP/TGs
	rA3e2FvNfXpu51ZRidWrJ1n8eskeoT+37Yyvx19hsIrUePuKT2BoFLUBN58/95+vFVMNyzDXZPHcC
	XgjuQgkxsA9TTCySlcwq+gcm9+SzPvVuHfwz/+S1CQyKuYhJf/ctWxrlUGjcDRpn1JtUK2S1ZCMIt
	+Ep15Dyw+txBjf+A8LpMIymFgxxvSZq1WVTacz0Zvepep25HI7k148mccf0HMwj7fEVguAfcaU4v3
	bsbMWzsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1so-0000000Afmj-2eWp;
	Wed, 03 Jul 2024 15:26:58 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1sm-0000000AfmA-10tI
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jul 2024 15:26:57 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so74478871fa.0
        for <linux-mtd@lists.infradead.org>; Wed, 03 Jul 2024 08:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720020413; x=1720625213; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lRIOBXOs4/k6XAjJyjjcswW+VU5JN3W7nDFVycPrGkU=;
        b=galjSiW3LblmlYZ4ZpBsyI+uO46deCD5VWBh/GKmIMcq+QStRIihDQfgCnkTZ1bEiv
         RfOdkSj3jkDSnk5dgeDnw0UgaY4XrUGZemraptPUgS7078Y+3IctK12DOdA8oAm3t48d
         KwhRCAIT/fvUEBfDN9Xn+aFC6y/XdxIsP1c8+aA46fcsRV+fWGtmDAolUn2cqW/QxIn4
         EQoYBOthHx+12p8rBhweLB4iT6yF7/POCEcgExrQnEd+JdybAR1WVMN82GyzILDZh1TV
         H2aKAFaQVxQ5o4E8xlr3pKA++Ki4h5LpcFVmcFZz1u61rGhlK7Hi47jkJcFmnyigkXuc
         txHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720020413; x=1720625213;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lRIOBXOs4/k6XAjJyjjcswW+VU5JN3W7nDFVycPrGkU=;
        b=Z6ss3pGaz7Epf/rtRFBBEheDoI/VFiPUtlfD4TqLv9E4KbyCucAQQSk+n4GNLMbWrt
         Xx99EXnXatASN4wFseFjJi2+ZQ8vn/0CfieZh2PvmaZktxcSeV+DYtW6LWlH92/ewvWA
         QFbzZSTOgyOGbBijbDVbB14WUtXiscgaYYlnKbmKHU8uAfsEaVZAK4+L9+OI0b/GpvWL
         ogwbRsx66TzhQLQfiTy7SJ8/d/V3CMxX8lXIDVlKoUwg6uheiQZ9hB9ua/wDkxW9B6Za
         vxCA4OaI3w6KdSitdfQiJB0gp4wsSinBzLt6k4mGeO19mC3MB8qQ+Nab0LzsIO0l7tc+
         ctqw==
X-Gm-Message-State: AOJu0YyqNlAuwjIkndyYyuCtqHekSA2aFarXPM/SzD4iBf4lGUl+kTOJ
	QXcPRAER6OGX9RdF5z8LhqcF2XbDbjv3up6eEpWD9LRVY/e4OkB6Z14Cnm3g4gnfYJuMHCb5KFV
	snqgBOn4j5I6nmUxc2vCTE5+gXkhFuwUv
X-Google-Smtp-Source: AGHT+IGajA4qntlGSO06FynQdDELKITeDABb5ZXHIG+WoPc/xep44Rhztmo7HRcRbS3uqtK8PWJIXhHLsS/pdOSKfEE=
X-Received: by 2002:a2e:910d:0:b0:2ee:866c:bfce with SMTP id
 38308e7fff4ca-2ee866cc235mr13861031fa.35.1720020412370; Wed, 03 Jul 2024
 08:26:52 -0700 (PDT)
MIME-Version: 1.0
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Wed, 3 Jul 2024 16:26:15 +0100
Message-ID: <CADVatmNO0CvX8h64TfVaScdEC-wGH+BQDQUgVhP6DONObOYJiw@mail.gmail.com>
Subject: mtd-utils: Testsuites are failing if LTO is enabled
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="000000000000b04835061c5975fd"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_082656_336994_AAA59B33 
X-CRM114-Status: UNSURE (   7.70  )
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
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--000000000000b04835061c5975fd
Content-Type: text/plain; charset="UTF-8"

Hi All,

The "mtdlib_test" from the testsuite is failing if LTO and -O2
optimizations are enabled.

PASS: ubilib_test
FAIL: mtdlib_test
============================================================================
Testsuite summary for mtd-utils 2.2.0
============================================================================
# TOTAL: 2
# PASS:  1
# SKIP:  0
# XFAIL: 0
# FAIL:  1
# XPASS: 0
# ERROR: 0
============================================================================
See ./test-suite.log
Please report to linux-mtd@lists.infradead.org
============================================================================

I am attaching the test-suite.log with this mail.

Steps to reproduce:

export CFLAGS="-O2 -flto=auto"
./autogen.sh
./configure --enable-unit-tests
make
make check V=1

But if only "-O2" or only "-flto=auto" is used then the failure is not
seen. The failure is seen only if both "-O2" and "-flto=auto" are used
together.

I will be happy to test any patch or provide any more logs if needed.


-- 
Regards
Sudip

--000000000000b04835061c5975fd
Content-Type: text/x-log; charset="US-ASCII"; name="test-suite.log"
Content-Disposition: attachment; filename="test-suite.log"
Content-Transfer-Encoding: base64
Content-ID: <f_ly5zgise0>
X-Attachment-Id: f_ly5zgise0

PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CiAgIG10ZC11dGlscyAyLjIu
MDogLi90ZXN0LXN1aXRlLmxvZwo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0KCiMgVE9UQUw6IDIKIyBQQVNTOiAgMQojIFNLSVA6ICAwCiMgWEZBSUw6IDAKIyBGQUlMOiAg
MQojIFhQQVNTOiAwCiMgRVJST1I6IDAKCi4uIGNvbnRlbnRzOjogOmRlcHRoOiAyCgpGQUlMOiBt
dGRsaWJfdGVzdAo9PT09PT09PT09PT09PT09PQoKWz09PT09PT09PT1dIHRlc3RzOiBSdW5uaW5n
IDE3IHRlc3QocykuClsgUlVOICAgICAgXSB0ZXN0X2xpYm10ZF9vcGVuClsgICAgICAgT0sgXSB0
ZXN0X2xpYm10ZF9vcGVuClsgUlVOICAgICAgXSB0ZXN0X210ZF9pc19iYWQKWyAgICAgICBPSyBd
IHRlc3RfbXRkX2lzX2JhZApbIFJVTiAgICAgIF0gdGVzdF9tdGRfbWFya19iYWQKWyAgICAgICBP
SyBdIHRlc3RfbXRkX21hcmtfYmFkClsgUlVOICAgICAgXSB0ZXN0X210ZF9sb2NrClsgICAgICAg
T0sgXSB0ZXN0X210ZF9sb2NrClsgUlVOICAgICAgXSB0ZXN0X210ZF91bmxvY2sKWyAgICAgICBP
SyBdIHRlc3RfbXRkX3VubG9jawpbIFJVTiAgICAgIF0gdGVzdF9tdGRfaXNfbG9ja2VkClsgICAg
ICAgT0sgXSB0ZXN0X210ZF9pc19sb2NrZWQKWyBSVU4gICAgICBdIHRlc3RfbXRkX3JlZ2lvbmlu
Zm8KWyAgICAgICBPSyBdIHRlc3RfbXRkX3JlZ2lvbmluZm8KWyBSVU4gICAgICBdIHRlc3RfbXRk
X2VyYXNlX211bHRpClsgICAgICAgT0sgXSB0ZXN0X210ZF9lcmFzZV9tdWx0aQpbIFJVTiAgICAg
IF0gdGVzdF9tdGRfZXJhc2UKWyAgICAgICBPSyBdIHRlc3RfbXRkX2VyYXNlClsgUlVOICAgICAg
XSB0ZXN0X210ZF9yZWFkCmxpYm10ZDogZXJyb3IhOiBjYW5ub3QgcmVhZCAyOCBieXRlcyBmcm9t
IG10ZDAgKGVyYXNlYmxvY2sgMjI0LCBvZmZzZXQgNDMpCiAgICAgICAgZXJyb3IgOSAoQmFkIGZp
bGUgZGVzY3JpcHRvcikKWyAgRVJST1IgICBdIC0tLSAweGZmZmZmZmZmZmZmZmZmZmYgIT0gMApb
ICAgTElORSAgIF0gLS0tIHRlc3RzL3VuaXR0ZXN0cy9saWJtdGRfdGVzdC5jOjI1OTogZXJyb3I6
IEZhaWx1cmUhClsgIEZBSUxFRCAgXSB0ZXN0X210ZF9yZWFkClsgUlVOICAgICAgXSB0ZXN0X210
ZF93cml0ZV9ub29vYgpbICAgICAgIE9LIF0gdGVzdF9tdGRfd3JpdGVfbm9vb2IKWyBSVU4gICAg
ICBdIHRlc3RfbXRkX3dyaXRlX3dpdGhvb2IKWyAgICAgICBPSyBdIHRlc3RfbXRkX3dyaXRlX3dp
dGhvb2IKWyBSVU4gICAgICBdIHRlc3RfbXRkX3JlYWRfb29iClsgICAgICAgT0sgXSB0ZXN0X210
ZF9yZWFkX29vYgpbIFJVTiAgICAgIF0gdGVzdF9tdGRfd3JpdGVfb29iClsgICAgICAgT0sgXSB0
ZXN0X210ZF93cml0ZV9vb2IKWyBSVU4gICAgICBdIHRlc3RfbXRkX2Rldl9wcmVzZW50ClsgICAg
ICAgT0sgXSB0ZXN0X210ZF9kZXZfcHJlc2VudApbIFJVTiAgICAgIF0gdGVzdF9tdGRfZ2V0X2lu
Zm8KWyAgICAgICBPSyBdIHRlc3RfbXRkX2dldF9pbmZvClsgUlVOICAgICAgXSB0ZXN0X210ZF9n
ZXRfZGV2X2luZm8xClsgICAgICAgT0sgXSB0ZXN0X210ZF9nZXRfZGV2X2luZm8xCls9PT09PT09
PT09XSB0ZXN0czogMTcgdGVzdChzKSBydW4uClsgIFBBU1NFRCAgXSAxNiB0ZXN0KHMpLgpbICBG
QUlMRUQgIF0gdGVzdHM6IDEgdGVzdChzKSwgbGlzdGVkIGJlbG93OgpbICBGQUlMRUQgIF0gdGVz
dF9tdGRfcmVhZAoKIDEgRkFJTEVEIFRFU1QoUykKRkFJTCBtdGRsaWJfdGVzdCAoZXhpdCBzdGF0
dXM6IDEpCgo=
--000000000000b04835061c5975fd
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--000000000000b04835061c5975fd--

