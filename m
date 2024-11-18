Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F85FD49205
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2024 10:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6mn8E5yRRr7dC4e0zLjX3tzg1nLpwNb+AJ7kyXUzUnE=; b=zJZjqeXXzyav2eYzMKa4H+0lda
	uk4+CguflDl0Vr0e8KWxTrvY081xNV6Oi5892G2lxpOVBFVTEJbF6F8QAg/W5WogOLqwgK6oFCJIW
	LACoZCzxV+sJvTc56k2CrLXwWmqonUP4V3y+Ghmy1nvsVgUuofBz88hTCvM/niDpjSwNbSljsZm4v
	bZHb1S75dqHV73wIK/2Hs5oBz6gJE5YVWyACk0L8MDkVRM/Wklq9Sjka741mT60PUz0/ciA2h2JwO
	yaisbmcIXctBUAsr5xT33QFi2S0pYwTcwR4mwwN1f9EO5gtExz/JUO5RcNfYqyBBGClutJhpBypiu
	1cJuzUnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCyaU-00000008zrJ-1mY5;
	Mon, 18 Nov 2024 10:02:30 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCyaR-00000008znw-2sMb
	for linux-mtd@lists.infradead.org;
	Mon, 18 Nov 2024 10:02:29 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 068482BFA22;
	Mon, 18 Nov 2024 11:02:17 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id PzSAWl59avLp; Mon, 18 Nov 2024 11:02:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 878902BFA27;
	Mon, 18 Nov 2024 11:02:16 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id olAo2SSEAWer; Mon, 18 Nov 2024 11:02:16 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6395D2BFA22;
	Mon, 18 Nov 2024 11:02:16 +0100 (CET)
Date: Mon, 18 Nov 2024 11:02:16 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <302574690.38068166.1731924136160.JavaMail.zimbra@nod.at>
In-Reply-To: <CAOf5uwkhgDxUprK+fp09dWh1aXMNPJC7YPjFNChT2Qj86do4hQ@mail.gmail.com>
References: <CAOf5uw=e1wZh2ifvSXYMe4H28R5DNuos7uPziFMGs8T6nVeYWA@mail.gmail.com> <b03b6625-3971-76c4-d045-6e35ec220caf@huawei.com> <CAOf5uwm=nLLcyvtc7EGK=rdu6N+j6t6_hYyCWcB3QMACOAEx2A@mail.gmail.com> <8df70e11-3278-06ed-5952-c808035bb679@huawei.com> <CAOf5uwkhgDxUprK+fp09dWh1aXMNPJC7YPjFNChT2Qj86do4hQ@mail.gmail.com>
Subject: Re: Some information about direct-io support on ubifs
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF132 (Linux)/8.8.12_GA_3809)
Thread-Topic: Some information about direct-io support on ubifs
Thread-Index: oKX4i2lL3Zl6uTBbN4CDaF8rSCjBmw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_020227_862408_F023E068 
X-CRM114-Status: UNSURE (   8.18  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pY2hhZWwgTmF6emFyZW5v
IFRyaW1hcmNoaSIgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+ID4+PiBJIHdvdWxk
IGxpa2UgdG8gaGF2ZSBzb21lIGluZm9ybWF0aW9uIG9uIGhvdyB0byBpbXBsZW1lbnQgZGlyZWN0
LWlvCj4+ID4+PiBzdXBwb3J0IGluIHViaWZzLiBJIGhhdmUgdHJpZWQgdG8gbW91bnQgc3F1YXNo
ZnMgaW1hZ2UgYXMgZmlsZSBpbgo+PiA+Pj4gdWJpZnMgdXNpbmcgbG9vcGJhY2sgYW5kIGRpcmVj
dC1pbyBidXQgaXQgc2VlbXMgdGhhdCBsb29wIGNhbiBub3QKPj4gPj4+IGhhbmRsZSB3aGVuIHRo
aXMgaXMgb24gdG9wIG9mIHViaWZzLiBGcm9tIHdoYXQgSSB1bmRlcnN0YW5kIGZyb20gdGhlCj4+
ID4+PiBjb2RlIGl0IHNlZW1zIHRoYXQgdGhlIHJlcXVpcmVtZW50IGlzIHRoYXQgdGhlIGRpcmVj
dC1pbyBpcwo+PiA+Pj4gaW1wbGVtZW50ZWQgaW4gdGhlIGZpbGVzeXN0ZW0gd2hlcmUgdGhlIGZp
bGUgaXMgc3RvcmVkLiBJIGhhdmUKPj4gPj4+IHNpbXVsYXRlZCB1c2luZyBuYW5kIHNpbS4gVGhl
IGlkZWEgaXMgdG8gcmVkdWNlIHRoZSBidWZmZXJpbmcuIEknbQo+PiA+Pj4gb3BlbiB0byBoYXZl
IG90aGVyIHN1Z2dlc3Rpb25zIHJlZ2FyZGluZyB0aGlzIHRvby4KCldoeSBhcmUgeW91IHVzaW5n
IFVCSUZTIGFueXdheSBmb3IgdGhpcz8gSnVzdCBwbGFjZSB0aGUgc3F1YXNoZnMgaW5zaWRlCmFu
IFVCSSB2b2x1bWUuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
