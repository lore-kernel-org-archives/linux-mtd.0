Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7FAC54FCB
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 13:29:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F22C206CD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 13:29:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ri5YUL18"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F22C206CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0vksW6SRQn/PFAoZu5YzKDQ6U6XoQq09ZtsOPB3MyU0=; b=Ri5YUL18bur69Z
	snaeSJkfRaeiIzaZ5vP2czrqJ1NW5c7K4LqNB6/w9WnjzqhN6iCKRCa6ABi3zLHyavCWvEFz5E9c4
	nsSSDuDy1p7tS4v/bF64aH6U6mFFkq5K8A0QO4+B1USwbUxq1VjsHWkrRxkaVdFnEkxMSJtBdjJ+x
	RJj03HEih2+D0rvZl5ruHUcTlJg3NNG8Y+Z0owXapp/c25hk9sEWo9lfsEDqvHnz/x7cSRvjCjjWT
	u0W6YDzB4jhYc5nw+U6Fv9V7Zv4Gb8iOm69mTxoV3p6/00OcIMAhZmdirI9myyplxmH1zCgh4jRaF
	BDtD+zOs2tPfq68vCcLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT3p7-0002La-5s; Mon, 27 Apr 2020 13:29:25 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT3p4-0002KZ-LL
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 13:29:24 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 25CD520000A;
 Mon, 27 Apr 2020 13:29:14 +0000 (UTC)
