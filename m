Return-Path: <SRS0=6QP0=LQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F061CC2B9F4
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 06:45:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFBDE60720
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 06:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFBDE60720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m68wkY76ul/sVtw/N9aBpgiwviuTmi7tDptsMtI6aq8=; b=Xduedzldzdg+Ms
	iQfML87N9UG/Uh03oG/KdFEqrQoyqvCuy1dH+0t6XzHXEyaUnsi8kK+IzF/Hmk52ywwYh1bdcg2x5
	aBIodsULEzmoP5ysSaeZY8q/INc+CQlgfkLBFvDR6iU6lJhMGc1z+sB+ZT7FZN4Hj+ebk0eyWzoLw
	RE0ctNIe+ssDm+8V/SovXGDwxSL0czJnpkQNFfNYhMawsSBO8Y1zg0HkXwEAOGTo6W/Ppii7D0FD4
	0Cyo/DXTBvDbbz5CvWyWegaF0YaW4rvBQNyrN79TMr5dACiJT1vzL2YkK9WBuhYS8XuYMwMFrs4iG
	5lOrxAXS/MO0ZZEQzLKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lva9M-005s8Y-ET; Tue, 22 Jun 2021 06:44:44 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lva9G-005s7b-Ky
 for linux-mtd@lists.infradead.org; Tue, 22 Jun 2021 06:44:40 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15M6gNOH011901; Tue, 22 Jun 2021 06:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=QfXXLmm0iGyiQYiHgMzRvZ8iyquEj7HAHDtJoxfX+fE=;
 b=J6L4Iv1KmxQMwPC3uMT6OeDHcgkCHWMp6PxSm+l2u774Oj0DE86KWaYyQ9n2PZnBBKqr
 t/1TRwjjsYicuqxUiASMSO0pLyTWHrHy3W5z7Qy8OHZBqPvPAa/u5QXlBVpyqEIo4+o5
 iT3TxANspLHR6HhwPq5sqZfGQBIOj4SaZBLaBWCBBAINaGRl1yWuV6ibDCWl+sX+/PQb
 uadq4A8gxzpH0mQWOfX5jb8iLXzOT2Be2rvhuSpN5ZupEW9RYtT3mUskW8B197QhYN5u
 /fIyJpwknmttwdOi9kM7TVOC/syJ2xF7I6JST0u7cNUJ+9ARCWpjWWb3s1S29NGXMJ34 PA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39acyqb2b6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 06:44:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15M6fBFq158054;
 Tue, 22 Jun 2021 06:44:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3030.oracle.com with ESMTP id 3995pvqve1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 06:44:29 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15M6iSkF171196;
 Tue, 22 Jun 2021 06:44:28 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 3995pvqvd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 06:44:28 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15M6iQn5019890;
 Tue, 22 Jun 2021 06:44:27 GMT
Received: from kadam (/102.222.70.252) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 21 Jun 2021 23:44:26 -0700
Date: Tue, 22 Jun 2021 09:44:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Colin King <colin.king@canonical.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ubifs: Remove a redundant null check on pointer lp
Message-ID: <20210622064419.GJ1901@kadam>
References: <20210621152249.20901-1-colin.king@canonical.com>
 <f2ea606a-4a05-8d14-4380-d96ca0f981a1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f2ea606a-4a05-8d14-4380-d96ca0f981a1@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: RuCeNEEez0_8-eKl6Wh6Pcbbaac3s5p1
X-Proofpoint-ORIG-GUID: RuCeNEEez0_8-eKl6Wh6Pcbbaac3s5p1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_234438_849625_560AE07A 
X-CRM114-Status: GOOD (  22.60  )
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

