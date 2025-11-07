Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787E5CCF9E3
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Nov 2025 23:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9uF4MLDvEkwnejfCDMluXEk54LEGPTC6Q5wTFwjDsZk=; b=Q0KuD9WRUVhqhx
	oAvV4ViAh5LUIyTPWj2bP2jmJ71r9kJuxyGOFT4PU/Fc/yQnzDxetylSOoJYLz29pLZLpHDoI0lnA
	Tpv6K7mbbJajfy/2Vr3ed7ySu4SKJjHHpKbq/dlpYgt5eRk/9h90ytyLZwSq1SHXazQhDSpGenncV
	mx7ynsvQlQnyGEuFEAFbofcyS+ZEMz/JjOWLY2KHJ7MPOz3hyT392xu/TZXEJRNy4AZvmVpmZiKd5
	ejjCpe90awG3L+q40UDYcoPI0pQxNkhgOgNnVCDKH8u4K/mAhY9M2ZZpvL3wKZiKGcfW+C8mvh8nX
	nImSLVVErMsKuBg/2LzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHWDB-00000001blE-1Qk6;
	Fri, 07 Nov 2025 23:49:45 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHWD7-00000001bjr-3xuE
	for linux-mtd@lists.infradead.org;
	Fri, 07 Nov 2025 23:49:43 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7INsPQ001084;
	Fri, 7 Nov 2025 23:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=JrAmSA
	5BdwcrTdGcgekVRkIjRdfQs+pfWYGhRccUzVE=; b=OgD++bijhOJ3+i6gBF4pD4
	f9R2OPsLCdMQ3V9ZMg7xHOyDl2vqgr7UDTwFq7qeYgRFv3YqCWFy2Jks2+YUi0p7
	E0x0s4uOvv7crKi/wzZ4nusvExUVsW61Tt2BE0XDSMACtkvEzxgExQm7NdwblW/w
	UznEPnKGsZJ8v5ulCmuSn+FzlkX7BHfwP43FuPmO/zuz6WAgC7BRSTY0HOvoBq0q
	Fzzt5C2uU5Fl44enNtC1ObUKzNuapFoN88dVCfbO68mCgZomc0pUvakvm41rL3AY
	B1yq7DlP7D/zyQ7HVs3NPetgq6b40OBCfM11ziqYSP/0yuRzF00dfX6r5mDgh7LA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9p0j9420-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 23:49:35 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A7NnZfL023197;
	Fri, 7 Nov 2025 23:49:35 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9p0j941w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 23:49:35 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7Mpkx1018784;
	Fri, 7 Nov 2025 23:49:34 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a5whnwagb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 23:49:34 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A7NnXVL56033542
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Nov 2025 23:49:34 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF78C5805A;
	Fri,  7 Nov 2025 23:49:33 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D2DE58051;
	Fri,  7 Nov 2025 23:49:33 +0000 (GMT)
Received: from [9.61.104.176] (unknown [9.61.104.176])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Nov 2025 23:49:33 +0000 (GMT)
Message-ID: <84354d51-bfa2-4d6b-895f-f9cf610d4bb6@linux.ibm.com>
Date: Fri, 7 Nov 2025 17:49:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: UBIFS errors since Linux 5.15
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
        chengzhihao1 <chengzhihao1@huawei.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        linux-kernel <linux-kernel@vger.kernel.org>, sethjenkins@google.com,
        adobriyan <adobriyan@gmail.com>
References: <068ba254-0053-46d5-bff4-74c948d2e8ac@linux.ibm.com>
 <55378147.159026.1762545799936.JavaMail.zimbra@nod.at>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <55378147.159026.1762545799936.JavaMail.zimbra@nod.at>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: L0WOTQbhFUvL-8cou71wMTniaW70b_Zq
X-Authority-Analysis: v=2.4 cv=J9enLQnS c=1 sm=1 tr=0 ts=690e858f cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=JfrnYn6hAAAA:8 a=i0EeH86SAAAA:8 a=voM4FWlXAAAA:8
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=pGLkceISAAAA:8 a=nqgInfV_ZEBXBheio9IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
 a=IC2XNlieTeVoXbcui8wp:22 a=HhbK4dLum7pmb74im6QT:22 a=cPQSjfK2_nFv0Q5t_7PE:22
 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDE1MiBTYWx0ZWRfX1k3PHk+j8Dt0
 cMZeqSga0+OjtpH80ajmkygex0suaKwe+TwcNYuL8T9jFP/tBGUC+4l+KH6iWDlncnqaxWIdK22
 IC5L7ew1Kn/uYLDliSK5BztvuY7+1dtC7k7Z02UhAbKnktuE8Y2LMokd/2H8QWcr+EGAZfojysP
 kS9iRew5NDcFn3ZKPMUC1aV5E0Rq8dClw3UMNnSkgxK1Nq+dS4cPPMDF4sJuUwygKs8BtvZ7Bwh
 JIKUtCXbh4eCXT6SEmJO7hjg85z7VwylqrbZAO3Y/qxxXxwu0gXwd/IjT2IpTwkN3xeiy0y86kO
 TRTbDJe9XIEFZKR+8ClqKMkLtPZtBWxV/TtHTkNLoAHO5/GrC0i/4Y8aE/Pld6IEu7ObeVxneSz
 I4btkb5k+BzGG+aVEhWFfXJW3z+rbg==
