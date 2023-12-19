Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78E7C46CD3
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 12:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YdyuLtRmZzyPQeo0vmyyh8/6yT0mGajbeJXyvJ7lyiU=; b=pCbQeOKkHkS1nT
	EQLaO03MmwObCJ2CL+wFPsgoCTrPBj0NFCJ+QBDXbtSE5ed0EAI6T25783nAB0unlLOy7ZJyunYbI
	Rz68q+EYAYktYF9W1xExJq0ptMgDK1dQxJqvfc3kkfpf3P47EqXy0FaGADOK6AIELFkewfYvCWVZo
	tNrzonOaDgwNjGnmKIGysxp8aYGPRlOY9+ufXbrMCypWpEE7eZh3ArMkApluNLPlDdiviuG/R8fS7
	LcX0IKuv7iC1POocDOrWGmIFrPqfbTcPD3wzc0FV5/6zg2kEax+BO6UMTVGivf0+AJr/0FyQ6UAsU
	memIt/Us5lxwo4LuTB8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFYms-00Dwwj-2v;
	Tue, 19 Dec 2023 12:01:26 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFYmp-00Dwtc-1b;
	Tue, 19 Dec 2023 12:01:25 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-54f4f7d082cso5443090a12.0;
        Tue, 19 Dec 2023 04:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702987280; x=1703592080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ggc4MgLow8E4fR59OH6SNMuCU7W9ARSM1t4iHs9v3xw=;
        b=TOITo50TmPY6AD9XG2YoMXdptBITMyVACn889j1uF3xYdRbEvlGleyjtnPOscA3iba
         vEz2u0iksDguOOj8HZClGmEOPj8JxrAipIIeWRMRzXiTJPKDZn6LGXAeEv5HX/RExvDI
         rEHgBDpaICoPIEKebqDP05qlpXnqRbqwlqIiAEQqVfzah0Gg4MxxnkLTFYRif5r+FYQk
         rYcT5B9KnTQFPdgpFTTO0Jrc+RFwQbmkexX1+uPFQvQQBrL7c9V3gaiOcPEtmKSk4UcB
         GFs2UbhFlMekVBoRPRMzYQm8T9C/zVtEf7GatF3wyTCtLMyyngrAwyUDE/igwhQNnIkG
         +cPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702987280; x=1703592080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ggc4MgLow8E4fR59OH6SNMuCU7W9ARSM1t4iHs9v3xw=;
        b=cwR13l6EvSDvLs93qKPVgf6D5lvt4pOZlgcSSIemzl4SMktOUS1lf9VGqJe2FMWH8k
         XZkEr9vXqCY+9UsqrC/4qbO8rJpfBALotisAVKZDdOfDdozLS+BXBdOQwjq40yq5I8ZP
         BlU212Iv+4A1sn06e0KWfhC57hLLYuSsUztRVfQwKG5JsDfXHIeC4n+jFNfXtE77gJpV
         AhnvsTLh6Mhgj3rHxznPzVyvxwiczqmI0U6X6mgj8+jfWKKw9/QhcUC5Nwsut0K8UAg9
         BkzpLkE6xqefvdQHKHUVcsIP9Svkof1E+gx9ZsrABE83CFGsReAbT4E5GYwqZEv7BEUW
         fCwQ==
X-Gm-Message-State: AOJu0Yx8AK6klNK736pmpujlqueJ2Y4KpuGOloVtZJLHsqKjtoahRdu6
	NSP/VmJA6Ph2Gf85vUpBI+Y=
X-Google-Smtp-Source: AGHT+IGbWu9nYmKMlQOgTvvIAYGTbf9goRDVatn2xCQG7tStTbISUYi0agdhw2nFSCl3wzgngLUGMA==
X-Received: by 2002:a17:906:c3:b0:a1f:830a:b621 with SMTP id 3-20020a17090600c300b00a1f830ab621mr8866169eji.109.1702987279434;
        Tue, 19 Dec 2023 04:01:19 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id ux4-20020a170907cf8400b00a230f3799a4sm6767478ejc.225.2023.12.19.04.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 04:01:19 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH v6.8 1/2] nvmem: layouts: refactor .add_cells() callback arguments