T24gVHVlLCBKdW4gMjIsIDIwMjEgYXQgMTA6Mzg6NTJBTSArMDgwMCwgWmhpaGFvIENoZW5nIHdy
b3RlOgo+IOWcqCAyMDIxLzYvMjEgMjM6MjIsIENvbGluIEtpbmcg5YaZ6YGTOgo+ID4gRnJvbTog
Q29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiA+IAo+ID4gQW4gZWFy
bGllciBmaXggdG8gcmVwbGFjZSBhbiBJU19FUlIgY2hlY2sgb24gbHAgd2l0aCBhIG51bGwgY2hl
Y2sKPiA+IG9uIGxwIGRpZG4ndCByZW1vdmUgYSBmb2xsb3dpbmcgbnVsbCBjaGVjayBvbiBscC4g
VGhlIHNlY29uZCBudWxsCj4gPiBjaGVjayBpcyByZWR1bmRhbnQgYW5kIGNhbiBiZSByZW1vdmVk
Lgo+ID4gCj4gPiBBZGRyZXNzZXMtQ292ZXJpdHk6ICgiTG9naWNhbGx5IGRlYWQgY29kZSIpCj4g
PiBGaXhlczogYzc3MGNkNTE5MGJhICgidWJpZnM6IGZpeCBhbiBJU19FUlIoKSB2cyBOVUxMIGNo
ZWNrIikKPiA+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9u
aWNhbC5jb20+Cj4gPiAtLS0KPiA+ICAgZnMvdWJpZnMvZ2MuYyB8IDIgLS0KPiA+ICAgMSBmaWxl
IGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9n
Yy5jIGIvZnMvdWJpZnMvZ2MuYwo+ID4gaW5kZXggN2NjMjJkNzMxN2VhLi40NjViZWVhNTIxNzYg
MTAwNjQ0Cj4gPiAtLS0gYS9mcy91Ymlmcy9nYy5jCj4gPiArKysgYi9mcy91Ymlmcy9nYy5jCj4g
PiBAQCAtODk5LDggKzg5OSw2IEBAIGludCB1Ymlmc19nY19zdGFydF9jb21taXQoc3RydWN0IHVi
aWZzX2luZm8gKmMpCj4gPiAgIAkJCWVyciA9IC1FTk9NRU07Cj4gPiAgIAkJCWdvdG8gb3V0Owo+
ID4gICAJCX0KPiBIaSBDb2xpbiwKPiBJIGp1c3QgZm91bmQgb3V0IGFib3V0IGl0IHRvZGF5IHRo
YW5rcyB0byB5b3VyIHBhdGNoLiBDb21taXQgYzc3MGNkNTE5MGJhCj4gKCJ1YmlmczogZml4IGFu
IElTX0VSUigpIHZzIE5VTEwgY2hlY2siKSBkaWQgaW1wb3J0IGEgbmV3IHByb2JsZW0gdGhhdAo+
IHViaWZzX2djX3N0YXJ0X2NvbW1pdCgpIG1heSByZXR1cm4gLUVOT01FTSB3aGlsZSBzeW5jaW5n
IGZzLgo+IEkgZ3Vlc3MgdWJpZnNfZmFzdF9maW5kX2ZyZGlfaWR4KCkgcmV0dXJuIE5VTEwgcG9p
bnRlciBpcyB0aGUgdGVybWluYXRpb24KPiBjb25kaXRpb24gaW4gd2hpbGUtbG9vcCwgd2hpY2gg
bWVhbnMgd2UgY2Fubm90IGdldCBhIGZyZWVhYmxlIGluZGV4IExFQiBpbgo+IHViaWZzX2djX3N0
YXJ0X2NvbW1pdCgpLgoKVWdoLi4uICBJJ20gc28gc29ycnkuICBNeSBwYXRjaCB3YXMgY2xlYXJs
eSB3cm9uZy4gIEkndmUgdHJpZWQgYmVmb3JlIHRvCmFkZCBhIFNtYXRjaCBjaGVjayB3aGljaCB3
YXJucyBhYm91dCBkdXBsaWNhdGl2ZSBOVUxMIGNoZWNrcywgYnV0IEkKdGhpbmsgdGhpcyBnaXZl
cyBtZSBhIG5ldyBpZGVhIHRvIHRyeS4gIEhvcGVmdWxseSwgaXQgd2lsbCBwcmV2ZW50IHRoaXMK
aW4gdGhlIGZ1dHVyZS4KClllYWgsIGFuZCBpdCdzIG15IGNoZWNrIHdoaWNoIG5lZWRzIHRvIGJl
IGRlbGV0ZWQsIG5vdCB0aGUgb3RoZXIgb25lLgoKcmVnYXJkcywKZGFuIGNhcnBlbnRlcgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
