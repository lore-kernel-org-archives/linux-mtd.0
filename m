Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F64C47258
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jan 2024 16:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Ea6yT8bMx0YGvMpHVGtW8UrxbMfFtoh4RZy57OmqnBM=; b=uW9Imh1NBLGWW04LjNTUUb7+ex
	zBUblhLBc3xr4m/S4G020GedfMaF3on3Z25Z7HolKL5Jc2JBvtGQcmlh7hQEl7Z0DrFqpOsH62DIR
	gMAu7OMstgnkA1c9V6Q5zyjwj54NZSXT7GboomeXZeqS3FOY8CW/1Ov9Qhc/gKLAdR/WvW4zw2raq
	VbJwL6OaLA2calIzmyu+ANjsiC5NCx+lpoiTGRykKbYIj9GrezS2XYTdMAVf4ry5xMm416Zah3iH3
	1vkRQfQX3TGXLBwy0g7qNwzZf5J0D0AtFz+neqDriVTe4XS48J5jaCb4oRPQxaDdpTwEUP7tlukRb
	qGaMT2GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSJRH-00HEvt-0d;
	Tue, 23 Jan 2024 16:15:51 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSJRD-00HEuf-19
	for linux-mtd@lists.infradead.org;
	Tue, 23 Jan 2024 16:15:49 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 51EB664507D7;
	Tue, 23 Jan 2024 17:15:42 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 40bEFhZAHMSs; Tue, 23 Jan 2024 17:15:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id ADDAC64507DB;
	Tue, 23 Jan 2024 17:15:41 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mQ54H8PLZRp0; Tue, 23 Jan 2024 17:15:41 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8586064507D7;
	Tue, 23 Jan 2024 17:15:41 +0100 (CET)
Date: Tue, 23 Jan 2024 17:15:41 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: "Yang, Chenyuan" <cy54@illinois.edu>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	syzkaller <syzkaller@googlegroups.com>, 
	"Zhao, Zijie" <zijie4@illinois.edu>, 
	"Zhang, Lingming" <lingming@illinois.edu>
Message-ID: <1461336945.270251.1706026541359.JavaMail.zimbra@nod.at>
In-Reply-To: <1433EB7A-FC89-47D6-8F47-23BE41B263B3@illinois.edu>
References: <PH7PR11MB57682489034B17034C021B04A06B2@PH7PR11MB5768.namprd11.prod.outlook.com> <1433EB7A-FC89-47D6-8F47-23BE41B263B3@illinois.edu>
Subject: Re: [Linux Kernel Bug] WARNING: zero-size vmalloc in
 ubi_read_volume_table
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: WARNING: zero-size vmalloc in ubi_read_volume_table
Thread-Index: AQHaQj+4RGN0tgPjZkuYXFZU3Q3pbrDnOT+A/mfrKH0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_081547_549424_3D9943A7 
X-CRM114-Status: UNSURE (   6.39  )
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

Q2hlbnl1YW4sCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gVm9uOiAiWWFuZywg
Q2hlbnl1YW4iIDxjeTU0QGlsbGlub2lzLmVkdT4KPiBBbjogImxpbnV4LW10ZCIgPGxpbnV4LW10
ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJNaXF1
ZWwgUmF5bmFsIgo+IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwgIlZpZ25lc2ggUmFnaGF2
ZW5kcmEiIDx2aWduZXNockB0aS5jb20+Cj4gQ0M6ICJzeXprYWxsZXIiIDxzeXprYWxsZXJAZ29v
Z2xlZ3JvdXBzLmNvbT4sICJaaGFvLCBaaWppZSIgPHppamllNEBpbGxpbm9pcy5lZHU+LCAiWmhh
bmcsIExpbmdtaW5nIgo+IDxsaW5nbWluZ0BpbGxpbm9pcy5lZHU+Cj4gR2VzZW5kZXQ6IERpZW5z
dGFnLCAyMy4gSmFudWFyIDIwMjQgMTY6MzA6NTkKPiBCZXRyZWZmOiBSZTogW0xpbnV4IEtlcm5l
bCBCdWddIFdBUk5JTkc6IHplcm8tc2l6ZSB2bWFsbG9jIGluIHViaV9yZWFkX3ZvbHVtZV90YWJs
ZQoKPiBEZWFyIExpbnV4IEtlcm5lbCBEZXZlbG9wZXJzIGZvciBVQkksCj4gCj4gSSBhbSB3cml0
aW5nIHRvIGlucXVpcmUgaWYgdGhlcmUgaGF2ZSBiZWVuIGFueSB1cGRhdGVzIHJlZ2FyZGluZyB0
aGUgY3Jhc2ggaXNzdWUKPiBwcmV2aW91c2x5IGRpc2N1c3NlZC4gSSB3b3VsZCBsaWtlIHRvIHN1
Z2dlc3QgYSBwb3RlbnRpYWwgc29sdXRpb246IGFkZGluZyBhCj4gY2hlY2sgZm9yIHRoZSBtYWxs
b2Mgc2l6ZSBjb3VsZCBwb3NzaWJseSBwcmV2ZW50IGNyYXNoZXMgY2F1c2VkIGJ5IHplcm8tc2l6
ZQo+IHZtYWxsb2MuCj4gCj4gWW91ciBpbnNpZ2h0cyBvbiB0aGlzIG1hdHRlciB3b3VsZCBiZSBn
cmVhdGx5IGFwcHJlY2lhdGVkLiBUaGFuayB5b3UgZm9yIHlvdXIKPiB0aW1lIGFuZCBkZWRpY2F0
aW9uCgpCZWZvcmUgd2UgYWRkIGEgY2hlY2ssIHdoYXQgTVREIGFyZSB5b3UgdXNpbmc/CkNhbiB5
b3Ugc2hhcmUgdGhlIHBhcmFtZXRlcnM/IEVyYXNlIHNpemUsIGV0Yy4uLgoKVGhhbmtzLAovL3Jp
Y2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
