Return-Path: <SRS0=bI2a=OD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A1BC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Sep 2021 12:20:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EA8860FBF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Sep 2021 12:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EA8860FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dq77u1+RaHb56riiSjlf6msdYwR0T+82cMlZIP6EvxI=; b=20TioxQeJ+mdP+FD68Ol9Lze7W
	dUHdG5bJYTfO5+9679Mj0E8SPAHAqLdYzJjbQhov4APighQ1qXg+nboMwaB5zFklQKl53Pv4D1QDf
	+NvxWRMHXyWVFNowj2WesB/pKtkdJS6/GDB7jo5HTcRAgeNXxJqoP28MaoxMpOT4CpnE11+Jd8HgQ
	2WjoFnohKQ79v67/86KelZ/uAmLS6iUZ5+AsMBHyHFtYFVY4+UW5c51tv5xnL3nI0f2kYnzNTm9Hr
	Es2Mz7fs5vqHBP9g2raq0Kvp0C2nmwr4y1Irp/XG+2rFWP3zNnSHhudl5BXLyk9WkDWsChjOqVuCu
	Ph6XB/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPkwK-001Zet-JL; Mon, 13 Sep 2021 12:20:00 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPkwG-001Zd8-7M
 for linux-mtd@lists.infradead.org; Mon, 13 Sep 2021 12:19:57 +0000
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18D9wYg1008000;
 Mon, 13 Sep 2021 08:19:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=1hIWw/wSnWofckL41D1XzUL6GWvmJ86ckis+en3IDQU=;
 b=FHD/9GFP4oMbQvwproBcX0w8FAoZ9aiZgfpupLm0PK3rBr+RePrUKsh+LqZj6UgRwwp6
 Zfh9I24AzRQ3Ke5wqXH+fxQG5HT/HPz1BsbQZ9fQe84WuNT/JQQgpzbY3o70zHtmB/uc
 ic6Vo9Gb7CwEkRnPwhUnWkWfZ8t8xccLcQA3eFhgMbmZh7nF5iAl5VWNTXxJPMm6N+yF
 ZE6uTalYW3ts0xPcTE2BGKkSIaNwnTcorfAh7wVWl8yoaFq5bb+WPDBZ3uZjvr7XD7O2
 YU+0UQI6qwk5RoZzXj0INp85Xq3xbeCa/ryD5oyHkgi6zFYKlG/jj7cKJcHflQOG0ZWs QA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b24fvawne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 08:19:46 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18DBRbiC022017;
 Mon, 13 Sep 2021 08:19:45 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b24fvawmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 08:19:45 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18DCE8S7029062;
 Mon, 13 Sep 2021 12:19:43 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3b0m38qc81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 12:19:43 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18DCJdGv42729806
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Sep 2021 12:19:39 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9882911C050;
 Mon, 13 Sep 2021 12:19:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D3D811C069;
 Mon, 13 Sep 2021 12:19:38 +0000 (GMT)
Received: from [9.145.51.25] (unknown [9.145.51.25])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 13 Sep 2021 12:19:38 +0000 (GMT)
Subject: Re: [PATCH 6/9] s390/block/dasd_genhd: add error handling support for
 add_disk()
From: =?UTF-8?Q?Jan_H=c3=b6ppner?= <hoeppner@linux.ibm.com>
To: Luis Chamberlain <mcgrof@kernel.org>, axboe@kernel.dk,
 gregkh@linuxfoundation.org, chaitanya.kulkarni@wdc.com,
 atulgopinathan@gmail.com, hare@suse.de, maximlevitsky@gmail.com,
 oakad@yahoo.com, ulf.hansson@linaro.org, colin.king@canonical.com,
 shubhankarvk@gmail.com, baijiaju1990@gmail.com, trix@redhat.com,
 dongsheng.yang@easystack.cn, ceph-devel@vger.kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sth@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
 borntraeger@de.ibm.com, oberpar@linux.ibm.com, tj@kernel.org
