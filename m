Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFB4C27C79
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 18:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4b+AD+lvuATFT/jWk36l9fyY3jd695lEkB6LHg9luEI=; b=rVO9xImc44XxhO
	Z9Wyl3gCbfI1kB2KpqF82AkDNzwZ411bA3LzpitiaUfYiVnkfisV/0/BRebhVTjiHYKDERoTfiXWE
	lrp4CvBrq3V9u5ZgJ3J7swzgtKzPnDgvh2F3kK0mC1rd59xJ9hDqxER6ULiHUNvf9qqG2CsAyiEsd
	QU64aoeRJJBHiyuQgnP3RQibSkTrZztjSV3rT4eteoOP2tr4PLbVuOucJm7HfLV8kfla91HvdxKYz
	xDmz8K58QgZyy7/Z16ujzu+PIAqtALa7pqE8LI4G5RyxbJa1RcyIWaoEKC4orgXOpDCmiaJLngEuZ
	zFUH/F7UpnVCMlMVzLrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJHN4-0000000CF2I-1n66;
	Mon, 17 Jun 2024 18:46:26 +0000
Received: from qs51p00im-qukt01071701.me.com ([17.57.155.6])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJHN0-0000000CF0N-1QOi
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jun 2024 18:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=1a1hai;
	t=1718649980; bh=0qt6JY0l5BIRoWxzuekw4IctY3CGatEXriuJO5DDUUI=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
	b=OvrARZp6VpH+vuM3Sy8aunE3u7lHISuIHWbeYLJAUVPVtRDDshwU3ZdHV/fBoaGPk
	 NCWglSBhHkqwFSw1hnzZNUG6dJ/acN+ho6QirZJK7VzDbsvkZaaXXWnQHOLI+FKhAF
	 HkpirHfwl9MVLhLNPS62R37pDfmXDfmEyG4hnHGimtX52Rp9oKFbSjJfltwni/WRWz
	 ubb9FcMlXRMtwyOnVKm9hTGoD29smTLpsuuYDQQI/sMLqQllcE06TTf2l0s2WOchq9
	 PoAEp58++liWWmvcyTACZtP/Ze7OayPfXSmmxyyoiZneAhBbdxglpp+vbcFwqqEeco
	 erR+PhrY6KTMg==
