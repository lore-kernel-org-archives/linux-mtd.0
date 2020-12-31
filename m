Return-Path: <SRS0=XVws=GD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,GB_FAKE_RF_SHORT,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEBEC433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Dec 2020 05:28:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7695B207A0
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Dec 2020 05:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7695B207A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=szpital-wielun.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UMrfLPrINIUzUdWQZsCrBHkW+8poO8xT7lKPrdiQz6Y=; b=yX6QCbXuZ0fnIA
	CZkhjUPyrZlAuRpZqRH3+WqM7i8SaxFh3fQBESOGzdZvigOL/sunF+Y2pnF/ybFf1lU0tCC1ntUPb
	B7xmE7n7pZ83N4ayaCWIBWGn/gjY1ruQFX/tzmDRFU284jhWm+kAjeh1pyd+jhDEeADBjnDqKu5rQ
	4avNyQQ+kF0Bhn5Ao9PCR4Qt4h6tljPrnKAnoLJAOUqs3K4JtTJVcqUqSu60qbCVqtgk+ZzTLec6J
	G1N14LJZ8Us84Dx3K9DIzGrPtTpzCWcAn/7BalfefMOse4gx7X97fSupIuUuxX5Icu92ncUSDtMWE
	FGMu3G4Du6N3dBv14AjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuqUG-0000a0-3o; Thu, 31 Dec 2020 05:27:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuqUB-0000Zq-Qx
 for linux-mtd@merlin.infradead.org; Thu, 31 Dec 2020 05:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=SHmzmPmmFyBz5Kli4Voz+WNoViKhdVbl7ldzxD58hIA=; b=qWznhBIRdnXbSes2aqfCq14oFZ
 8f0PZgycT4vO9LurgeARsbMwLa4R+Wj9UjtALk2U5MLcf+Umqh9GB0ymDEQLIt/mZia4fnv2yvwPZ
 EPuWN/kUR//JIw8Rixy8+eLpfeq9gwLKE5OdIco3v9fQ5ehDpiGciTGMzgC5aa9YteoxzSV4XvPNj
 dB0jrVXxot3WgegCDSpDYWiwe68+f5mpNvMilJjujyM8ccUTkJC0+G4x6gBt39wBvy3mGJU2Udgg6
 K0Eo24Z5mob7G4Ji3EdAhOU/zDq2zf1S8B5AhdDenzEZ8Lkio8oWJaIFNHVMP4S5S20FrmqQOt0L5
 foJccxEg==;
Received: from mail.szpital-wielun.pl ([156.67.116.115])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1kuqU6-000Pl3-LW
 for linux-mtd@lists.infradead.org; Thu, 31 Dec 2020 05:26:53 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.szpital-wielun.pl (Postfix) with ESMTP id 2ABDD12950CB;
 Thu, 31 Dec 2020 06:06:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 szpital-wielun.pl; h=content-language:content-transfer-encoding
 :content-type:content-type:mime-version:user-agent:date:date
 :message-id:subject:subject:from:from; s=default; t=1609391199;
 x=1611205600; bh=SHmzmPmmFyBz5Kli4Voz+WNoViKhdVbl7ldzxD58hIA=; b=
 l23hl0Y4PLP+IQzTYiCLdlvorMS/bgxCz2JwUrdKw2/gouhcxz6CD+GtaerAVx28
 AKOJRutnxLFV/kMBSbafvxjbenDAyuNMw7kKwvduk1IDPkckgMyOkZda8LO5WW74
 LtorKPWYZAR8P5B9qnMaYv+OekCTXWEPRu6Z+BKmDNA=
