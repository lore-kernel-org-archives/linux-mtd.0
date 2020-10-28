Return-Path: <SRS0=0HiW=ED=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED373C388F7
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 13:44:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E540D24724
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 13:44:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sZwYVHds"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E540D24724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1D4uFaO0fNINzxvzwKRyl7pwBvVlL6NwDd0Sj63sPYs=; b=sZwYVHdsF6rAHq3cEMqMukNip
	/m6C+X5ChFcsLYEs31iq1HDl9haZYqsdompZgeOBFxV+SKJe1XF6r4DMFJuO6zXguwqcXJozG0n4C
	qcaOnuzDfZPJaJ09543IlTQQE/VIReFO+ivQX8q7kGbeQaAkfSPNUPiL6yliimC32d2E+W/RQwC5n
	gv1PMM0SUbtPWZFCogeS0snAr4+fD/g907iyPpdjfTMMaNnmLqMc/h24eakkZeiBn0hpFMY/UDQSn
	bhEJzU/9ZAXuWfw5Q1GmoaUoBCaO9mA1bv5fu7dM6oP1CFf3pgao2rBgwaEbEkMHQrjKWMQ/34F6h
	GuT0kjpRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXljE-0004NO-DA; Wed, 28 Oct 2020 13:43:04 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXljA-0004Me-Sz
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2020 13:43:02 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5343B240013;
 Wed, 28 Oct 2020 13:42:57 +0000 (UTC)
Date: Wed, 28 Oct 2020 14:42:55 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manuel Dipolt <mdipolt@robart.cc>
Subject: Re: [PATCH v7] mtd: rawnand: sunxi: Add MDMA support
Message-ID: <20201028144255.1779f855@xps13>
In-Reply-To: <154840787.280672.1602517282173.JavaMail.zimbra@robart.cc>
References: <154840787.280672.1602517282173.JavaMail.zimbra@robart.cc>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_094301_115402_9C912443 
X-CRM114-Status: GOOD (  12.74  )
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
Cc: Roland Ruckerbauer <rruckerbauer@robart.cc>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, maxime <maxime@cerno.tech>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFudWVsLAoKTWFudWVsIERpcG9sdCA8bWRpcG9sdEByb2JhcnQuY2M+IHdyb3RlIG9uIE1v
biwgMTIgT2N0IDIwMjAgMTc6NDE6MjIKKzAyMDAgKENFU1QpOgoKPiBUaGlzIHBhdGNoIGVuYWJs
ZXMgTkFORCBNRE1BIChNQlVTIERNQSkgbW9kZSBmb3IgCj4gdGhlIEFsbHdpbm5lciBTb0NzIEEy
My9BMzMvSDMuIAo+IAo+IFRoZSBETUEgdHJhbnNmZXIgbWV0aG9kIGdldHMgc2V0cyBub3cgdG8g
TUJVUyBETUEgYXMgZGVmYXVsdCBmb3IKPiB0aGUgc3VuOGktYTIzLW5hbmQtY29udHJvbGxlciAo
dGlsbCBub3cgRE1BIHRyYW5zZmVyIHdhcyBleGVjdXRlZAo+IHZpYSB0aGUgc2hhcmVkIERNQSBl
bmdpbmUpLgo+IAo+IFRoZSBtYWluIGFkdmFudGFnZSBpcyBtb3JlIGJhbmR3aWR0aCBmb3IgdGhl
IHVzZXJzIG9mIHRoZSBzaGFyZWQgRE1BCj4gZW5naW5lIGFuZCBhbHNvIHRoYXQgdGhlIE1CVVMg
RE1BIHNldHVwIHJlcXVpcmVzIGxlc3MgY29uZmlndXJhdGlvbgo+IGVmZm9ydC4gRm9yIGV4YW1w
bGUgeW91IGRvbid0IG5lZWQgdG8gZGVmaW5lIGEgZGVkaWNhdGVkIERNQSBjaGFubmVsCj4gaW4g
dGhlIGRldmljZS10cmVlIGFueSBtb3JlLgo+IAo+IAo+IFJldmlld2VkLWJ5OiBCb3JpcyBCcmV6
aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1h
bnVlbCBEaXBvbHQgPG1hbnVlbC5kaXBvbHRAcm9iYXJ0LmNjPgoKSSB0ZXN0ZWQgeW91ciBwYXRj
aCwgaXQgYnJlYWtzIG15IENISVAgcHJvIChzdW41aSBSOCk6CgpbICAgIDEuNzc1NjA2XSBuYW5k
OiBkZXZpY2UgZm91bmQsIE1hbnVmYWN0dXJlciBJRDogMHg5OCwgQ2hpcCBJRDogMHhkNwpbICAg
IDEuNzgyMTY4XSBuYW5kOiBUb3NoaWJhIFRDNThURUc1RENMVEEwMApbICAgIDEuNzg2MjkyXSBu
YW5kOiA0MDk2IE1pQiwgTUxDLCBlcmFzZSBzaXplOiA0MDk2IEtpQiwgcGFnZSBzaXplOiAxNjM4
NCwgT09CIHNpemU6IDEyODAKWyAgICAxLjc5ODAzN10gU2Nhbm5pbmcgZGV2aWNlIGZvciBiYWQg
YmxvY2tzClsgICAgMi44MDg3MjhdIHN1bnhpX25hbmQgMWMwMzAwMC5uYW5kLWNvbnRyb2xsZXI6
IHdhaXQgaW50ZXJydXB0IHRpbWVkb3V0ClsgICAgMi45ODMwMzFdIHJhbmRvbTogZmFzdCBpbml0
IGRvbmUKWyAgICAzLjg0ODcxOV0gc3VueGlfbmFuZCAxYzAzMDAwLm5hbmQtY29udHJvbGxlcjog
d2FpdCBpbnRlcnJ1cHQgdGltZWRvdXQKWyAgICA0LjAxNzUwMV0gcmFuZG9tOiBjcm5nIGluaXQg
ZG9uZQpbICAgIDQuODU5MDUwXSBzdW54aV9uYW5kIDFjMDMwMDAubmFuZC1jb250cm9sbGVyOiB3
YWl0IGZvciBlbXB0eSBjbWQgRklGTyB0aW1lZG91dApbICAgIDUuODcwMjcwXSBzdW54aV9uYW5k
IDFjMDMwMDAubmFuZC1jb250cm9sbGVyOiB3YWl0IGZvciBlbXB0eSBjbWQgRklGTyB0aW1lZG91
dApbICAgIDYuODgxNDA2XSBzdW54aV9uYW5kIDFjMDMwMDAubmFuZC1jb250cm9sbGVyOiB3YWl0
IGZvciBlbXB0eSBjbWQgRklGTyB0aW1lZG91dApbICAgIDYuODkyNDQ0XSBuYW5kX2JidDogY2Fu
J3Qgc2NhbiBmbGFzaCBhbmQgYnVpbGQgdGhlIFJBTS1iYXNlZCBCQlQKWyAgICA2LjkwMjI2OF0g
c3VueGlfbmFuZCAxYzAzMDAwLm5hbmQtY29udHJvbGxlcjogZmFpbGVkIHRvIGluaXQgbmFuZCBj
aGlwcwpbICAgIDYuOTEyOTI1XSBzdW54aV9uYW5kOiBwcm9iZSBvZiAxYzAzMDAwLm5hbmQtY29u
dHJvbGxlciBmYWlsZWQgd2l0aCBlcnJvciAtMTEwCgpJIGRvbid0IGhhdmUgdGhlIHRpbWUgdG8g
ZGVidWcgaXQgcmlnaHQgbm93LCBJJ20gc29ycnkuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
