Return-Path: <SRS0=RLHh=GQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,GB_FAKE_RF_SHORT,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DB4C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Jan 2021 18:10:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B976423435
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Jan 2021 18:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B976423435
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mdtsa.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rA6Tb0FLhfunj5A6sxO4+S69fhdUhzELQ3DtIdpagME=; b=eBCGCtnQC5ZDTL
	3hpZaKKam+pltf5S4LSxreaB7RXgDYhMpQuCq59SuFIyrIEF09FyV6e2sd/03a9hdS36bQXv8rdZK
	aS7+WfFReqxC88J+nr8lWMj5GVAbJUBkW7v+gr4QOCBvt7I163BPY7nlSyYTFqUEZmQIOkgLULxpH
	RpIN2evVt83fdOi+Ugvit15Xf34dNXZJIMGLZOpnmXjc6Ruq+nJ2AhjgHvHg6Vtoo87GcLUFahPH+
	8l+MEvyLihq+H8KEgjWD55YOpsrOSaIIokibpd6W0H7/DmUli6VlF/nG1wmGm4UdsreX8jxLDo5lT
	8WpkiaNdWbcNjCIvrgjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzka6-0007gj-DE; Wed, 13 Jan 2021 18:09:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzka4-0007gW-2d
 for linux-mtd@merlin.infradead.org; Wed, 13 Jan 2021 18:09:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=6EGzAC4/njplOZvHdgl1BS6QT3RzBreNQzhB/fMBAqI=; b=sKwf0NZbnRbfA5v5LSgprj8Exx
 J2Lm5EA+RY1KAOjZlphZn2CS1PdvO/LdP7qQIzn3tyuW6JFIS2WNRhyu9jfksfl/NFFvJnNS98V6j
 4FhilfwC5HyXMidmAd2876t9e/Gm7BxMRSrbKJTwBsI/vwyEhGS5H0WONWPBRJaeYPnL6QtxCjGS/
 tHlDZ8RSrSZi5WE3EL7jRu1C4A4Jw0qa/bBcodn+zd/B2h64EZWTRGW8kLIl5C1EQtdqzCeDr7Afv
 ouHSBguDgBGPoWHfpPuRK/Klj2qws2B5Kqjel/pxYIe5kVns+DUJbZooAjNnGeeGOtxu5djjygFED
 JcF2/NKA==;
Received: from 195-141-234-38.static.adslpremium.ch ([195.141.234.38]
 helo=mdtint.dyndns.org)
 by casper.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1kzkZo-006YF4-JR
 for linux-mtd@lists.infradead.org; Wed, 13 Jan 2021 18:09:04 +0000
Received: by mdtint.dyndns.org (Postfix, from userid 1000)
 id 3206A326D2D7; Wed, 13 Jan 2021 19:00:01 +0100 (CET)
Received: from access.mdtsa.ch (unknown [123.24.177.142])
 by mdtint.dyndns.org (Postfix) with ESMTPA id 23048326C3FA;
 Wed, 13 Jan 2021 18:59:50 +0100 (CET)
To: "Christoph Lameter" <cl@linux.com>, "Fengguang Wu" <fengguang.wu@intel.com>,
 "Lars Peter Clausen" <lars@metafoo.de>,
 "torvalds" <torvalds@linux-foundation.org>,
 "Stany MARCEL" <smarcel@pactenovation.fr>,
 "linux mtd" <linux-mtd@lists.infradead.org>, "dedekind1" <dedekind1@gmail.com>,
 "Pankaj DEV" <pankaj.dev@stericsson.com>,
 "David McCullough" <david_mccullough@mcafee.com>
