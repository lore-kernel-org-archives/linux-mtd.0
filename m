Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA372EB1071
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=whF6Hezi2MGlA2v+20qrHeiy1K3XnY6DWV/dEwK2DlM=; b=NrSN0GXhQJ/9+d
	YWDJYM28Sf0ptTeT5rrvJYO+sSSrjyqoJuOPAk/sHmPL4SLinAslo9ji1fA3g4OYFShCh6vjbOCxb
	nE2WR1muChNgsl4ekYpMBlW/XcvCRaP/i9m3eiriV5pWVKKMQG5MauE4xq0q5syFohAgNrl0mL9Ih
	99fSZOc7yFex6kaBKHs3CocfVoNprmS6np9jygZOXnaiUXq1ADAJOJZ4dJ67WvQEHVapEtLjLk5j1
	mERWLkqolz5SSy6TLrR0iU8ZArRFxgyzL2er8eM7teijPdDyzPAylZfLyJEqI+xMwXbZk0ZLHYTGV
	tNdqis+yfiiW4fFOivNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzviS-00000009Nh2-1WfP;
	Tue, 10 Mar 2026 11:57:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgj-00000009Kn1-1gfi;
	Tue, 10 Mar 2026 11:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=bwwsNpEuSxMWe0JpfJUzg0wYN6Lh2+T0V7r+oLFgaoc=; b=OB1RD2WtqSkAMidf9dTo811o+E
	gtO2gXVz0dqgVFq9Ba/hoPR5lYjKJTxDocKkfRXqB8qO+03r+CnTWRtSFFrluenXceDkYnlKh30Ze
	t5zN85XznY+2c2+08K+CfGupAwSBfOFVLYxl2h0ehXQkOJjIhs8YVn4EXMNA3UP3pyT1c+uEU6/8m
	2o7oZ2cmTtd7aqT3Ls2BWI+OnGxEWTBpa9ymv1XtaLHATcAZwnJDc88d7vneW27xFaDU8cuLXpM1q
	zhLvJUni9nGCO0aPjLP9x1QXKjCVywieTevYkJFXwQLTwjvsDNZr47yCDfZ23FJLqoX+gmqr9wmoO
	O2nMNi+g==;
Received: from mail.avm.de ([2001:bf0:244:244::94])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgd-00000007li1-2XCN;
	Tue, 10 Mar 2026 11:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143729; bh=xxm4pfrA8vpE+55Nunaq1/3InG5TW5+yUEKOnNPaCHE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vpe0akhPijy+fdFGsJlWa9KadgjO2UW3S7CfTGj2Nb6xgJuadPCv9jJW3GCcgmmDp
	 NsscICFVG30n95MZjrlzYTppWlcYdN0G1O633y0snTb7dDyj/NfP2miiuKsPdNfmP+
	 vAwjLimypqw9PSgx5KgoEmL24wgMu4NPRFNkUtuM=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006b1-e21d-7f0000032729-7f000001bb0c-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:29 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:29 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:49:26 +0100
Subject: [PATCH 60/61] Input alps: Drop unlikely() around IS_ERR_OR_NULL()
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-60-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
To: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org, 
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev, 
 Philipp Hahn <phahn-oss@avm.de>
Cc: =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=xxm4pfrA8vpE+55Nunaq1/3InG5TW5+yUEKOnNPaCHE=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAai8jb0hbCBoPmYA/prWl4PUOkbFdhFm9gPO
 hWtVu2rtPaJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGogAKCRA0LQZT0ays
 28GYB/9rclpgBQgsqGF0yAXWM/97auTunqqLKOGDeyV/S4nC7HDn1d4UqQoeaSmUw2DOYO4u7t3
 FPnU9VUXE2nXM5FAQLfpjYhH7CG3jEkW4klm33iXRLo1nkpvx8klWZbYR7PMwPnVZTnxKNJmzgZ
 kL0ECVGQ0EahRXa5TL96qA0Z3YR0RjsX+MNWafES7VGwl+HS5Artyl+8jg+/p0RFHayhxpHi2hi
 Ftz0Ut7BpqlmrXUo0TzIlFmAGFe7tZCdcMDr5ii9ECIA4sGLz4jBK2uiDVL8YFZ25Y3k7DF6RQV
 m+hUB3KTG86705bO5a0t2DamRuiInU805Ah5rzh9tCueh4HO
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143729-373CFF2F-EC21F89B/0/0
X-purgate-type: clean
X-purgate-size: 1265
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_115545_417687_42F2CA1B 
X-CRM114-Status: UNSURE (   8.90  )
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