Date: Tue, 19 Dec 2023 13:01:03 +0100
Message-Id: <20231219120104.3422-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_040123_540669_E7E94F6C 
X-CRM114-Status: GOOD (  18.20  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKU2ltcGx5IHBhc3Mgd2hv
bGUgInN0cnVjdCBudm1lbV9sYXlvdXQiIGluc3RlYWQgb2Ygc2luZ2xlIHZhcmlhYmxlcy4KVGhl
cmUgaXMgbm90aGluZyBpbiAic3RydWN0IG52bWVtX2xheW91dCIgdGhhdCB3ZSBoYXZlIHRvIGhp
ZGUgZnJvbQpsYXlvdXQgZHJpdmVycy4gVGhleSBhbHNvIGFjY2VzcyBpdCBkdXJpbmcgLnByb2Jl
KCkgYW5kIC5yZW1vdmUoKS4KClRoYW5rcyB0byB0aGlzIGNoYW5nZToKCjEuIEFQSSBnZXRzIG1v
cmUgY29uc2lzdGVudAogICBBbGwgbGF5b3V0cyBkcml2ZXJzIGNhbGxiYWNrcyBnZXQgdGhlIHNh
bWUgYXJndW1lbnQKCjIuIExheW91dHMgZ2V0IGNvcnJlY3QgZGV2aWNlCiAgIEJlZm9yZSB0aGlz
IGNoYW5nZSBOVk1FTSBjb3JlIGNvZGUgd2FzIHBhc3NpbmcgTlZNRU0gZGV2aWNlIGluc3RlYWQK
ICAgb2YgbGF5b3V0IGRldmljZS4gVGhhdCByZXN1bHRlZCBpbjoKICAgKiBDb25mdXNpbmcgcHJp
bnRzCiAgICogQ2FsbGluZyBkZXZtXyooKSBoZWxwZXJzIG9uIHdyb25nIGRldmljZQogICAqIEhl
bHBlcnMgbGlrZSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoKSBkZXJlZmVyZW5jaW5nIE5VTExz
CgozLiBJdCBnZXRzIHBvc3NpYmxlIHRvIGdldCBtYXRjaCBkYXRhCiAgIEZpcnN0IG9mIGFsbCBu
dm1lbV9sYXlvdXRfZ2V0X21hdGNoX2RhdGEoKSByZXF1aXJlcyBwYXNzaW5nICJzdHJ1Y3QKICAg
bnZtZW1fbGF5b3V0IiB3aGljaCAuYWRkX2NlbGxzKCkgY2FsbGJhY2sgZGlkbid0IGhhdmUgYmVm
b3JlIHRoaXMuIEl0CiAgIGRvZXNuJ3QgbWF0dGVyIG11Y2ggYXMgaXQncyByYXRoZXIgdXNlbGVz
cyBub3cgYW55d2F5IChhbmQgd2lsbCBiZQogICBkcm9wcGVkKS4KICAgV2hhdCdzIG1vcmUgaW1w
b3J0YW50IGhvd2V2ZXIgaXMgdGhhdCBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoKSBjYW4KICAg
YmUgdXNlZCBub3cgdGhhbmtzIHRvIG93bmluZyBhIHByb3BlciBkZXZpY2UgcG9pbnRlci4KClNp
Z25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0tClRob3Nl
IGNoYW5nZXMgY29tcGxldGUgbGF5b3V0cyByZWZhY3RvcmluZyBwcm9jZXNzIHNvIEknZCB2ZXJ5
IG11Y2ggbGlrZQp0aGVtIHRvIGdvIHdpdGggdGhlIHJlc3Qgb2YgcmVmYWN0b3Jpbmcgc3R1ZmYg
dG8gdjYuOC4KCkl0J3MgZGlmZmljdWx0IHRvIGFkZCBGaXhlcyB0YWcgZHVlIHRvIHRoZSBuYXR1
cmUgb2YgcmVmYWN0b3JpbmcuCkNhbGxiYWNrIC5hZGRfY2VsbHMoKSBleGlzdGVkIGV2ZW4gYmVm
b3JlIHJlZmFjdG9yaW5nIHNvIEknbSBub3Qgc3VyZQp3aGF0IGNvbW1pdCB3b3VsZCBiZSBmYWly
IHRvIGJsYW1lLgoKU3JpbmksIEdyZWc6IGNvdWxkIHlvdSBzZWUgaWYgdGhpcyBjb3VsZCBzdGls
bCBtYWtlIGl0IGludG8gdjYuOD8KCiBkcml2ZXJzL252bWVtL2NvcmUuYyAgICAgICAgICAgICB8
IDIgKy0KIGRyaXZlcnMvbnZtZW0vbGF5b3V0cy9vbmllLXRsdi5jIHwgNCArKystCiBkcml2ZXJz
L252bWVtL2xheW91dHMvc2wyOHZwZC5jICB8IDQgKysrLQogaW5jbHVkZS9saW51eC9udm1lbS1w
cm92aWRlci5oICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL252bWVtL2NvcmUuYyBiL2RyaXZlcnMv
bnZtZW0vY29yZS5jCmluZGV4IGJhNTU5ZTgxZjc3Zi4uNDQxZDEzMmViYjYxIDEwMDY0NAotLS0g
YS9kcml2ZXJzL252bWVtL2NvcmUuYworKysgYi9kcml2ZXJzL252bWVtL2NvcmUuYwpAQCAtODU0
LDcgKzg1NCw3IEBAIGludCBudm1lbV9sYXlvdXRfcmVnaXN0ZXIoc3RydWN0IG52bWVtX2xheW91
dCAqbGF5b3V0KQogCQlyZXR1cm4gLUVJTlZBTDsKIAogCS8qIFBvcHVsYXRlIHRoZSBjZWxscyAq
LwotCXJldCA9IGxheW91dC0+YWRkX2NlbGxzKCZsYXlvdXQtPm52bWVtLT5kZXYsIGxheW91dC0+
bnZtZW0pOworCXJldCA9IGxheW91dC0+YWRkX2NlbGxzKGxheW91dCk7CiAJaWYgKHJldCkKIAkJ
cmV0dXJuIHJldDsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9udm1lbS9sYXlvdXRzL29uaWUtdGx2
LmMgYi9kcml2ZXJzL252bWVtL2xheW91dHMvb25pZS10bHYuYwppbmRleCBiMjRjYzVkY2M2ZWUu
LjlkMmFkNWYyZGMxMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9udm1lbS9sYXlvdXRzL29uaWUtdGx2
LmMKKysrIGIvZHJpdmVycy9udm1lbS9sYXlvdXRzL29uaWUtdGx2LmMKQEAgLTE4Miw4ICsxODIs
MTAgQEAgc3RhdGljIGJvb2wgb25pZV90bHZfY3JjX2lzX3ZhbGlkKHN0cnVjdCBkZXZpY2UgKmRl
diwgc2l6ZV90IHRhYmxlX2xlbiwgdTggKnRhYmwKIAlyZXR1cm4gdHJ1ZTsKIH0KIAotc3RhdGlj
IGludCBvbmllX3Rsdl9wYXJzZV90YWJsZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBudm1l
bV9kZXZpY2UgKm52bWVtKQorc3RhdGljIGludCBvbmllX3Rsdl9wYXJzZV90YWJsZShzdHJ1Y3Qg
bnZtZW1fbGF5b3V0ICpsYXlvdXQpCiB7CisJc3RydWN0IG52bWVtX2RldmljZSAqbnZtZW0gPSBs
YXlvdXQtPm52bWVtOworCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZsYXlvdXQtPmRldjsKIAlzdHJ1
Y3Qgb25pZV90bHZfaGRyIGhkcjsKIAlzaXplX3QgdGFibGVfbGVuLCBkYXRhX2xlbiwgaGRyX2xl
bjsKIAl1OCAqdGFibGUsICpkYXRhOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9udm1lbS9sYXlvdXRz
L3NsMjh2cGQuYyBiL2RyaXZlcnMvbnZtZW0vbGF5b3V0cy9zbDI4dnBkLmMKaW5kZXggYjhmZmFl
NjQ2Y2MyLi41M2ZhNTBmMTdkY2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbnZtZW0vbGF5b3V0cy9z
bDI4dnBkLmMKKysrIGIvZHJpdmVycy9udm1lbS9sYXlvdXRzL3NsMjh2cGQuYwpAQCAtODAsOCAr
ODAsMTAgQEAgc3RhdGljIGludCBzbDI4dnBkX3YxX2NoZWNrX2NyYyhzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBudm1lbV9kZXZpY2UgKm52bWVtKQogCXJldHVybiAwOwogfQogCi1zdGF0aWMg
aW50IHNsMjh2cGRfYWRkX2NlbGxzKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG52bWVtX2Rl
dmljZSAqbnZtZW0pCitzdGF0aWMgaW50IHNsMjh2cGRfYWRkX2NlbGxzKHN0cnVjdCBudm1lbV9s
YXlvdXQgKmxheW91dCkKIHsKKwlzdHJ1Y3QgbnZtZW1fZGV2aWNlICpudm1lbSA9IGxheW91dC0+
bnZtZW07CisJc3RydWN0IGRldmljZSAqZGV2ID0gJmxheW91dC0+ZGV2OwogCWNvbnN0IHN0cnVj
dCBudm1lbV9jZWxsX2luZm8gKnBpbmZvOwogCXN0cnVjdCBudm1lbV9jZWxsX2luZm8gaW5mbyA9
IHswfTsKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKmxheW91dF9ucDsKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvbnZtZW0tcHJvdmlkZXIuaCBiL2luY2x1ZGUvbGludXgvbnZtZW0tcHJvdmlkZXIu
aAppbmRleCA2ZmU2NWIzNWVhOTcuLjgxYTY3NjQyYWM1NSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9s
aW51eC9udm1lbS1wcm92aWRlci5oCisrKyBiL2luY2x1ZGUvbGludXgvbnZtZW0tcHJvdmlkZXIu
aApAQCAtMTczLDcgKzE3Myw3IEBAIHN0cnVjdCBudm1lbV9jZWxsX3RhYmxlIHsKIHN0cnVjdCBu
dm1lbV9sYXlvdXQgewogCXN0cnVjdCBkZXZpY2UgZGV2OwogCXN0cnVjdCBudm1lbV9kZXZpY2Ug
Km52bWVtOwotCWludCAoKmFkZF9jZWxscykoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgbnZt
ZW1fZGV2aWNlICpudm1lbSk7CisJaW50ICgqYWRkX2NlbGxzKShzdHJ1Y3QgbnZtZW1fbGF5b3V0
ICpsYXlvdXQpOwogfTsKIAogc3RydWN0IG52bWVtX2xheW91dF9kcml2ZXIgewotLSAKMi4zNS4z
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
