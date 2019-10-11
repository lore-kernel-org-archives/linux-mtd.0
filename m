Return-Path: <SRS0=7oHA=YE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31472ECE58C
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2019 14:38:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04FC42190F
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2019 14:38:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R7EHRbI1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04FC42190F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaod.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:MIME-Version:
	Date:From:References:To:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kqyb/vkp4eVgMhaE2AH0s/q3JqKOUzSjDFG2BVLhsrk=; b=R7EHRbI1n8eCnz
	TD388aWBW+K70ICPPhu7z3RmHEA0YFnfZPsgjMpWZ9XX+FLJ726XggQlO1MAHzjE8H8iAR/hvATR5
	H/9dkRCpkSRqheibZU5fPlCtyXtj6eWrjzwx1DlwPviLmPmYstT2+kYSCHsvwC9m2IzZoHdh6DWYb
	E1b/wt4q93P1f4on3ysgfSr8Eq7GVmqGawbA9DlMuXu6f8QxAXCMPhrCGyjjohJaOlKzwRXrzCEfv
	vbbQEFIngsvZwQjY1f0KqzJYYRfI3oWLge319hk4YXgFdsU44IfqGDRk6J4kO3vWJKlaPlqYWNSEV
	AwuMXZ3FBiiiANbCej/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iIw3P-0004vB-8Z; Fri, 11 Oct 2019 14:38:03 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIw3M-0004u1-6v
 for linux-mtd@lists.infradead.org; Fri, 11 Oct 2019 14:38:01 +0000
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9BEXFXC065967
 for <linux-mtd@lists.infradead.org>; Fri, 11 Oct 2019 10:38:00 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vjtj7u4wy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Fri, 11 Oct 2019 10:37:59 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <clg@kaod.org>;
 Fri, 11 Oct 2019 15:37:57 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 11 Oct 2019 15:37:52 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x9BEbpE033161676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Oct 2019 14:37:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F4F711C058;
 Fri, 11 Oct 2019 14:37:51 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6485711C054;
 Fri, 11 Oct 2019 14:37:51 +0000 (GMT)
Received: from smtp.tls.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 11 Oct 2019 14:37:51 +0000 (GMT)
Received: from yukon.kaod.org (sig-9-145-63-191.uk.ibm.com [9.145.63.191])
 by smtp.tls.ibm.com (Postfix) with ESMTP id 38E552201CE;
 Fri, 11 Oct 2019 16:37:50 +0200 (CEST)
Subject: Re: [PATCH 04/16] mtd: spi-nor: aspeed: Add read training
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20191004115919.20788-1-clg@kaod.org>
 <20191004115919.20788-5-clg@kaod.org>
 <20191011142805.6cc3905c@dhcp-172-31-174-146.wireless.concordia.ca>
 <3244b1ce-587c-6f12-cc9c-7eee0354e76b@kaod.org>
 <20191011162919.77b05cf8@dhcp-172-31-174-146.wireless.concordia.ca>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Date: Fri, 11 Oct 2019 16:37:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191011162919.77b05cf8@dhcp-172-31-174-146.wireless.concordia.ca>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19101114-0020-0000-0000-0000037834FE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101114-0021-0000-0000-000021CE46CF
Message-Id: <b1db5178-69b4-e061-4237-5b24d14aeb1f@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-11_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=384 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910110137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191011_073800_252850_DC750BED 
X-CRM114-Status: GOOD (  22.99  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Andrew Jeffery <andrew@aj.id.au>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Joel Stanley <joel@jms.id.au>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTEvMTAvMjAxOSAxNjoyOSwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IE9uIEZyaSwgMTEg
T2N0IDIwMTkgMTU6NTU6MjUgKzAyMDAKPiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3Jn
PiB3cm90ZToKPiAKPiAgCj4+PiAoaG93IGNhbiB5b3UgZGV0ZXJtaW5lIGlmIHRpbWluZ3MgYXJl
IGdvb2Qgd2hlbiBJTyBwaW5zIGFsd2F5cwo+Pj4gc3RheSBoaWdoKS4gRG9uJ3Qgd2UgaGF2ZSBh
IGNvbW1hbmQgdGhhdCByZXR1cm4gbm9uLWZmL25vbi0wIGRhdGEgd2hpbGUKPj4+IHN0aWxsIGJl
aW5nIHByZWRpY3RhYmxlIGFuZCBpbW11dGFibGU/ICAgCj4+Cj4+IE5vdCB0aGF0IEkga25vdyBv
ZiBvbiB0aGVzZSBjb250cm9sbGVycy4KPiAKPiBJdCdzIG5vdCByZWFsbHkgYSBjb250cm9sbGVy
IHRoaW5nLCBtb3JlIGEgY2hpcCB0aGluZy4gVGhlIGlkZWFsCj4gc29sdXRpb24gd291bGQgYmUg
dG8gaGF2ZSBhIGxvb3BiYWNrIG1vZGUgb3IgYW4gaW50ZXJuYWwgU1JBTSB5b3UgY2FuCj4gd3Jp
dGUgdGhlbiByZWFkIGJhY2ssIGJ1dCBBRkFJQ1QgaXQgZG9lc24ndCBleGlzdHMuIFRoZXJlJ3Mg
dGhlIFNGRFAKPiB0YWJsZSBhcyBWaWduZXNoIG1lbnRpb25lZCwgYnV0IHdlIGhhdmUgdGhlIGZv
bGxvd2luZyBwcm9ibGVtczoKPiAKPiAxLyBpdCBtaWdodCBiZSB0b28gc21hbGwgKGRlZmluaXRl
bHkgPCAxNmspCj4gMi8gc29tZSBOT1JzIGRvbid0IHN1cHBvcnQgU0ZEUCAobWF5YmUgbm90IHRo
ZSBvbmVzIHdlIGNhcmUgYWJvdXQKPiAgICB0aG91Z2gpCgoKWWVzLiBUaGUgYXBwcm9hY2ggd2Ug
Zm9sbG93IGhhcyBnb29kIHJlc3VsdHMsIG9uY2UgdGhlIGRhdGEgaXMgCnF1YWxpZmllZCBhcyBn
b29kIGVub3VnaCBmb3IgdGhlIHRyYWluaW5nLiAKCldlIGhhZCBzb21lIGlzc3VlcyBiYWNrIGlu
IDIwMTQgd2l0aCBzb21lIGNoaXBzIG9uIGVhcmx5IHN5c3RlbXMgCmFuZCBJIHRoaW5rIHdlIGNv
dWxkIHJlZHVjZSB0aGUgYW1vdW50IG9mIHRoZSBkYXRhIHJlYWQgYW5kIHRoZSAKbnVtYmVyIG9m
IGxvb3BzIG5vdy4gCgpUaGFua3MsCgpDLiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