Cc: linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210902174105.2418771-1-mcgrof@kernel.org>
 <20210902174105.2418771-7-mcgrof@kernel.org>
 <d6140e40-a472-e732-9893-99e1839b717e@linux.ibm.com>
Message-ID: <f24da7d5-0b67-fa24-862f-0b27a2ab502c@linux.ibm.com>
Date: Mon, 13 Sep 2021 14:19:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d6140e40-a472-e732-9893-99e1839b717e@linux.ibm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gi0m7LOuzf2vMdtL1hb1AAbX0QKyIfvS
X-Proofpoint-ORIG-GUID: dBdYHCxX_EYkPQrzsDHcfwD3gZgwOseq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 spamscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109130063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_051956_451371_406B29B7 
X-CRM114-Status: GOOD (  27.83  )
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

T24gMTMvMDkvMjAyMSAxMDoxNywgSmFuIEjDtnBwbmVyIHdyb3RlOgo+IE9uIDAyLzA5LzIwMjEg
MTk6NDEsIEx1aXMgQ2hhbWJlcmxhaW4gd3JvdGU6Cj4+IFdlIG5ldmVyIGNoZWNrZWQgZm9yIGVy
cm9ycyBvbiBhZGRfZGlzaygpIGFzIHRoaXMgZnVuY3Rpb24KPj4gcmV0dXJuZWQgdm9pZC4gTm93
IHRoYXQgdGhpcyBpcyBmaXhlZCwgdXNlIHRoZSBzaGlueSBuZXcKPj4gZXJyb3IgaGFuZGxpbmcu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEx1aXMgQ2hhbWJlcmxhaW4gPG1jZ3JvZkBrZXJuZWwub3Jn
Pgo+PiAtLS0KPj4gIGRyaXZlcnMvczM5MC9ibG9jay9kYXNkX2dlbmhkLmMgfCA4ICsrKysrKy0t
Cj4+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zMzkwL2Jsb2NrL2Rhc2RfZ2VuaGQuYyBiL2RyaXZlcnMv
czM5MC9ibG9jay9kYXNkX2dlbmhkLmMKPj4gaW5kZXggZmE5NjZlMGRiNmNhLi5iYTA3MDIyMjgz
YmMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvczM5MC9ibG9jay9kYXNkX2dlbmhkLmMKPj4gKysr
IGIvZHJpdmVycy9zMzkwL2Jsb2NrL2Rhc2RfZ2VuaGQuYwo+PiBAQCAtMzMsNyArMzMsNyBAQCBp
bnQgZGFzZF9nZW5kaXNrX2FsbG9jKHN0cnVjdCBkYXNkX2Jsb2NrICpibG9jaykKPj4gIHsKPj4g
IAlzdHJ1Y3QgZ2VuZGlzayAqZ2RwOwo+PiAgCXN0cnVjdCBkYXNkX2RldmljZSAqYmFzZTsKPj4g
LQlpbnQgbGVuOwo+PiArCWludCBsZW4sIHJjOwo+PiAgCj4+ICAJLyogTWFrZSBzdXJlIHRoZSBt
aW5vciBmb3IgdGhpcyBkZXZpY2UgZXhpc3RzLiAqLwo+PiAgCWJhc2UgPSBibG9jay0+YmFzZTsK
Pj4gQEAgLTc5LDcgKzc5LDExIEBAIGludCBkYXNkX2dlbmRpc2tfYWxsb2Moc3RydWN0IGRhc2Rf
YmxvY2sgKmJsb2NrKQo+PiAgCWRhc2RfYWRkX2xpbmtfdG9fZ2VuZGlzayhnZHAsIGJhc2UpOwo+
PiAgCWJsb2NrLT5nZHAgPSBnZHA7Cj4+ICAJc2V0X2NhcGFjaXR5KGJsb2NrLT5nZHAsIDApOwo+
PiAtCWRldmljZV9hZGRfZGlzaygmYmFzZS0+Y2Rldi0+ZGV2LCBibG9jay0+Z2RwLCBOVUxMKTsK
Pj4gKwo+PiArCXJjID0gZGV2aWNlX2FkZF9kaXNrKCZiYXNlLT5jZGV2LT5kZXYsIGJsb2NrLT5n
ZHAsIE5VTEwpOwo+PiArCWlmIChyYykKPj4gKwkJcmV0dXJuIHJjOwo+PiArCj4gCj4gSSB0aGlu
aywganVzdCBsaWtlIHdpdGggc29tZSBvZiB0aGUgb3RoZXIgY2hhbmdlcywgdGhlcmUgaXMgc29t
ZQo+IGNsZWFudXAgcmVxdWlyZWQgYmVmb3JlIHJldHVybmluZy4gSSdsbCBwcmVwYXJlIGEgcGF0
Y2ggYW5kCj4gY29tZSBiYWNrIHRvIHlvdS4KPiAKCkl0J3MgYWN0dWFsbHkganVzdCBvbmUgY2Fs
bCB0aGF0IGlzIHJlcXVpcmVkLiBUaGUgcGF0Y2ggc2hvdWxkCmxvb2sgbGlrZSB0aGlzOgoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvczM5MC9ibG9jay9kYXNkX2dlbmhkLmMgYi9kcml2ZXJzL3MzOTAv
YmxvY2svZGFzZF9nZW5oZC5jCmluZGV4IGZhOTY2ZTBkYjZjYS4uODA2NzNkYmZiMWY5IDEwMDY0
NAotLS0gYS9kcml2ZXJzL3MzOTAvYmxvY2svZGFzZF9nZW5oZC5jCisrKyBiL2RyaXZlcnMvczM5
MC9ibG9jay9kYXNkX2dlbmhkLmMKQEAgLTMzLDcgKzMzLDcgQEAgaW50IGRhc2RfZ2VuZGlza19h
bGxvYyhzdHJ1Y3QgZGFzZF9ibG9jayAqYmxvY2spCiB7CiAgICAgICAgc3RydWN0IGdlbmRpc2sg
KmdkcDsKICAgICAgICBzdHJ1Y3QgZGFzZF9kZXZpY2UgKmJhc2U7Ci0gICAgICAgaW50IGxlbjsK
KyAgICAgICBpbnQgbGVuLCByYzsKIAogICAgICAgIC8qIE1ha2Ugc3VyZSB0aGUgbWlub3IgZm9y
IHRoaXMgZGV2aWNlIGV4aXN0cy4gKi8KICAgICAgICBiYXNlID0gYmxvY2stPmJhc2U7CkBAIC03
OSw3ICs3OSwxMyBAQCBpbnQgZGFzZF9nZW5kaXNrX2FsbG9jKHN0cnVjdCBkYXNkX2Jsb2NrICpi
bG9jaykKICAgICAgICBkYXNkX2FkZF9saW5rX3RvX2dlbmRpc2soZ2RwLCBiYXNlKTsKICAgICAg
ICBibG9jay0+Z2RwID0gZ2RwOwogICAgICAgIHNldF9jYXBhY2l0eShibG9jay0+Z2RwLCAwKTsK
LSAgICAgICBkZXZpY2VfYWRkX2Rpc2soJmJhc2UtPmNkZXYtPmRldiwgYmxvY2stPmdkcCwgTlVM
TCk7CisKKyAgICAgICByYyA9IGRldmljZV9hZGRfZGlzaygmYmFzZS0+Y2Rldi0+ZGV2LCBibG9j
ay0+Z2RwLCBOVUxMKTsKKyAgICAgICBpZiAocmMpIHsKKyAgICAgICAgICAgICAgIGRhc2RfZ2Vu
ZGlza19mcmVlKGJsb2NrKTsKKyAgICAgICAgICAgICAgIHJldHVybiByYzsKKyAgICAgICB9CisK
ICAgICAgICByZXR1cm4gMDsKIH0KCnJlZ2FyZHMsCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
