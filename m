Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBFCD1119B
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Nov 2024 01:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQu76tlMDwOwD0aGv39kNd6H7tb2cAOnKVXvqewrfqU=; b=3mmZyBX5wqu0TG
	flEGRFVIrj/76SM1/YNvgOr3H7E4FIKk4MqUyUjfbSA9p7h2zsaTi46Q7qB0p9ZwXPp8gkG7YdxPg
	yB5fmmmNIAuDjehvBgR/mrERAWHPCbopYgMNNp09xCKz3DJZvyJFcYnO9V95oAatucR1yEyGX+7mt
	Ndbw83iZZTy/3wigEBJQpPhYnJFl9CRUEL6OCEXDbSFe55jxafzZfp/ojwqhs2PHOyNAqPKaXKY1X
	557SnQ/jnZFy9l/FK+GqDf4xa37jXSupW3OrjimfE+EeCkU+NovAhdHO0Ah+6kZ2uM/En4kw33u85
	MgNcRjazhs56xwkWfzBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7lqx-0000000CMt8-14cO;
	Mon, 04 Nov 2024 01:25:59 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7lqt-0000000CMsd-3jHA
	for linux-mtd@lists.infradead.org;
	Mon, 04 Nov 2024 01:25:57 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3Nehke026061;
	Mon, 4 Nov 2024 01:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=iMh8eF
	HecHacE2bhwoTpB2hk6AqM865un55dFnhq1os=; b=mwumFI9ENq4rcML09znikW
	bSKfPSoLpGiPwIVPNb+PTU/Z9iu2uh9/7IsfcbZ2541kn+9Pa1KaH43261DTcInL
	pJ3rcjIjJBQ6fzmxg8ns9KWzD3Uc3+devvxJHHrJ42w5VT1xxl9HouMu+BQwVlnS
	K2EOVqA7F3PdpEO8mnuj2Rhej4k3uU44TrsNEMww2Kr5veoMrGZuLbZbKka3UhPP
	mwbaM/NWU4zi15DYpX7ZFZ8FllhKhAH1hafqawYZz+WNlB3YXAWAHnoeUXpPgJZB
	zuibf6jNbtRmEvDez5JdDKt6c/vHhZGRrKjxNUpwH+T/eFfpc6soYKoS+By8HCdA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42pk2106hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 01:25:30 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A41PT6m022592;
	Mon, 4 Nov 2024 01:25:29 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42pk2106hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 01:25:29 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3J0Iri019625;
	Mon, 4 Nov 2024 01:25:28 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 42p0mj1840-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 01:25:28 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A41PQfB13566404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Nov 2024 01:25:26 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B46020043;
	Mon,  4 Nov 2024 01:25:26 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C94C20040;
	Mon,  4 Nov 2024 01:25:26 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  4 Nov 2024 01:25:26 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.150.11.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 95503602B8;
	Mon,  4 Nov 2024 12:25:07 +1100 (AEDT)
Message-ID: <3b8312490c668a99b2a89667b7d1cbdf2019b885.camel@linux.ibm.com>
Subject: Re: [PATCH v2 06/10] sysfs: treewide: constify attribute callback
 of bin_attribute::mmap()
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Bjorn Helgaas	 <bhelgaas@google.com>,
        Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>,
        Davidlohr Bueso
 <dave@stgolabs.net>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Dave
 Jiang	 <dave.jiang@intel.com>,
        Alison Schofield
 <alison.schofield@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Ira
 Weiny <ira.weiny@intel.com>,
        Alex Deucher	 <alexander.deucher@amd.com>,
        Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>,
        Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie	 <airlied@gmail.com>,
        Simona Vetter
 <simona@ffwll.ch>,
        Dennis Dalessandro	
 <dennis.dalessandro@cornelisnetworks.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky	 <leon@kernel.org>,
        Tudor Ambarus
 <tudor.ambarus@linaro.org>,
        Pratyush Yadav	 <pratyush@kernel.org>,
        Michael
 Walle <mwalle@kernel.org>,
        Miquel Raynal	 <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
        Carlos Bilbao	
 <carlos.bilbao.osdev@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        "David E. Box"
 <david.e.box@linux.intel.com>,
        "James E.J. Bottomley"	
 <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"	
 <martin.petersen@oracle.com>,
        Richard Henderson
 <richard.henderson@linaro.org>,
        Matt Turner <mattst88@gmail.com>,
        Frederic
 Barrat <fbarrat@linux.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>, Logan
 Gunthorpe <logang@deltatee.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang	 <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
        Dexuan Cui	 <decui@microsoft.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-rdma@vger.kernel.org, linux-mtd@lists.infradead.org,
        platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-alpha@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org
Date: Mon, 04 Nov 2024 12:24:55 +1100
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-6-71110628844c@weissschuh.net>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
	 <20241103-sysfs-const-bin_attr-v2-6-71110628844c@weissschuh.net>
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IVwbyg3makWwSzhu8aJUQIgu4AbnB-xA
X-Proofpoint-ORIG-GUID: b4TgSoTo26XoqfO5DuvsB1xx-Da_599i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 clxscore=1011 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxlogscore=906
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_172555_960892_E9B12BC8 
X-CRM114-Status: GOOD (  15.51  )
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

T24gU3VuLCAyMDI0LTExLTAzIGF0IDE3OjAzICswMDAwLCBUaG9tYXMgV2Vpw59zY2h1aCB3cm90
ZToKPiBUaGUgbW1hcCgpIGNhbGxiYWNrcyBzaG91bGQgbm90IG1vZGlmeSB0aGUgc3RydWN0Cj4g
YmluX2F0dHJpYnV0ZSBwYXNzZWQgYXMgYXJndW1lbnQuCj4gRW5mb3JjZSB0aGlzIGJ5IG1hcmtp
bmcgdGhlIGFyZ3VtZW50IGFzIGNvbnN0Lgo+IAo+IEFzIHRoZXJlIGFyZSBub3QgbWFueSBjYWxs
YmFjayBpbXBsZW1lbnRlcnMgcGVyZm9ybSB0aGlzIGNoYW5nZQo+IHRocm91Z2hvdXQgdGhlIHRy
ZWUgYXQgb25jZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8bGludXhA
d2Vpc3NzY2h1aC5uZXQ+CgpBY2tlZC1ieTogQW5kcmV3IERvbm5lbGxhbiA8YWpkQGxpbnV4Lmli
bS5jb20+ICMgb2N4bAoKLS0gCkFuZHJldyBEb25uZWxsYW4gICAgT3pMYWJzLCBBREwgQ2FuYmVy
cmEKYWpkQGxpbnV4LmlibS5jb20gICBJQk0gQXVzdHJhbGlhIExpbWl0ZWQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