X-Virus-Scanned: Debian amavisd-new at mail.szpital-wielun.pl
Received: from mail.szpital-wielun.pl ([127.0.0.1])
 by localhost (mail.szpital-wielun.pl [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id BoQJGoHyOPbF; Thu, 31 Dec 2020 06:06:39 +0100 (CET)
Received: from szpital-wielun.pl (unknown [113.172.163.122])
 (Authenticated sender: a.teluk@szpital-wielun.pl)
 by mail.szpital-wielun.pl (Postfix) with ESMTPSA id 161621294DAE;
 Thu, 31 Dec 2020 06:05:45 +0100 (CET)
To: "stefano tubaro" <stefano.tubaro@polimi.it>,
 "m galanti" <m.galanti@sit-consulting.it>, "ssiitt" <ssiitt@iol.it>,
 "f federici" <f.federici@sit-consulting.it>,
 "segreteria studenti" <segreteria.studenti@polimi.it>,
 "linux mtd" <linux-mtd@lists.infradead.org>,
 "joern" <joern@wohnheim.fh-wedel.de>
From: massiblue <a.teluk@szpital-wielun.pl>
Subject: =?UTF-8?Q?Fw=3AMassiblue=40libero.it?=
Message-ID: <21a8e6eb-082f-4b62-b5c9-82e2dd563aad@szpital-wielun.pl>
Date: Wed, 30 Dec 2020 23:05:49 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201231_052653_157803_879A19AD 
X-CRM114-Status: UNSURE (   2.71  )
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

aHR0cHM6Ly9iaXQubHkvM3BzVFZNdwoKCgoKCgoKU2luY2VyYW1lbnRlLG1hc3NpYmx1ZUBsaWJl
cm8uaXQKCgoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCiBBcyBob3NwaXRhbGl6YXRpb24gcmF0ZXMgYWNyb3Nz
IHRoZSBjb3VudHJ5IHJpc2UsIGRlbWFuZCBmb3IgbnVyc2VzIGludGVuc2lmaWVzCkluIHRoZSBw
YXN0IHR3byBtb250aHMsIGhvc3BpdGFsaXphdGlvbnMgYXJlIG1vcmUgdGhhbiB0aHJlZSB0aW1l
cyB3aGF0IHRoZXkgd2VyZSBkdXJpbmcgdGhlIGZpcnN0IHdhdmUgb2YgdGhlIGNvcm9uYXZpcnVz
IHBhbmRlbWljIGFuZCBtYW55IGhvc3BpdGFscyBhcmUgdHVybmluZyB0byB0cmF2ZWwgbnVyc2Vz
IHRvIGZpbGwgc3RhZmZpbmcgc2hvcnRhZ2VzLiBDQlMgTmV3cyBzZW5pb3IgbWVkaWNhbCBjb3Jy
ZXNwb25kZW50IERyLiBUYXJhIE5hcnVsYSBqb2lucyDigJxDQlMgVGhpcyBNb3JuaW5n4oCdIHdp
dGggYSBzdG9yeSBvZiBhIHRyYXZlbCBudXJzZSB3aG8gaGFzIHNhY3JpZmljZWQgYmVpbmcgd2l0
aCBoZXIgeW91bmcgY2hpbGRyZW4gdG8gYmUgb24gdGhlIGZyb250bGluZXMgc2F2aW5nIGxpdmVz
LgpBcyBUaG91c2FuZHMgT2YgSXNyYWVsaSBUb3VyaXN0cyBWaXNpdCBEdWJhaSwgQSBTbWFsbCBK
ZXdpc2ggQ29tbXVuaXR5IEdldHMgQSBCb29zdApUaGUgY29tbXVuaXR5IG1haW50YWlucyBhIGxv
dyBwcm9maWxlLCBnaXZlbiBzZW5zaXRpdml0aWVzIGluIHRoZSByZWdpb24uIFNpbmNlIHRoZSBJ
c3JhZWwtVW5pdGVkIEFyYWIgRW1pcmF0ZXMgcGVhY2UgZGVhbCB3YXMgYW5ub3VuY2VkLCBpdCBo
YXMgc2NyYW1ibGVkIHRvIGFjY29tbW9kYXRlIGEgcnVzaCBvZiBKZXdpc2ggdmlzaXRvcnMuCkhv
dyB0aGUgTm92YXZheCBDb3ZpZC0xOSBWYWNjaW5lIFdvcmtzClVzaW5nIGEgY29yb25hdmlydXMg
cHJvdGVpbiB0byB0cmFpbiB0aGUgaW1tdW5lIHN5c3RlbS4KSm9uYXRoYW4gUG9sbGFyZDogSXNy
YWVsIHNweSBncmVldGVkIGJ5IE5ldGFueWFodSBhZnRlciBmbHlpbmcgdG8gVGVsIEF2aXYKVGhl
IEFtZXJpY2FuLCB3aG8gd2FzIGphaWxlZCBmb3IgMzAgeWVhcnMgZm9yIHNlbGxpbmcgVVMgc2Vj
cmV0cywgaXMgd2VsY29tZWQgYnkgSXNyYWVsJ3MgUE0uClByZXNlcnZpbmcgTWFjYW8ncyBoYW5k
bWFkZSBzaWducyBpbiB0aGUgZGlnaXRhbCBhZ2UKUGVyY2hlZCBvbiBhIHN0b29sIGluIGhpcyBk
dXN0eSB3b3Jrc2hvcCBpbiBNYWNhbywgTGFtIFdlbmcgSW8gbG9va3MgbGlrZSBhIHNjaG9sYXIg
b3IgYSBsaWJyYXJpYW4sIGJlc3BlY3RhY2xlZCBhbmQgaW4gZGVlcCBjb25jZW50cmF0aW9uLgpI
YWNraW5nIGZpcm0gY2xhaW1zIGl0IGNhbiBkZWNyeXB0IFNpZ25hbCBhcHAncyBvbi1kZXZpY2Ug
ZW5jcnlwdGlvbgpBIGNvbXBhbnkgY2xhaW1zIGl0IGNhbiBkZWNyeXB0IG1lc3NhZ2VzIHNlbnQg
dXNpbmcgdGhlIFNpZ25hbCBtZXNzZW5nZXIgYXBwIG9uIEFuZHJvaWQgcGhvbmVzLCBkZXNwaXRl
IGl0IGJlaW5nIGNvbnNpZGVyZWQgdG8gYmUgb25lIG9mIHRoZSBtb3N0IHNlY3VyZSBhcHBzIGFy
b3VuZCB0aGF0IG9mZmVycyBlbmQtdG8tZW5kIGVuY3J5cHRpb24uCk5pa2tpIEhhbGV5IFNsYW1t
ZWQgZm9yIOKAmERhdGVk4oCZIFNjYXJlIFRhY3RpYyBEZWNsYXJpbmcgU29jaWFsaXNtIERlbW9j
cmF0c+KAmSAnRGVmYXVsdCBQb2xpY3nigJkKRm9ybWVyIFVTIEFtYmFzc2Fkb3IgdG8gdGhlIFVu
aXRlZCBOYXRpb25zIE5pa2tpIEhhbGV5IGFsc28gaW5zaXN0ZWQgc2hlIHdhcyBzcGVha2luZyBv
dXQg4oCcZm9yIHRoZSBzYWtlIG9mIEFtZXJpY2HigJlzIGZ1dHVyZeKAnSwgYXMgc2hlIG91dGxp
bmVkIGhlciBwb2xpY3kgcHJlZGljdGlvbnMgYWhlYWQgb2YgdGhlIHRyYW5zaXRpb24gb2YgcG93
ZXIgaW4gdGhlIE92YWwgT2ZmaWNlIHRvIERlbW9jcmF0IFByZXNpZGVudC1FbGVjdCBKb2UgQmlk
ZW4uCk11cmRlci1zdWljaWRlIGxlYWRzIHRvIG5ldyBsaWZlIGZvciAyMC15ZWFyLW9sZApBIHN0
b3J5IHRoYXQgYmVnaW5zIHdpdGggYSBzZW5zZWxlc3MgdHJhZ2VkeSBlbmRzIGluIHRyaXVtcGgg
d2hlbiBhIHRlYW0gb2YgcGlvbmVlcmluZyBkb2N0b3JzIGFuZCBudXJzZXMgc2F2ZSB0aGUgbGlm
ZSBvZiBhIGR5aW5nIHlvdW5nIG1vdGhlci4KT3VyIFRvcCBHbG9iYWwgU3RvcmllcyBPZiAyMDIw
IE5vdCBBYm91dCBUaGUgUGFuZGVtaWMKQmV5b25jw6kncyBBZnJpY2EgdmlkZW8sIEludWl0IGFk
dmljZSBvbiByYWlzaW5nIGtpZHMgd2l0aG91dCB5ZWxsaW5nIGFuZCAuLi4gbG9jdXN0cyEgSGVy
ZSdzIHRoZSBzdXJwcmlzaW5nIG1peCBvZiBzdG9yaWVzIEdvYXRzIGFuZCBTb2RhIHJlYWRlcnMg
bG92ZWQgaW4gMjAyMCB0aGF0IGhhdmUgbm90aGluZyB0byBkbyB3aXRoIENPVklELTE5LgpIb3cg
UG9ldHMgVXNlIFB1bmN0dWF0aW9uIGFzIGEgU3VwZXJwb3dlciBhbmQgYSBTZWNyZXQgV2VhcG9u
Ckp1c3QgbGlrZSBsaW5lIGJyZWFrcyBhbmQgc3BhY2luZyBkZWNpc2lvbnMsIHR5cG9ncmFwaGlj
YWwgbWFya3MgY2FuIHNoYXBlIGhvdyBhIHJlYWRlciBoZWFycyB0aGUgbGFuZ3VhZ2UuCkJsYWNr
YnVybiBkZWF0aDogTXVyZGVyIHByb2JlIGFmdGVyIGRlYXRoIG9mICdtdWNoLWxvdmVkJyBmYXRo
ZXIKQSBtYW4gYW5kIGEgd29tYW4gYXJlIGhlbGQgb24gc3VzcGljaW9uIG9mIG11cmRlcmluZyBO
aWdlbCBTY290dCwgd2hvIHdhcyBmb3VuZCB1bmNvbnNjaW91cyBpbiBCbGFja2J1cm4uCkZpcnN0
IExhZHkgc2F5cyBzaGUgaGFzIG5vIGludGVyZXN0IGluIGFwcGVhcmluZyBpbiBtYWdhemluZXMK
Rmlyc3QgTGFkeSBNZWxhbmlhIFRydW1wIGlzIGhlYXJkIHNheWluZyBzaGUgaGFzIG5vIGludGVy
ZXN0IGluIGFwcGVhcmluZyBpbiBtYWdhemluZXMgaW4gYSB0YXBlIHNlY3JldGx5IHJlY29yZGVk
IGJ5IFN0ZXBoYW5pZSBXaW5zdG9uIFdvbGtvZmYsIGEgZm9ybWVyIHNlbmlvciBhZHZpc2VyIHRv
IE1lbGFuaWEgVHJ1bXAuCkJhY2tzdGFnZSB3aXRoLi4uIG91ciBwaWNrIG9mIHRoZSBiZXN0IFRW
IHNob3dzIGFuZCBmaWxtcyBvZiAyMDIwClRWIGFuZCBmaWxtIHByb2R1Y3Rpb24gbWF5IGhhdmUg
YmVlbiBoYWx0ZWQgYnkgdGhlIGNvcm9uYXZpcnVzIHBhbmRlbWljLCBidXQgZm9yIG1hbnkgMjAy
MCB3aWxsIGJlIHRoZSB5ZWFyIHRoZXkgY29uc3VtZWQgbW9yZSBzaG93cyBhbmQgbW92aWVzIHRo
YW4gZXZlciBiZWZvcmUuCkJCQyBFZGl0b3IgQmFzaGVkIEFmdGVyIFBsYWNpbmcgSksgUm93bGlu
ZyBvbiAnR29vZC1Xcml0aW5nIEF3YXJkJyBMaXN0IGZvciBHZW5kZXIgSXNzdWVzIEVzc2F5ClRo
ZSBwZXJzb24gd2hvIGNvbXBpbGVkIHRoZSBhd2FyZCBsaXN0IGRpZCBhY2tub3dsZWRnZSB0aGF0
IFJvd2xpbmcgbWFuYWdlZCB0byBvZmZlbmQg4oCcbWFueSBwZW9wbGXigJ0gaW4g4oCcYSBibG9n
IGFib3V0IHRoZSB0cmFuc2dlbmRlciBkZWJhdGXigJ0sIGFyZ3VpbmcsIGhvd2V2ZXIsIHRoYXQg
4oCcb2ZmZW5jZSBpcyB0aGUgcHJpY2Ugb2YgZnJlZSBzcGVlY2jigJ0uCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
