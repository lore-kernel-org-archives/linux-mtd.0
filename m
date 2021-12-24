Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C924C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Dec 2021 08:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=N359fqNJI4xCZkjTlXamGec1oeGdC0rQjpajNeX2PyI=; b=Xp3
	o+ta4H57A486Ji9wDqU63L9RSi0wGA6gGQzIC94IV7eKFQuQNhWARQpGiLZiwTofYQz9zjNj4KsvD
	587f1WQFgFN/UU7stThPpRoRuE0ReqJUncsB34I1/0spzRIbBpJdvko519qyC8PBNeqNMN3CmjYen
	Rl7AmYT5Yh4VRSRMwVWrvDk4oleklcjO8CXvDYCHk9uKLMAquCSCZW6Uh/u9IJnaja2zLBOKs9GHS
	jsGgzDDnNDOz5kV6am8YSI4DnveKtrF8M0yWHUnOkAECuL91CSoTyLPadd3FEvl4Cb+QmQlg7WKRC
	KDK0dj1OBu49V5B1N8QSTdLGAEAjgdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0fTb-00Du1b-12; Fri, 24 Dec 2021 07:58:55 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0fTX-00Du1J-Gf
 for linux-mtd@lists.infradead.org; Fri, 24 Dec 2021 07:58:52 +0000
Received: by mail-lj1-x244.google.com with SMTP id u22so12866317lju.7
 for <linux-mtd@lists.infradead.org>; Thu, 23 Dec 2021 23:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=Xu6MWVPz9KOFHdyz4knfb0MqZDLmvsnRivUxbHbWcf4=;
 b=T79eMRGcmckjVBprbshZksvhZfSr/G3o+x+2PziiPre7HicGienxc7fmngTWX9T1Dl
 iEXaa3DTgfo/PvR3av2OJghHLT293vyDf1ekzSelyzP1p+C9OLC1Yu1maT40QRpQ71zo
 mrmEhiy5W35txnecVLr4k7XE1XPecmz0xhIMidjmOR6hXKZrQWoJveFbCLS8YzoTOL/6
 TV0D8fJx+q53wxqyqNuj7OKctO08k3EtWVkR6vI4Y8x7MNXKvN8Q0TWLNW4C/ZeL1j86
 VZMNKwA2uqu5DMmJIW9U8OdWgTkxYr0+TrKgoufSHdlhZMV0XXqQaRIhfcJQPKBG1W+A
 1D5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=Xu6MWVPz9KOFHdyz4knfb0MqZDLmvsnRivUxbHbWcf4=;
 b=Uvr2JZrmLYLdAlrc4ob0comALIziIgUMDiuqkhWEPrjVGBabK1Zq7ZfhdfIbCO4osh
 9xKa+MlS+VMxmLfMHaCiIRJXbksZYxKq4Sy1x2fe3fkvek740fUMNFS23+9AnwVqXtAt
 wS6Aw4s/D8IFkAIvb8SRM3j0q8O7AGPdAA57Vay6fmuNzVvObu1UyCuGxb1XJ+6ntxhS
 qCqLEkPM2GsZN67haCS4hDcxWcuIPKNT6S/a6YuRRS9Zbd7KNbWw7kenLR1rTNcHad+m
 PkLS5qhvOYc/q8k5TxDDp5qd8bwqUiZu8qogsXS2c/rUIbUPZtLOmC7i2GC/ATbl7rPk
 S12A==
X-Gm-Message-State: AOAM532XIUog5mUa0qsyM2lACufIqLmoo7Nt/PS2T8UdIZxjgM4NHqiF
 YVUbZhUf5WefKD6/RoEq+i4wFAGQIPpwznwxLUkIra8UaEpY4WKi
X-Google-Smtp-Source: ABdhPJzJxrJfU88U+Goe0f6OYN0PiKt1Dy/Qng4SL21HRaJAvwrfudnSo1TnabW06c2xVgCsazj8kgovafVoy8beeyc=
X-Received: by 2002:a2e:869a:: with SMTP id l26mr4113108lji.453.1640332729435; 
 Thu, 23 Dec 2021 23:58:49 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?6Z+p5LuB5p2w?= <hanrenjie123@gmail.com>
