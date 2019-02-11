Return-Path: <SRS0=7Ms1=QS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 134B3C169C4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 13:35:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D821921B1A
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 13:35:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AQOdKqXg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D821921B1A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:In-Reply-To:MIME-Version:Date:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XodEG1daDqwJ5/75K82GWSd+aQTvB57NSkOOYOdBKTI=; b=AQOdKqXg4iQH+z+f7BcP2cKGY
	eOOOPAISPXSf+d8YowKNTs55NAm6H9gUtWXBylmUGsXz5VVrs5PhabrUOHFpkt2oPtDVN4ivlrn4B
	Y6uJNAWG3vi0nXtJMrjAVZiVcoshm/TKesaNljV4WuZLVvWZRbmYv9X3GoIrsNiaCeSYXGib9odqp
	cRcXrfBLasQv/NnrHX9HL1TCCAb+a0UkUgx1OsWGUA5w+hkBUtfvIQyG6v6ZQjWy5/CqGpZCxRmtx
	pdgb47z361Qz/dpGzznymmp/sIxBhHi463gFHl8tIRpzMnB9aGDcXXtNjs8YokeZ3kM6dCAnKPyiv
	RCko7z4Bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtBkE-000867-EQ; Mon, 11 Feb 2019 13:35:34 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtBkB-00085j-SS
 for linux-mtd@lists.infradead.org; Mon, 11 Feb 2019 13:35:33 +0000
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1BDW8KV018481
 for <linux-mtd@lists.infradead.org>; Mon, 11 Feb 2019 08:35:30 -0500
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qk6x99e08-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Mon, 11 Feb 2019 08:35:30 -0500
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <aneesh.kumar@linux.ibm.com>;
 Mon, 11 Feb 2019 13:35:29 -0000
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 11 Feb 2019 13:35:01 -0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1BDZ0sV23330918
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Feb 2019 13:35:00 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41B322805A;
 Mon, 11 Feb 2019 13:35:00 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14A3C28059;
 Mon, 11 Feb 2019 13:34:59 +0000 (GMT)
Received: from [9.85.73.133] (unknown [9.85.73.133])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 11 Feb 2019 13:34:58 +0000 (GMT)
Subject: Re: [PATCH v3 1/2] drivers/mtd: Use mtd->name when registering nvmem
 device
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20190208151419.1800-1-aneesh.kumar@linux.ibm.com>
 <20190210135552.65f532bb@collabora.com>
 <2f3cae2b-32d2-0651-29ef-2359221de4ef@linux.ibm.com>
 <20190211121628.30c22370@collabora.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Mon, 11 Feb 2019 19:04:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190211121628.30c22370@collabora.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19021113-2213-0000-0000-0000034E09E3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010577; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000279; SDB=6.01159515; UDB=6.00605101; IPR=6.00940061; 
 MB=3.00025525; MTD=3.00000008; XFM=3.00000015; UTC=2019-02-11 13:35:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19021113-2214-0000-0000-00005D515212
Message-Id: <c7885c03-6cd5-d6ba-b2f4-63e2d1f03cd4@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-11_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=905 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902110106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_053532_041915_99CC9575 
X-CRM114-Status: GOOD (  23.66  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, Alban Bedel <albeu@free.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2/11/19 4:46 PM, Boris Brezillon wrote:
> On Mon, 11 Feb 2019 16:26:38 +0530
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:
> 
>> On 2/10/19 6:25 PM, Boris Brezillon wrote:
>>> Hello Aneesh,
>>>
>>> On Fri,  8 Feb 2019 20:44:18 +0530
>>> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:
>>>    
>>>> With this patch, we use the mtd->name instead of concatenating the name with '0'
>>>>
>>>> Fixes: c4dfa25ab307 ("mtd: add support for reading MTD devices via the nvmem API")
>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>
>>> You forgot to Cc the MTD ML and maintainers. Can you please send a new
>>> version?
>>>    
>>
>> linux-mtd list is on CC: Is that not sufficient?
> 
> Not in your original email, I added it in my reply.
> 


Sorry about that. I will now resend with linux-mtd on CC: I missed that 
earlier.

-aneesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
