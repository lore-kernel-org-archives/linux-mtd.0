Return-Path: <SRS0=xwS+=ES=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A558C5519F
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2020 15:02:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9C492078D
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2020 15:02:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MHjKXkZR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="blBCd5cC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9C492078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rmmfQ/SFWJ68866wQG40fFKc7DIYUAfpG+SDFbk/qV8=; b=MHjKXkZRYCqZtIWgVNmRmq+l/
	/MJ4rnR1CElN1XtoYKeGydnVEU2tLWzbo7R6py9RlO9qfbIqZfLaHo3GVNNLBsLvV4uOFsWWEC5SJ
	tZ+94hkU+/JDR9diWF6Nqe+20h/1vJjpU/usMj19Gkx1SeI74BhKEVfBrobH/g+/i3paXx4OzmJCx
	13x3oXYDvuip2kreTj2jwrRbbUJ/0nWJneHJCdgEtgHfsHHhOuiZ4uNfasyiAeXL8LAXPPBbVHXtK
	3chT6GX7hQ11g2bUkhhrmcu3nVuGg0l9q47X5il100MZRFlaOLQIIz6azY9sb7KCcMOhm10+SEcwF
	BC01b31sQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdE63-00005R-Qp; Thu, 12 Nov 2020 15:01:11 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdE61-0008UN-65
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2020 15:01:11 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ACF0jmv116692;
 Thu, 12 Nov 2020 09:00:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605193245;
 bh=+tTVYURRzxOUGW+xP6M4A5fIquJPbhAwZ7hMh22bcRU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=blBCd5cCC/9YhzHjQIaiE+jMy19WaNeFk2+g75XroXjK+yAzo8RUSyueHGjBD/yo4
 PDVwYai+e4lrEs2v7W1LmNM4aVl3fgoB0uIkXVL3aFHdUQY1YvpwZWUX0xFISLFBoh
 kTBkQyPMXEt2eroird2DtBKjiSAx/W6EvXpnfvfI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ACF0jWv130951
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 Nov 2020 09:00:45 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 12
 Nov 2020 09:00:45 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 12 Nov 2020 09:00:45 -0600
Received: from [10.250.233.179] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ACF0gmG023890;
 Thu, 12 Nov 2020 09:00:43 -0600
Subject: Re: drivers/mtd/maps/physmap-bt1-rom.c:78:18: sparse: sparse: cast
 removes address space '__iomem' of expression
To: Miquel Raynal <miquel.raynal@bootlin.com>, Serge Semin
 <Sergey.Semin@baikalelectronics.ru>
References: <202011021254.XC70BaQT-lkp@intel.com>
 <20201110113827.hl5i27cpl6exo3md@mobilestation>
 <20201110163556.3e3423f6@xps13>
 <20201111192259.ovdyjcuue7fx2bqa@mobilestation>
 <20201112092715.7e466405@xps13>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <8cdc6166-7183-c8a9-5c27-93a511e6471a@ti.com>
Date: Thu, 12 Nov 2020 20:30:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201112092715.7e466405@xps13>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_100109_426727_6E74F3E3 
X-CRM114-Status: GOOD (  15.25  )
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
Cc: kbuild-all@lists.01.org, linux-mtd@lists.infradead.org,
 kernel test robot <lkp@intel.com>, Serge Semin <fancer.lancer@gmail.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAxMS8xMi8yMCAxOjU3IFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIFNlcmdleSwK
PiAKPiBTZXJnZSBTZW1pbiA8U2VyZ2V5LlNlbWluQGJhaWthbGVsZWN0cm9uaWNzLnJ1PiB3cm90
ZSBvbiBXZWQsIDExIE5vdgo+IDIwMjAgMjI6MjI6NTkgKzAzMDA6Cj4gCj4+IE9uIFR1ZSwgTm92
IDEwLCAyMDIwIGF0IDA0OjM1OjU2UE0gKzAxMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+PiBI
aSBTZXJnZSwKPj4+Cj4+PiBTZXJnZSBTZW1pbiA8U2VyZ2V5LlNlbWluQGJhaWthbGVsZWN0cm9u
aWNzLnJ1PiB3cm90ZSBvbiBUdWUsIDEwIE5vdgo+Pj4gMjAyMCAxNDozODoyNyArMDMwMDoKPj4+
ICAgCj4+Pj4gSGVsbG8gTWlxdWVsLAo+Pj4+Cj4+Pj4gQSBzaXR1YXRpb24gbm90ZWQgYnkgdGhl
IHdhcm5pbmcgYmVsb3cgd29uJ3QgY2F1c2UgYW55IHByb2JsZW0gYmVjYXVzZQo+Pj4+IHRoZSBj
YXN0aW5nIGlzIGRvbmUgdG8gYSBub24tZGVyZWZlcmVuY2VkIHZhcmlhYmxlLiBJdCBpcyB1dGls
aXplZAo+Pj4+IGFzIGEgcG9pbnRlciBiaWFzIGxhdGVyIGluIHRoYXQgZnVuY3Rpb24uIFNoYWxs
IHdlIGp1c3QgaWdub3JlIHRoZQo+Pj4+IHdhcm5pbmcgb3Igc3RpbGwgZml4IGl0IHNvbWVob3c/
ICAKPj4+ICAgCj4+Cj4+PiBEbyB5b3UgdGhpbmsgdGhlIGNhc3QgdG8gYSAhX19pb21lbSB2YWx1
ZSBpcyBtYW5kYXRvcnkgaGVyZT8gIAo+Pgo+PiBJdCdzIG5vdCBtYW5kYXRvcnkgdG8gaGF2ZSB0
aGUgY2FzdGluZyB3aXRoIG5vIF9faW9tZW0sIGJ1dCB3b3VsZG4ndAo+PiBkb2luZyBsaWtlIHRo
aXM6Cj4+ICsgCXNoaWZ0ID0gKHNzaXplX3QgX19pb21lbSlzcmMgJiAweDM7Cj4+IGJlIGxvb2tp
bmcgd2VpcmQ/IFJlYWxseSwgaXMgdGhlcmUgYSBnb29kIHdheSB0byBzb21laG93IGV4dHJhY3Qg
dGhlIGZpcnN0Cj4+IHR3byBiaXRzIG9mIGEgX19pb21lbSBwb2ludGVyIHdpdGhvdXQgZ2V0dGlu
ZyB0aGUgc3BhcnNlIHdhcm5pbmc/Cj4gCj4gSSBhc2tlZCBhcm91bmQgbWUsIHdoYXQgYWJvdXQg
dHJ5aW5nIHVpbnRwdHJfdD8KPiAKCk9uZSBtb3JlIHdheSBpcyB0byB1c2UgX19mb3JjZSB0byB0
ZWxsIHNwYXJzZSB0aGF0IHRoaXMgY2FzdGluZyBpcwppbnRlbnRpb25hbDoKCiAgICAgICBzaGlm
dCA9IChfX2ZvcmNlIHNzaXplX3Qpc3JjICYgMHgzOwoKCj4gVGhhbmtzLAo+IE1pcXXDqGwKPiAK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8KPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