Received: from [172.20.144.3] (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
	by qs51p00im-qukt01071701.me.com (Postfix) with ESMTPSA id 624564D00207;
	Mon, 17 Jun 2024 18:46:14 +0000 (UTC)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
From: Gagan Sidhu <broly@mac.com>
In-Reply-To: <296007365.252185.1718649153090.JavaMail.zimbra@nod.at>
Date: Mon, 17 Jun 2024 12:46:10 -0600
Cc: ZhaoLong Wang <wangzhaolong1@huawei.com>,
 chengzhihao1 <chengzhihao1@huawei.com>,
 dpervushin <dpervushin@embeddedalley.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 yangerkun <yangerkun@huawei.com>,
 yi zhang <yi.zhang@huawei.com>
Message-Id: <3841F21D-CA54-456C-9D9C-F06EEA332A30@mac.com>
References: <CFAC276E-E652-40CD-B3D8-563B95E679A8@mac.com>
 <65E62DA3-EF16-44BD-8E51-E751BD2C496F@mac.com>
 <1802911356.251780.1718643160760.JavaMail.zimbra@nod.at>
 <E3E2C13C-1E52-46F2-BE2D-D2592C3369DB@mac.com>
 <F2DCFCE7-68FA-4C09-AE5B-09F2233575F1@mac.com>
 <48D8B89B-0402-4D8B-B045-86104C0C797F@mac.com>
 <303502000.252057.1718647746641.JavaMail.zimbra@nod.at>
 <90A90DA4-8B68-432D-9577-0D3635AF84BB@mac.com>
 <296007365.252185.1718649153090.JavaMail.zimbra@nod.at>
To: Richard Weinberger <richard@nod.at>
X-Mailer: Apple Mail (2.3445.104.21)
X-Proofpoint-GUID: rXbTZeafNsUTrSQnBXVxBnN2JoMEIHeH
X-Proofpoint-ORIG-GUID: rXbTZeafNsUTrSQnBXVxBnN2JoMEIHeH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_13,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2406130160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_114622_554521_91E5032E 
X-CRM114-Status: GOOD (  18.95  )
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

Cgo+IE9uIEp1biAxNywgMjAyNCwgYXQgMTI6MzIgUE0sIFJpY2hhcmQgV2VpbmJlcmdlciA8cmlj
aGFyZEBub2QuYXQ+IHdyb3RlOgo+IAo+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0K
Pj4gVm9uOiAiR2FnYW4gU2lkaHUiIDxicm9seUBtYWMuY29tPgo+Pj4gQUZBSUNULCB0aGlzIGxv
ZyBsaW5lIGlzIG5vdCBwYXJ0IG9mIHRoZSBtYWlubGluZSBrZXJuZWwuCj4+IAo+PiB0aGlzIGlz
IG1haW5saW5lLiBpdOKAmXMganVzdCBub3QgNi54LiBpdOKAmXMgNC4xNC4KPiAKPiBJJ3ZlIGRv
dWJsZSBjaGVja2VkIGFuZCBkaXNhZ3JlZS4KPiBUaGlzIGxpbmUgY29tZXMgZnJvbToKPiBodHRw
czovL2dpdC5vcGVud3J0Lm9yZy8/cD1vcGVud3J0L29wZW53cnQuZ2l0O2E9YmxvYjtmPXRhcmdl
dC9saW51eC9nZW5lcmljL3BlbmRpbmctNC4xNC80ODAtbXRkLXNldC1yb290ZnMtdG8tYmUtcm9v
dC1kZXYucGF0Y2g7aD02Y2RkYWYwMWI3NWNiNThjZmIzNzdmNTY4ZjJjMzc1YWY4N2UyZjFiO2hi
PWMzYmQxMzIxZGUxZTBkODE0ZjVjZmM0ZjQ5NGY2YjJmYjFmNTEzM2IKCm5vIGkga25vdyB0aGF0
LCB0aGF04oCZcyB0aGUgcGF0Y2ggaSBzaG93ZWQgeW91LiBpIG1lYW50IHRoZSByZXN0IG9mIGl0
IGlzIG1haW5saW5lLiB0aGUgcGF0Y2ggb2J2aW91c2x5IGlzIG5vdC4KPiAKPiBJbiByZWNlbnQg
T3BlbldSVCBrZXJuZWxzIEkgc2VlOgo+IGh0dHBzOi8vZ2l0Lm9wZW53cnQub3JnLz9wPW9wZW53
cnQvb3BlbndydC5naXQ7YT1ibG9iO2Y9dGFyZ2V0L2xpbnV4L2dlbmVyaWMvcGVuZGluZy01LjE1
LzQ5My11Ymktc2V0LVJPT1RfREVWLXRvLXViaWJsb2NrLXJvb3Rmcy1pZi11bnNldC5wYXRjaDto
PTI2NmE2MzMxYzJhY2MwZjdjMTdkOWFjNzJmNTQ2NTlkMzFiNTYyNDk7aGI9SEVBRAo+IAo+IExv
b2tzIGxpa2UgaW4gcmVjZW50IHZlcnNpb25zIHRoZSBwYXRjaCBpbiBxdWVzdGlvbiBkb2VzICpu
b3QqIGNhdXNlIGEgcmVncmVzc2lvbi4KCnRoYXQgcGF0Y2ggaXMgYWxzbyBhcHBsaWVkIGluIG15
IHZlcnNpb24gYXMgd2VsbCwgc28gaSBkb27igJl0IHNlZSBob3cgdGhpcyBhdm9pZHMgdGhlIHJl
Z3Jlc3Npb24uCgpodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIv
ZHJpdmVycy9tdGQvbXRkY29yZS5jI0w3NzQKCm1pbmUgc2F5cyAiWzYuMDUxNDI2XSBtdGQ6IGRl
dmljZSAxMiAocm9vdGZzKSBzZXQgdG8gYmUgcm9vdCBmaWxlc3lzdGVtIgoKd2hpY2ggaXMgc2lt
cGx5IHRoZSBjYWxsIGZyb20gZHJpdmVycy9tdGQvbXRkY29yZS5jCgpzbyB0aGUgcm9vdGZzIGRl
dmljZSBpcyBzZXQgY29ycmVjdGx5LiBpdOKAmXMganVzdCBub3QgYm9vdGluZyBmcm9tIGl0LgoK
dGhlIHJlZ3Jlc3Npb24gY29tZXMgZnJvbSBoYXZpbmcgR0xVRUJJK0JMT0NLIGVuYWJsZWQsIGl0
IHNlZW1zLCBhcmUgdGhleSBmaWdodGluZyBmb3Ivb3BlcmF0aW5nIG9uIHRoZSBzYW1lIHBhcnRp
dGlvbj8KCj4gCj4+PiAoMzEsIDEyKSB3b3VsZCBiZSBtdGRibG9jazEyLgo+Pj4gSG93IGRvZXMg
eW91ciBrZXJuZWwga25vdyB0aGF0IG10ZGJsb2NrMTIgc2hhbGwgYmUgdGhlIHJvb3Rmcz8KPj4g
Cj4+IHRoaXMgaXMgYW4gb3BlbndydCBhcHByb2FjaDogaHR0cHM6Ly9vcGVud3J0Lm9yZy9kb2Nz
L3RlY2hyZWYvZmlsZXN5c3RlbXMgKHVuZGVyCj4+IOKAnHRlY2huaWNhbCBkZXRhaWxz4oCdLCB0
aGlyZCBwYXJhZ3JhcGgpCj4+IAo+PiBlc3NlbnRpYWxseSB0aGVyZeKAmXMgYSBmZWF0dXJlIHRo
ZXkgYWRkIHRvIHRoZSBrZXJuZWwgKHZpYSBwYXRjaCkgd2hlcmUgeW91IGNhbgo+PiBlbmFibGUg
YSBmZWF0dXJlIHRoYXQgc2V0cyB0aGUgcm9vdCBkZXZpY2UgYmFzZWQgb24gdGhlIG5hbWUgb2Yg
dGhlIHBhcnRpdGlvbi4KPiAKPiBTbywgdGhpcyBpcyBhbGwgbm90IG1haW5saW5lLiA6LS8KCmkg
ZGlkIHNheSBvcGVud3J0IGF0IHRoZSBzdGFydCwgYW5kIGkgdGhpbmsgdGhhdOKAmXMgcHJldHR5
IGNsb3NlIHRvIG1haW5saW5lIGFzIGl0IGdldHMuCgpzb21ldGltZXMgdGhlc2UgcGF0Y2hlcyBh
cmVu4oCZdCBhcHByb3ByaWF0ZSB0byBwdXNoIHVwc3RyZWFtLiB0aGlzIG9uZSBpcyBub3QgdGhl
IG9uZSBjYXVzaW5nIHRoZSBpc3N1ZS4KCml0IHNlZW1zIHRvIG1lIHRoYXQgdGhlcmUgaXMgYSBw
cm9ibGVtIHdpdGggR0xVRUJJK0JMT0NLIHBsYXlpbmcgdG9nZXRoZXIuIAoKYXMgZmFyIGFzIGkg
Y2FuIHNlZSwgdGhlIHNldHRpbmcgb2YgdGhlIGRldmljZSBpcyBiZWluZyBkb2luZyBieSBtdGRj
b3JlLmMKCml04oCZcyBqdXN0IG5vdCB3b3JraW5nIHdpdGggZ2x1ZWJpIGFuZCBibG9jayBhcmUg
ZW5hYmxlZCwgYW5kIGkgbmVlZCB0byBrbm93IHdoZXRoZXIgZGlzYWJsaW5nIGdsdWViaSB3aWxs
IGFsbG93IGl0IHRvIHdvcmsuCgppbiBvdGhlciB3b3JkcywgaXMgaXQgcG9zc2libGUgZm9yIGds
dWViaSB0byB1c2UgdGhlIHBhcnRpdGlvbiBjcmVhdGVkIGJ5IHViaV9ibG9jaywgYW5kIGFkZCB0
aGUgTVREX1VCSVZPTFVNRSBmbGFnPwoKPiAKPj4gaW4gdGhpcyBjYXNlIGFzIGxvbmcgYXMgdGhl
IHZvbHVtZSB3aXRoaW4geW91ciB1YmkgZmlsZSBjb250YWlucyB0aGUgbmFtZQo+PiDigJxyb290
ZnPigJ0sIG9wZW53cnQgd2lsbCBmb2xsb3cgaXQgYXMgaXQgZ2V0cyB1bnBhY2tlZCBhbmQgc2V0
IHRoYXQgYXMgdGhlCj4+IHJvb3RkZXZpY2UgZm9yIHlvdS4KPiAKPiBUaGFua3MsCj4gLy9yaWNo
YXJkCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
