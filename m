Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB51C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jan 2022 23:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9sarFqTOG8gtPIuoB8xd0eKsYA2HqHKnnxP0+PK0PHQ=; b=DUdLGHqWcQslk3
	73YHLr/FkaAh3LSU4oiHU33qUIjleMgmVmwAGRleYQf2MN+kEqx+01UkqTFmwwX93I+9dCKiOrW2S
	I/FSvCsdYWSiZq45tC3DYSLi+oktFGto8AiqbBp8TgsAZRg1A4toFiJYiHUqI/oQyiENVzue8qZ5I
	L4e1FR8W9NFZPVCFw7nhoVGs2OZ+pwYkmRLI39ZeU3mMa0O2GcUqlNPmwQKf0WzC8S4M/1J7N1HRu
	dIgrj2w/hJPV49FAVBZtDNISwGqjhPff74sEtvFrMFi8jIUhePgSRh3jEZo878hD/2pLisSOQUt6L
	v7S+aCSZMWqhC+NvcLbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n73qQ-00DpIX-5H; Mon, 10 Jan 2022 23:12:54 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n73qN-00DpHz-Ng
 for linux-mtd@lists.infradead.org; Mon, 10 Jan 2022 23:12:53 +0000
Received: from [192.168.86.154] (unknown [50.47.106.53])
 by linux.microsoft.com (Postfix) with ESMTPSA id 9D96D20B7179;
 Mon, 10 Jan 2022 15:12:49 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9D96D20B7179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1641856369;
 bh=z/9FTLNoZVswH0nLcNsLvXoVzVtyCU6mfWv83MGOF/w=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=tAALtaT2G0xnI5uvuenj+mgt+hpQvIbhfnqYT0rwZgFvJHNIW95Yx1OVPYKang1Jq
 L8OL40x15LSwlRNoocuBrsESjURDUzBsdGCVMp5JHz+GXpFBfQjEBCUCgVR8MxCjtj
 kyVw8mynfsegYFQLoURhrjMG1s42voHrHxTwTmlU=
Message-ID: <57513f5f-1e66-3758-a56b-1eced486a4df@linux.microsoft.com>
Date: Mon, 10 Jan 2022 15:12:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for w25q512jvm
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220109044418.4657-1-dphadke@linux.microsoft.com>
 <262a03e185c29583450180e3dc8c4e6c@walle.cc>
Content-Language: en-US
In-Reply-To: <262a03e185c29583450180e3dc8c4e6c@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_151251_889635_8F8C2162 
X-CRM114-Status: GOOD (  10.99  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMS8xMC8yMDIyIDc6MTAgQU0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4KPj4gK8KgwqDCoCB7
ICJ3MjVxNTEyanZtIiwgSU5GTygweGVmNzAyMCwgMCwgNjQgKiAxMDI0LCAxMDI0KSwKPiAKPiBP
VFBfSU5GTygyNTYsIDMsIDB4MTAwMCwgMHgxMDAwKQo+IAo+IHNob3VsZCBlbmFibGUgT1RQIHN1
cHBvcnQsIGNvdWxkIHlvdSBwbGVhc2UgdGVzdCB0aGlzIHVzaW5nIHRoZSAKPiBmbGFzaF9vdHBf
e2R1bXAsaW5mbyxlcmFzZSx3cml0ZX0gdG9vbHMgYW5kIGFkZCB0aGF0IGxpbmU/CgpUaGUgYm9h
cmQgSSd2ZSBoYXMgSFcgZmlsdGVyIGJldHdlZW4gY29udHJvbGxlciBhbmQgTk9SIGFuZCBkb2Vz
bid0IHNlZW0gCnRvIGFsbG93IHNlY3VyaXR5IHJlZyBhY2Nlc3Mgb3Bjb2RlcyAocmVhZCB0byBi
ZSBzcGVjaWZpYykuCgpTbyBsb25nIGFzIGFkZGluZyB0aGlzIGRvZXNuJ3QgYWZmZWN0IHByb2Jl
LCBJIGNhbiBhZGQgaXQuIE90aGVyd2lzZSwgCndpbGwgaGF2ZSB0byBsZWF2ZSBpdCBmb3IgbGF0
ZXIgd2hlbiB0aGF0J3MgZml4ZWQuCgoKT24gMS85LzIwMjIgOTowNyBQTSwgUHJhdHl1c2ggWWFk
YXYgd3JvdGU6Cj4KPiBZb3UgbmVlZCB0byBzaG93IHRoZSBkdW1wcyBvZiB0aGUgU0ZEUCBhbmQg
b3RoZXIgZmxhc2ggcGFyYW1ldGVycy4gU2VlCj4gWzBdIGZvciBhbiBleGFtcGxlLgo+Cj4gVGhl
IHBhdGNoIGxvb2tzIGZpbmUgdG8gbWUgb3RoZXJ3aXNlLgo+CgpMZW1tZSBjb2xsZWN0IFNGRFAg
ZHVtcCBhbmQgaW5jbHVkZSBpdCBpbiB2Mi4KSSBlbmRlZCB1cCBzZW5kaW5nIHN0YWxlIHBhdGNo
IHRoYXQgaGFzIGV4dHJhIGNvbW1hIGJldHdlZW4gSU5GTygpIApQQVJTRV9TRkRQIG1hY3Jvcywg
c28gbmVlZCB0byByZS1zcGluIGFueXdheS4KClRoYW5rcywKRGhhbmFuamF5CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