X-Proofpoint-GUID: -SncNA1_bQtn9klT9qKdm9kGWUfGckyo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_07,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511070152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_154942_457594_3486BAED 
X-CRM114-Status: GOOD (  15.16  )
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

Ck9uIDExLzcvMjUgMjowMyBQTSwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgo+IEVkZGllLAo+
Cj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBWb246ICJFZGRpZSBKYW1lcyIg
PGVhamFtZXNAbGludXguaWJtLmNvbT4KPj4gQW46ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlz
dHMuaW5mcmFkZWFkLm9yZz4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiY2hlbmd6aGlo
YW8xIiA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+LAo+PiAiT3BlbkJNQyBNYWlsbGlzdCIgPG9w
ZW5ibWNAbGlzdHMub3psYWJzLm9yZz4sICJsaW51eC1rZXJuZWwiIDxsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnPiwgc2V0aGplbmtpbnNAZ29vZ2xlLmNvbSwKPj4gImFkb2JyaXlhbiIgPGFk
b2JyaXlhbkBnbWFpbC5jb20+Cj4+IEdlc2VuZGV0OiBGcmVpdGFnLCA3LiBOb3ZlbWJlciAyMDI1
IDE4OjM4OjU0Cj4+IEJldHJlZmY6IFVCSUZTIGVycm9ycyBzaW5jZSBMaW51eCA1LjE1Cj4+IEhl
bGxvLAo+Pgo+PiBXZSBhcmUgdXBkYXRpbmcgc29tZSBCTUMgKEFzcGVlZCBBU1QyNjAwLCBBUk0z
Mikgc3lzdGVtcyB0aGF0IHdlcmUgb24KPj4gTGludXggNS40IGJ1dCBvYnNlcnZlIGNvbnNpc3Rl
bnQgVUJJRlMgZXJyb3JzIHdpdGggTGludXggNS4xNSBhbmQgbGF0ZXIuCj4+IFRoZSBlcnJvcnMg
c2VlbSB0byB2YXJ5OyB0aGVyZSBpcyBhIHNhbXBsaW5nIGJlbG93Lgo+Pgo+Pgo+PiBXZSBwZXJm
b3JtZWQgYSBnaXQgYmlzZWN0IGFuZCBjYW1lIHVwIHdpdGggdGhlIGZvbGxvd2luZyBjb21taXQs
IHdoaWNoCj4+IG9mIGNvdXJzZSBpcyBjb21wbGV0ZWx5IHVucmVsYXRlZCB0byBVQklGUy4gUmV2
ZXJ0aW5nIGl0IGRvZXMgcHJldmVudAo+PiB0aGUgaXNzdWUuLi4gRG9lcyBhbnlvbmUgaGF2ZSBh
bnkgc3VnZ2VzdGlvbnM/Cj4+Cj4+IGNvbW1pdCAzM2ZjOWUyNmI3Y2IzOWYwZDQyMTljODc1YTI0
NTE4MDIyNDljMjI1Cj4+IEF1dGhvcjogU2V0aCBKZW5raW5zIDxzZXRoamVua2luc0Bnb29nbGUu
Y29tPgo+PiBEYXRlOsKgIMKgVGh1IE9jdCAyNyAxMTozNjo1MiAyMDIyIC0wNDAwCj4gVGhhdCdz
IGluZGVlZCBzdHJhbmdlLgo+IEFyZSB5b3UgYWJzb2x1dGVseSBzdXJlIHRoYXQgdGhpcyBjb21t
aXQgdHJpZ2dlcnMgdGhlIGlzc3VlPwo+IEUuZy4gaWYgeW91IHJldmVydCBpdCBvbiB0b3Agb2Yg
NS4xNSB0aGUgaXNzdWUgdmFuaXNoZXMgYW5kIHdoZW4geW91Cj4gcmUtYXBwbHkgaXQsIHRoZSBp
c3N1ZSBpcyBiYWNrPwoKClRoYW5rcyBmb3IgeW91ciBxdWljayByZXBseS4gWWVzLCB0aGF0IGlz
IHRoZSBjYXNlOyBpdCdzIG5vdCB2ZXJ5IApsb2dpY2FsLiBXZSBhcmUgY3VycmVudGx5IHJ1bm5p
bmcgbW9yZSBleHRlbmRlZCB0ZXN0cyB3aXRoIDUuMTUgd2l0aCAKMzNmYzllMjZiIHJldmVydGVk
LiBJIGFzc3VtZSB0aGUgcG90ZW50aWFsIGZvciBjb3JydXB0aW9uIGlzIHRoZXJlIAp3aXRob3V0
IHRoaXMgY29tbWl0IHRvbywgYnV0IHNvbWVob3cgaXQgZG9lc24ndCBoYXBwZW4uCgoKRWRkaWUK
Cgo+Cj4gVGhhbmtzLAo+IC8vcmljaGFyZAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
