Return-Path: <SRS0=F8YS=QN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A79C169C4
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Feb 2019 04:53:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C2BA20844
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Feb 2019 04:53:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KL5hYCzC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C2BA20844
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:MIME-Version:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csJ0fSopRkBT1RqyLPrbGlvQigVMdbRVyKco4WjbBb4=; b=KL5hYCzC3Z/01O
	sgMhgci35uSdHwuUffPHbhJvbIDz8bA2kQZAMK30nQnNNorsE0yZont+7eHuEhoqKxRe0qJ/k1EJi
	+FbzIJ4yd39gwUAal/HZyAw9d5yfA1yxbdDcSRbPIoulZ3gtldXn/HJ5njg0xYIYpVhnrhPZFPSyz
	5B4qB7Bb43sBGFbj/KLmzg79ORsC2wxBhyN58DVYwkftsZmx0IxfCdfnBAPg7wXD0AMoST/mLFKlN
	JlBYSqHo6mkhyWJRmod3GjahGrnOxE1OqmdyXC73ztuPHsfrrpc3K1LMtqQyCJhInCA9Lx/9XC2fC
	pTYD/Mylipak/2LJKjkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grFD1-00079E-6W; Wed, 06 Feb 2019 04:53:15 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grFCw-000725-1N
 for linux-mtd@lists.infradead.org; Wed, 06 Feb 2019 04:53:12 +0000
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x164nmtA082629
 for <linux-mtd@lists.infradead.org>; Tue, 5 Feb 2019 23:53:08 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2qfqh439va-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Tue, 05 Feb 2019 23:53:08 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <aneesh.kumar@linux.ibm.com>;
 Wed, 6 Feb 2019 04:53:06 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 6 Feb 2019 04:53:03 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x164r2K813369578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 6 Feb 2019 04:53:02 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8E3B42052;
 Wed,  6 Feb 2019 04:53:01 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C006A4203F;
 Wed,  6 Feb 2019 04:53:00 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.39.155])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  6 Feb 2019 04:53:00 +0000 (GMT)
X-Mailer: emacs 26.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH] drivers/mtd: Fix device registration error
In-Reply-To: <20190205234805.5558ef98@gmail.com>
References: <20190205090547.8418-1-aneesh.kumar@linux.ibm.com>
 <20190205234805.5558ef98@gmail.com>
Date: Wed, 06 Feb 2019 10:22:59 +0530
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19020604-0028-0000-0000-000003450190
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19020604-0029-0000-0000-000024030C8E
Message-Id: <87k1idv7pw.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-06_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902060036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_205310_292570_7836768F 
X-CRM114-Status: GOOD (  24.78  )
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
Cc: linux-mtd@lists.infradead.org, Alban Bedel <albeu@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Boris Brezillon <boris.brezillon@collabora.com> writes:

> Hello Aneesh,
>
> On Tue,  5 Feb 2019 14:35:47 +0530
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:
>
>> This change helps me to get multiple mtd device registered. Without this
>> I get
>> 
>> sysfs: cannot create duplicate filename '/bus/nvmem/devices/flash0'
>> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.0.0-rc2-00557-g1ef20ef21f22 #13
>> Call Trace:
>> [c0000000b38e3220] [c000000000b58fe4] dump_stack+0xe8/0x164 (unreliable)
>> [c0000000b38e3270] [c0000000004cf074] sysfs_warn_dup+0x84/0xb0
>> [c0000000b38e32f0] [c0000000004cf6c4] sysfs_do_create_link_sd.isra.0+0x114/0x150
>> [c0000000b38e3340] [c000000000726a84] bus_add_device+0x94/0x1e0
>> [c0000000b38e33c0] [c0000000007218f0] device_add+0x4d0/0x830
>> [c0000000b38e3480] [c0000000009d54a8] nvmem_register.part.2+0x1c8/0xb30
>> [c0000000b38e3560] [c000000000834530] mtd_nvmem_add+0x90/0x120
>> [c0000000b38e3650] [c000000000835bc8] add_mtd_device+0x198/0x4e0
>> [c0000000b38e36f0] [c00000000083619c] mtd_device_parse_register+0x11c/0x280
>> [c0000000b38e3780] [c000000000840830] powernv_flash_probe+0x180/0x250
>> [c0000000b38e3820] [c00000000072c120] platform_drv_probe+0x60/0xf0
>> [c0000000b38e38a0] [c0000000007283c8] really_probe+0x138/0x4d0
>> [c0000000b38e3930] [c000000000728acc] driver_probe_device+0x13c/0x1b0
>> [c0000000b38e39b0] [c000000000728c7c] __driver_attach+0x13c/0x1c0
>> [c0000000b38e3a30] [c000000000725130] bus_for_each_dev+0xa0/0x120
>> [c0000000b38e3a90] [c000000000727b2c] driver_attach+0x2c/0x40
>> [c0000000b38e3ab0] [c0000000007270f8] bus_add_driver+0x228/0x360
>> [c0000000b38e3b40] [c00000000072a2e0] driver_register+0x90/0x1a0
>> [c0000000b38e3bb0] [c00000000072c020] __platform_driver_register+0x50/0x70
>> [c0000000b38e3bd0] [c00000000105c984] powernv_flash_driver_init+0x24/0x38
>> [c0000000b38e3bf0] [c000000000010904] do_one_initcall+0x84/0x464
>> [c0000000b38e3cd0] [c000000001004548] kernel_init_freeable+0x530/0x634
>> [c0000000b38e3db0] [c000000000011154] kernel_init+0x1c/0x168
>> [c0000000b38e3e20] [c00000000000bed4] ret_from_kernel_thread+0x5c/0x68
>> mtd mtd1: Failed to register NVMEM device
>> 
>> With the change we now have
>> 
>> /sys/bus/nvmem/devices# ls -al
>> total 0
>> drwxr-xr-x 2 root root 0 Feb  5 12:21 .
>> drwxr-xr-x 4 root root 0 Feb  5 12:21 ..
>> lrwxrwxrwx 1 root root 0 Feb  5 12:21 flash0 -> ../../../devices/platform/ibm,opal:flash@0/mtd/mtd0/flash0
>> lrwxrwxrwx 1 root root 0 Feb  5 12:21 flash1 -> ../../../devices/platform/ibm,opal:flash@1/mtd/mtd1/flash1
>> 
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  drivers/mtd/mtdcore.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index 999b705769a8..90035da3423c 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -503,10 +503,11 @@ static int mtd_nvmem_reg_read(void *priv, unsigned int offset,
>>  	return retlen == bytes ? 0 : -EIO;
>>  }
>>  
>> -static int mtd_nvmem_add(struct mtd_info *mtd)
>> +static int mtd_nvmem_add(struct mtd_info *mtd, int i)
>>  {
>>  	struct nvmem_config config = {};
>>  
>> +	config.id = i;
>>  	config.dev = &mtd->dev;
>>  	config.name = mtd->name;
>
> mtd->name should be unique in the first place, otherwise mtdparts
> parsing won't work (it's using mtd->name to match the device
> partitions should be applied to) and I guess there might be other
> issues. I know it's currently not enforced, but this kind of
> situation makes me realize we should enforce it.
>
> So the right fix would be to have config.id = -1 and ensure mtd->name
> is unique at MTD registration time.
>
> Back to your specific powernv case, using DT node name doesn't work, as
> the @<id> suffix is dropped, which means all your flash devices are
> named 'flash'.

How about 
	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFP", dev->of_node);

That gives me flash@0 name. Is that ok?

-aneesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