Date: Fri, 24 Dec 2021 15:58:38 +0800
Message-ID: <CADPmmj4xHLvptkPXga-Cv1WfBr+qXbaib1io1FUfRx+Ac1e+sQ@mail.gmail.com>
Subject: UBIFS: ubifs_recover_leb() always execute fix_unclean_leb() even all
 the nodes are valid
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_235851_641790_D952F998 
X-CRM114-Status: UNSURE (   6.97  )
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

SSd2ZSBiZWVuIHdvcmtpbmcgb24gTGludXggNC40LjYwIHJlY2VudGx5IFdoZW4gdXNpbmcgVUJJ
RlMgZmlsZSBzeXN0ZW0sCgpJIHJlY2VudGx5IGVuY291bnRlcmVkIGEgcHJvYmxlbSB0aGF0IGV2
ZXJ5IHRpbWUgSSBwb3dlciBvZmYgYW5kIHJlc3RhcnQsCgpJIHdpbGwgZW50ZXIgdGhlIHJlY292
ZXJ5IHByb2Nlc3Mgb2YgVUJJRlMuCgoKCkkgZG8gdW5kZXJzdGFuZCB0aGUgcmVhc29uIGZvciBl
bnRlcmluZyByZWNvdmVyeSBkdXJpbmcgc3RhcnR1cCwgYW5kIHRoZQoKbWFpbiAgcHVycG9zZSBv
ZiB1Ymlmc19yZWNvdmVyX2xlYigpIGlzIHRvIGRlYWwgd2l0aCBhbiBpbnZhbGlkIG5vZGUgYW5k
CgptYWtlIHViaWZzIG1vdW50IHN1Y2Nlc3NmdWxseS4gQnV0IGV2ZW4gaWYgdGhlcmUgYXJlIG5v
IGludmFsaWQgbm9kZXMsCgp1Ymlmc19yZWNvdmVyX2xlYigpIHdpbGwgY2FsbCAgZml4X3VuY2xl
YW5fbGViKCksIHdoaWNoIHJlc3VsdHMgaW4gZmxhc2jigJlzIGVyYXNlCgphbmQgd3JpdGUgb3Bl
cmF0aW9ucyBkdXJpbmcgc3RhcnR1cC4KCgoKSSBjaGVja2VkIHRoZSBtb2RpZnkgaGlzdG9yeSBv
ZiBrZXJuZWwvZnMvdWJpZnMvcmVjb3ZlcnkuYywgYW5kIGZvdW5kIGEgcmVsYXRlZAoKY29tbWl0
OgoKICBodHRwOi8vZ2l0LmluZnJhZGVhZC5vcmcvbGludXguZ2l0L2NvbW1pdGRpZmYvN2M0N2Jm
ZDBkYmIyMGU1ZDdmYTRlMzdjZmQ3NmJiNwoKM2QzOWIzMmI0P2hwPTYxNzk5MjA2OTUxM2MxZTc4
OWM3MDdjNGQ3NWZmMDNiZjdkZDBmYjAuCgoKCkluIHRoZSBjb21taXQsIHZhcmlhYmxlICJuZWVk
X2NsZWFuIiB3YXMgZGVsZXRlZC4gTXkgcXVlc3Rpb24gaXMgdGhhdAp3aGV0aGVyIGl0IGlzCgpu
ZWNlc3NhcnkgdG8gZXhlY3V0ZSBmaXhfdW5jbGVhbl9sZWIoKSBpZiB0aGVyZSBhcmUgbm8gaW52
YWxpZCBub2RlID8KSSBhbSBub3Qgc3VyZSBpZgoKdGhlcmUgYXJlIHNvbWUgYWRkaXRpb25hbCBj
b25zaWRlcmF0aW9ucyBJIGRpZG4ndCB0aGluayBvZiA/CgoKClRoYW5rIHlvdSB2ZXJ5IG11Y2gg
Zm9yIGFueSBpbnNpZ2h0IHlvdSBjYW4gcHJvdmlkZQoKCgotSGFuIFJlbmppZQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