SVNfRVJSX09SX05VTEwoKSBhbHJlYWR5IHVzZXMgbGlrZWx5KCFwdHIpIGludGVybmFsbHkuIGNo
ZWNrcGF0Y2ggZG9lcwpub3QgbGlrZSBuZXN0aW5nIGl0Ogo+IFdBUk5JTkc6IG5lc3RlZCAodW4p
P2xpa2VseSgpIGNhbGxzLCBJU19FUlJfT1JfTlVMTCBhbHJlYWR5IHVzZXMKPiB1bmxpa2VseSgp
IGludGVybmFsbHkKUmVtb3ZlIHRoZSBleHBsaWNpdCB1c2Ugb2YgdW5saWtlbHkoKS4KCkNoYW5n
ZSBnZW5lcmF0ZWQgd2l0aCBjb2NjaW5lbGxlLgoKVG86ICJQYWxpIFJvaMOhciIgPHBhbGlAa2Vy
bmVsLm9yZz4KVG86IERtaXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT4K
Q2M6IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwIEhhaG4gPHBoYWhuLW9zc0Bhdm0uZGU+Ci0t
LQogZHJpdmVycy9pbnB1dC9tb3VzZS9hbHBzLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L21v
dXNlL2FscHMuYyBiL2RyaXZlcnMvaW5wdXQvbW91c2UvYWxwcy5jCmluZGV4IGYzZDNiNmI0ZTAy
ZDc5OGU3NWE5MDMzM2FjZTcyYTM2N2JlZmRiYWMuLjgyZTExZWZhZDdmN2YwMmI0YWFlZmRlMzQw
ZjliNzFmYTc5MmNmNmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW5wdXQvbW91c2UvYWxwcy5jCisr
KyBiL2RyaXZlcnMvaW5wdXQvbW91c2UvYWxwcy5jCkBAIC0xNDgyLDcgKzE0ODIsNyBAQCBzdGF0
aWMgdm9pZCBhbHBzX3JlcG9ydF9iYXJlX3BzMl9wYWNrZXQoc3RydWN0IHBzbW91c2UgKnBzbW91
c2UsCiAJCS8qIE9uIFYyIGRldmljZXMgdGhlIER1YWxQb2ludCBTdGljayByZXBvcnRzIGJhcmUg
cGFja2V0cyAqLwogCQlkZXYgPSBwcml2LT5kZXYyOwogCQlkZXYyID0gcHNtb3VzZS0+ZGV2Owot
CX0gZWxzZSBpZiAodW5saWtlbHkoSVNfRVJSX09SX05VTEwocHJpdi0+ZGV2MykpKSB7CisJfSBl
bHNlIGlmIChJU19FUlJfT1JfTlVMTChwcml2LT5kZXYzKSkgewogCQkvKiBSZWdpc3RlciBkZXYz
IG1vdXNlIGlmIHdlIHJlY2VpdmVkIFBTLzIgcGFja2V0IGZpcnN0IHRpbWUgKi8KIAkJaWYgKCFJ
U19FUlIocHJpdi0+ZGV2MykpCiAJCQlwc21vdXNlX3F1ZXVlX3dvcmsocHNtb3VzZSwgJnByaXYt
PmRldjNfcmVnaXN0ZXJfd29yaywKCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