From: nik_bin_nek_alwi <xumings@mdtsa.ch>
Subject: =?UTF-8?Q?Fw=3AHal=C3=B6le._wie_geht_es_dir=3F?=
Message-ID: <a5177a2a-4715-4152-b023-ecd43ea9b46e@mdtsa.ch>
Date: Wed, 13 Jan 2021 08:49:59 -0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_180904_239114_87148267 
X-CRM114-Status: UNSURE (   5.35  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgoK4pyUIEhldXRlIGlzdCBkZXIgcGVyZmVrdGUgVGFnLCB1bSBkaXIgenUgc2NocmVpYmVuLiBJ
Y2ggaG9mZmUsIGRpciBnZWh0IGVzIGd1dC4KaHR0cHM6Ly9iaXQubHkvM3MwN0ZBRwoKCgoKCgog
bmlrX2Jpbl9uZWtfYWx3aUB5YWhvby5jb20KCiAxLzEzLzIwMjEgOTo0OTo1OSBBTQoKCgoKCgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwogU2VuaW9yIGFkbWluaXN0cmF0aW9uIG9mZmljaWFscyByZXNpZ24gYWZ0
ZXIgZGVhZGx5IENhcGl0b2wgcmlvdApBdCBsZWFzdCBlaWdodCBhZG1pbmlzdHJhdGlvbiBvZmZp
Y2lhbHMgaGF2ZSByZXNpZ25lZCwgaW5jbHVkaW5nIG9uZSBDYWJpbmV0IG1lbWJlciwgYWZ0ZXIg
UHJlc2lkZW50IFRydW1wJ3Mgc3VwcG9ydGVycyBhdHRhY2tlZCB0aGUgVS5TLiBDYXBpdG9sIG9u
IFdlZG5lc2RheS4gV2VpamlhIEppYW5nIHJlcG9ydHMuClN1YnVyYmFuIENodXJjaCBMZWFkcyBI
YXJkIENvbnZlcnNhdGlvbiBBYm91dCBSYWNlCkluIGEgbW9zdGx5IHdoaXRlIHN1YnVyYiBub3J0
aCBvZiBDaGljYWdvLCBHZW9yZ2UgRmxveWQncyBraWxsaW5nIGhhcyBvcGVuZWQgdXAgc29tZSB0
b3VnaCB0YWxrcy4gQW5kIHRoZSBwYXN0b3Igb2YgYSBoaXN0b3JpYyBCbGFjayBjaHVyY2ggdGhl
cmUgaXMgbGVhZGluZyB0aGUgd2F5IGJ5IHRlbGxpbmcgaGlzIHN0b3J5LiAKU3RvcmllcyBvZiBF
dmVyeWRheSBTdHJhbmdlbmVzcywgaW4gdGhlIE1pZHdlc3QgYW5kIEJleW9uZArDouKCrMWTTGlm
ZSBBbW9uZyB0aGUgVGVycmFuYXV0cyzDouKCrMKdIGJ5IENhaXRsaW4gSG9ycm9ja3MsIG9mZmVy
cyB2aXZpZCwgb2Z0ZW4gZmFudGFzdGljYWwgcG9ydHJhaXRzIG9mIGxpZmUuCkNvdmlkOiBOSFMg
ZG9jdG9yICdyZWNlaXZlcyAyMCB0byAzMCBhYnVzaXZlIG1lc3NhZ2VzIGEgZGF5JwpEciBTYW1h
bnRoYSBCYXR0LVJhd2RlbiBzYXlzIE5IUyBzdGFmZiBhcmUgZmFjaW5nICJkZXZhc3RhdGluZyIg
YWJ1c2UgZnJvbSBjb3JvbmF2aXJ1cyBzY2VwdGljcy4KVGltZSBPdXQ6IE5hb21pIE9zYWthIGRy
YXdzIGFuZCB0cmllcyB0byBjb21lIG91dCBvZiBoZXIgc2hlbGwKVHdvLXRpbWUgZ3JhbmQgc2xh
bSB3aW5uZXIgTmFvbWkgT3Nha2EgdGVsbHMgQ2hyaXN0aW5hIE1hY2ZhbGFuZSB0aGF0IHNoZSBp
cyB1c2luZyBsb2NrZG93biB0byBkcmF3IG1vcmUgYW5kIHRvIGxlYXJuIGhvdyB0byBjb21lIG91
dCBvZiBoZXIgc2hlbGwgYW5kIHN0b3AgYmVpbmcgc2h5LgpBcHByb2FjaCBmb3IgQ2FycmVmb3Vy
IHNob3dzIG5vdCBldmVuIEV1cm9wZSdzIGxhcmdlc3QgcmV0YWlsZXJzIGFyZSBpbW11bmUgdG8g
dGFrZW92ZXIgdGFsawpJdCBpcyBhIG5hbWUgaW5zdGFudGx5IHJlY29nbmlzYWJsZSB0byBhbnlv
bmUgd2hvIGhhcyB2aXNpdGVkIEZyYW5jZS4KRWxvbiBNdXNrJ3MgTmV0IFdvcnRoIEhpdHMgJDIw
MCBCbG4gZm9yIEZpcnN0IFRpbWUsIEluZGV4IFNob3dzClRoZSBTcGFjZVggYW5kIFRlc2xhIGZv
dW5kZXIgaGFzIHJlY2VudGx5IGJlY29tZSB0aGUgd29ybGQncyByaWNoZXN0IG1hbiwgb3ZlcnRh
a2luZyBBbWF6b24gQ0VPIEplZmYgQmV6b3MsIHdobyBoYWQgaGVsZCB0aGF0IHBvc2l0aW9uIHNp
bmNlIDIwMTcuCjIgY29uZ3Jlc3N3b21lbiB0ZXN0IHBvc2l0aXZlIGZvciBDT1ZJRC0xOSBhZnRl
ciBDYXBpdG9sIGF0dGFjawpQcmFtaWxhIEpheWFwYWwgYW5kIEJvbm5pZSBXYXRzb24gQ29sZW1h
biBzaGVsdGVyZWQgaW4gcGxhY2Ugd2l0aCBmZWxsb3cgbGF3bWFrZXJzIGR1cmluZyBDYXBpdG9s
IHNpZWdlLCBpbmNsdWRpbmcgc29tZSBSZXB1YmxpY2FucyB3aG8gdHVybmVkIGRvd24gbWFza3Mu
ClRoaW5rIFlvdXIgSGVhbHRoIENhcmUgQ29zdHMgQXJlIENvdmVyZWQ/IEJld2FyZSBUaGUgJ0p1
bmsnIEluc3VyYW5jZSBQbGFuCldoZXRoZXIgeW91J3JlIGxvb2tpbmcgZm9yIGNvdmVyYWdlIG9u
bGluZSBvciB0aHJvdWdoIGEgYnJva2VyLCBiZSBzdXJlIHRvIG5vdGUgdGhlIGRpZmZlcmVuY2Ug
YmV0d2VlbiBhIGNvbXByZWhlbnNpdmUgaGVhbHRoIHBsYW4gYW5kIGEgImp1bmsiIHBsYW4gd2l0
aCBsaW1pdGVkIGJlbmVmaXRzIGFuZCBjb3ZlcmFnZSByZXN0cmljdGlvbnMuClRoZSBMYXN0IFR3
byBOb3J0aGVybiBXaGl0ZSBSaGlub3MgT24gRWFydGgKV2hhdCB3aWxsIHdlIGxvc2Ugd2hlbiBO
YWppbiBhbmQgRmF0dSBkaWU/CkNvdmlkLTE5OiBSdWxlLWJyZWFrZXJzICdpbmNyZWFzaW5nbHkg
bGlrZWx5JyB0byBiZSBmaW5lZCAtIENyZXNzaWRhIERpY2sKUGVvcGxlIGFyZSBzdGlsbCBob2xk
aW5nIGhvdXNlIHBhcnRpZXMsIHJhdmVzIGFuZCBnYW1ibGluZyBnYXRoZXJpbmdzLCB0aGUgVUsn
cyBtb3N0IHNlbmlvciBwb2xpY2Ugb2ZmaWNlciBzYXlzLgpUaGUgaW50ZXJuYXRpb25hbCBkZXN0
aW5hdGlvbnMgd2VsY29taW5nIFVTIHRvdXJpc3RzIGJhY2sKT25jZSBvbmUgb2YgdGhlIHdvcmxk
J3MgbW9zdCBwb3dlcmZ1bCB0cmF2ZWwgZG9jdW1lbnRzLCB0aGUgbWlnaHQgb2YgdGhlIFVTIHBh
c3Nwb3J0IGhhcyBzaHJpdmVsZWQgZHVyaW5nIHRoZSBDb3ZpZC0xOSBwYW5kZW1pYy4gV2l0aCBV
UyBDb3ZpZC0xOSBjYXNlcyBzb2FyaW5nIGV2ZXIgaGlnaGVyLCBtYW55IG5hdGlvbnMgY29udGlu
dWUgdG8gdmlldyBBbWVyaWNhIHdpdGggdHJlcGlkYXRpb24uClJlYmVsIFdpbHNvbiBzYXlzIHNo
ZSB3YXMga2lkbmFwcGVkIGF0IGd1bnBvaW50IGFuZCBoZWxkIG92ZXJuaWdodCBpbiBNb3phbWJp
cXVlCkFjdHJlc3MgUmViZWwgV2lsc29uIGhhcyBzYWlkIHNoZSB3YXMgb25jZSBraWRuYXBwZWQg
YXQgZ3VucG9pbnQgYW5kIGhlbGQgb3Zlcm5pZ2h0IHdoaWxlIHN0YXlpbmcgaW4gTW96YW1iaXF1
ZS4KVUsgU3BhY2UgQWdlbmN5IFRlYW1zIFVwIFdpdGggUm9sbHMtUm95Y2UgdG8gUmVzZWFyY2gg
TnVjbGVhci1Qb3dlcmVkIFNwYWNlIEV4cGxvcmF0aW9uCk1PU0NPVyAoU3B1dG5paykgLSBUaGUg
VUsgU3BhY2UgQWdlbmN5IGFubm91bmNlZCBvbiBUdWVzZGF5IHRoZSBsYXVuY2ggb2YgYSBjb2xs
YWJvcmF0aW9uIHdpdGggUm9sbHMtUm95Y2UgdG8gc3R1ZHkgdGhlIHBvdGVudGlhbCBvZiB1c2lu
ZyBudWNsZWFyIHRlY2hub2xvZ3kgdG8gcG93ZXIgcm9ja2V0cywgZXNwZWNpYWxseSBpbiBkZWVw
LXNwYWNlIG1pc3Npb25zIHRvIGZhcnRoZXIgcGxhbmV0cyBsaWtlIE1hcnMuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