Date: Mon, 27 Apr 2020 15:29:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [RFC PATCH] mtd: lpddr: Fix bad logic in print_drs_error
Message-ID: <20200427152913.47a48b46@xps13>
In-Reply-To: <2e19547dcec386b47923211896f43053b60ebc60.camel@perches.com>
References: <2e19547dcec386b47923211896f43053b60ebc60.camel@perches.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_062922_972818_83B384E8 
X-CRM114-Status: GOOD (  18.25  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSm9lLAoKSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4gd3JvdGUgb24gTW9uLCAzMCBN
YXIgMjAyMCAxMjo1Njo1OSAtMDcwMDoKCj4gVXBkYXRlIGxvZ2ljIGZvciBicm9rZW4gdGVzdC4K
PiBVc2UgYSBtb3JlIGNvbW1vbiBsb2dnaW5nIHN0eWxlLgo+IAo+IE1pc2NlbGxhbmVhOgo+IAo+
IG8gQ29hbGVzY2UgZm9ybWF0cwo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvZSBQZXJjaGVzIDxqb2VA
cGVyY2hlcy5jb20+Cj4gLS0tCj4gCj4gRm91bmQgYnkgaW5zcGVjdGlvbiBvZiBpbmNsdWRlIGZp
bGVzIHVzaW5nIHByaW50ay4KPiAKPiBJdCBhcHBlYXJzIHRoZSBsb2dpYyBpbiB0aGlzIGZ1bmN0
aW9uIGlzIGJyb2tlbiBmb3IgdGhlCj4gY29uc2VjdXRpdmUgdGVzdHMgb2YKPiAKPiAJaWYgKHBy
b2dfc3RhdHVzICYgMHgzKQo+IAkJLi4uCj4gCWVsc2UgaWYgKHByb2dfc3RhdHVzICYgMHgyKQo+
IAkJLi4uCj4gCWVsc2UgKHByb2dfc3RhdHVzICYgMHgxKQo+IAkJLi4uCj4gCj4gTGlrZWx5IHRo
ZSBmaXJzdCB0ZXN0IHNob3VsZCBiZQo+IAo+IAlpZiAoKHByb2dfc3RhdHVzICYgMHgzKSA9PSAw
eDMpCgpJIGhhZCBhIGhhcmQgdGltZSB1bmRlcnN0YW5kaW5nIHRoZSBwYXRjaCBqdXN0IHdpdGgg
dGhlIGNvbW1pdCBsb2csIEkKdGhpbmsgdGhlIGFib3ZlIHRleHQgaXMgYXMgaW1wb3J0YW50LgoK
SW4gZmFjdCwgd291bGQgeW91IG1pbmQgZG9pbmcgdGhlIHByaW50ay0+cHJfbm90aWNlIGluIGEg
Zmlyc3QgcGF0Y2gsCmFuZCBmaXggdGhlIHdyb25nIGNvbmRpdGlvbiBpbiBhIHNlcGFyYXRlIGNo
YW5nZT8KCj4gCj4gQW5kIHRoaXMgZnVuY3Rpb24gaXMgb25seSB1c2VkIGluIGRyaXZlcnMvbXRk
L2xwZGRyL2xwZGRyX2NtZHMuYwo+IHBlcmhhcHMgaXQgc2hvdWxkIGJlIG1vdmVkIHRoZXJlLgoK
QWdyZWVkLCBkbyBub3QgaGVzaXRhdGUgdG8gbW92ZSB0aGUgZnVuY3Rpb24gYXMgc3VnZ2VzdGVk
IGluIGEgdGhpcmQKcGF0Y2guCgo+IAo+ICBpbmNsdWRlL2xpbnV4L210ZC9wZm93LmggfCAzMSAr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNl
cnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9tdGQvcGZvdy5oIGIvaW5jbHVkZS9saW51eC9tdGQvcGZvdy5oCj4gaW5kZXggMTIyZjM0My4u
MWMwOGU3NSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L210ZC9wZm93LmgKPiArKysgYi9p
bmNsdWRlL2xpbnV4L210ZC9wZm93LmgKPiBAQCAtMTI3LDMxICsxMjcsMjggQEAgc3RhdGljIGlu
bGluZSB2b2lkIHByaW50X2Ryc19lcnJvcih1bnNpZ25lZCBkc3IpCj4gIAlpbnQgcHJvZ19zdGF0
dXMgPSAoZHNyICYgRFNSX1JQUykgPj4gODsKPiAgCj4gIAlpZiAoIShkc3IgJiBEU1JfQVZBSUxB
QkxFKSkKPiAtCQlwcmludGsoS0VSTl9OT1RJQ0UiRFNSLjE1OiAoMCkgRGV2aWNlIG5vdCBBdmFp
bGFibGVcbiIpOwo+IC0JaWYgKHByb2dfc3RhdHVzICYgMHgwMykKPiAtCQlwcmludGsoS0VSTl9O
T1RJQ0UiRFNSLjksODogKDExKSBBdHRlbXB0IHRvIHByb2dyYW0gaW52YWxpZCAiCj4gLQkJCQkJ
CSJoYWxmIHdpdGggNDFoIGNvbW1hbmRcbiIpOwo+ICsJCXByX25vdGljZSgiRFNSLjE1OiAoMCkg
RGV2aWNlIG5vdCBBdmFpbGFibGVcbiIpOwo+ICsKPiArCWlmICgocHJvZ19zdGF0dXMgJiAweDAz
KSA9PSAweDAzKQo+ICsJCXByX25vdGljZSgiRFNSLjksODogKDExKSBBdHRlbXB0IHRvIHByb2dy
YW0gaW52YWxpZCBoYWxmIHdpdGggNDFoIGNvbW1hbmRcbiIpOwo+ICAJZWxzZSBpZiAocHJvZ19z
dGF0dXMgJiAweDAyKQo+IC0JCXByaW50ayhLRVJOX05PVElDRSJEU1IuOSw4OiAoMTApIE9iamVj
dCBNb2RlIFByb2dyYW0gYXR0ZW1wdCAiCj4gLQkJCQkJImluIHJlZ2lvbiB3aXRoIENvbnRyb2wg
TW9kZSBkYXRhXG4iKTsKPiArCQlwcl9ub3RpY2UoIkRTUi45LDg6ICgxMCkgT2JqZWN0IE1vZGUg
UHJvZ3JhbSBhdHRlbXB0IGluIHJlZ2lvbiB3aXRoIENvbnRyb2wgTW9kZSBkYXRhXG4iKTsKPiAg
CWVsc2UgaWYgKHByb2dfc3RhdHVzICYgIDB4MDEpCj4gLQkJcHJpbnRrKEtFUk5fTk9USUNFIkRT
Ui45LDg6ICgwMSkgUHJvZ3JhbSBhdHRlbXB0IGluIHJlZ2lvbiAiCj4gLQkJCQkJCSJ3aXRoIE9i
amVjdCBNb2RlIGRhdGFcbiIpOwo+ICsJCXByX25vdGljZSgiRFNSLjksODogKDAxKSBQcm9ncmFt
IGF0dGVtcHQgaW4gcmVnaW9uIHdpdGggT2JqZWN0IE1vZGUgZGF0YVxuIik7Cj4gKwo+ICAJaWYg
KCEoZHNyICYgRFNSX1JFQURZX1NUQVRVUykpCj4gLQkJcHJpbnRrKEtFUk5fTk9USUNFIkRTUi43
OiAoMCkgRGV2aWNlIGlzIEJ1c3lcbiIpOwo+ICsJCXByX25vdGljZSgiRFNSLjc6ICgwKSBEZXZp
Y2UgaXMgQnVzeVxuIik7Cj4gIAlpZiAoZHNyICYgRFNSX0VTUykKPiAtCQlwcmludGsoS0VSTl9O
T1RJQ0UiRFNSLjY6ICgxKSBFcmFzZSBTdXNwZW5kZWRcbiIpOwo+ICsJCXByX25vdGljZSgiRFNS
LjY6ICgxKSBFcmFzZSBTdXNwZW5kZWRcbiIpOwo+ICAJaWYgKGRzciAmIERTUl9FUkFTRV9TVEFU
VVMpCj4gLQkJcHJpbnRrKEtFUk5fTk9USUNFIkRTUi41OiAoMSkgRXJhc2UvQmxhbmsgY2hlY2sg
ZXJyb3JcbiIpOwo+ICsJCXByX25vdGljZSgiRFNSLjU6ICgxKSBFcmFzZS9CbGFuayBjaGVjayBl
cnJvclxuIik7Cj4gIAlpZiAoZHNyICYgRFNSX1BST0dSQU1fU1RBVFVTKQo+IC0JCXByaW50ayhL
RVJOX05PVElDRSJEU1IuNDogKDEpIFByb2dyYW0gRXJyb3JcbiIpOwo+ICsJCXByX25vdGljZSgi
RFNSLjQ6ICgxKSBQcm9ncmFtIEVycm9yXG4iKTsKPiAgCWlmIChkc3IgJiBEU1JfVlBQUykKPiAt
CQlwcmludGsoS0VSTl9OT1RJQ0UiRFNSLjM6ICgxKSBWcHAgbG93IGRldGVjdCwgb3BlcmF0aW9u
ICIKPiAtCQkJCQkiYWJvcnRlZFxuIik7Cj4gKwkJcHJfbm90aWNlKCJEU1IuMzogKDEpIFZwcCBs
b3cgZGV0ZWN0LCBvcGVyYXRpb24gYWJvcnRlZFxuIik7Cj4gIAlpZiAoZHNyICYgRFNSX1BTUykK
PiAtCQlwcmludGsoS0VSTl9OT1RJQ0UiRFNSLjI6ICgxKSBQcm9ncmFtIHN1c3BlbmRlZFxuIik7
Cj4gKwkJcHJfbm90aWNlKCJEU1IuMjogKDEpIFByb2dyYW0gc3VzcGVuZGVkXG4iKTsKPiAgCWlm
IChkc3IgJiBEU1JfRFBTKQo+IC0JCXByaW50ayhLRVJOX05PVElDRSJEU1IuMTogKDEpIEFib3J0
ZWQgRXJhc2UvUHJvZ3JhbSBhdHRlbXB0ICIKPiAtCQkJCQkib24gbG9ja2VkIGJsb2NrXG4iKTsK
PiArCQlwcl9ub3RpY2UoIkRTUi4xOiAoMSkgQWJvcnRlZCBFcmFzZS9Qcm9ncmFtIGF0dGVtcHQg
b24gbG9ja2VkIGJsb2NrXG4iKTsKPiAgfQo+ICAjZW5kaWYgLyogX19MSU5VWF9NVERfUEZPV19I
ICovCj4gCj4gCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
