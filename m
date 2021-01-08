Return-Path: <SRS0=9pOF=GL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,BIGNUM_EMAILS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F09C433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Jan 2021 12:55:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC42B23975
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Jan 2021 12:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC42B23975
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HL/p8Kf6LPyMhEvs5/IpXJFD6gnWrwKjkJYtkMZ1VxI=; b=t/K6UHalzQuQ/w7cq1EhNJdG/n
	FXdeDnFDCUjIcmik++AUoHajd8ooqby6VnCF3ZqNOInCTeYikv4HY+cRDGxLzyqTFNHmRoDUje1P5
	/hyrxDMvBJrdok8sIlYp1+kEqIpyp8631s8KsbN3Hd/j7zI2ZMHTyRUSg+2jlu/9ipyHaPzTi3gvJ
	f1rkuZ9e/4yhkjXdaYU9pqJiRpDPKezlrzAkEnFZvTcxvXdVWreRiiU6fZhqj2MP7As4/aOqEvfcf
	MPBS6csFRUpDBKuT7Z5baCebrBuni5/ATyw7j4av85p80Y1tbYgL08l3jKMYznQ9rXoe/w5FM99RC
	WE0AfFeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxrI9-00030x-7p; Fri, 08 Jan 2021 12:54:57 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxrI7-000305-EZ
 for linux-mtd@lists.infradead.org; Fri, 08 Jan 2021 12:54:56 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 108Co9Dm087258;
 Fri, 8 Jan 2021 12:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=bEeOzeG/Xg16qrEnrD1lxkIHtTeQKFJGusaYOB6VCsQ=;
 b=T8+8D4NuWFwnoJ+4PzXc0pwvWFYypFZiOmdKgUUV0P78oVtMlzGW/natyXV5mgePHgg2
 fS7DECRjyZv27PJ+JXq4g/70IVcOPw5eTGBWcF5/7Z0BPYvKmJA8GMADaaDEyFSrZ7oR
 cd/q1iybM5MNby0HVxtPSnPtfpuAKpIjPzt7RDN5FFjzd+UkyKzjSUsjSAUby4tVBDZj
 DFZsnHMTJIWxlADjtLwWSCn90AKglYz00gi8EeI9Qo9hXhmybi0Ryds2n7njMyyeFpoT
 WlsYDrVILwb9rrw4oOgY3bsVumCdQnNaDU2i0+5PcgVK+2Zf9VNJaca+34tOinlF0XXX IA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 35wftxgghq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 08 Jan 2021 12:54:50 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 108Cow1H001743;
 Fri, 8 Jan 2021 12:52:50 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 35v1fcjfdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Jan 2021 12:52:49 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 108CqlYx022425;
 Fri, 8 Jan 2021 12:52:48 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 08 Jan 2021 04:52:47 -0800
Date: Fri, 8 Jan 2021 15:52:41 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: manivannan.sadhasivam@linaro.org
Subject: [bug report] mtd: parsers: Add Qcom SMEM parser
Message-ID: <X/hVmWrQqLd09/KJ@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=893
 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101080072
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=898 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101080072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_075455_676271_85A9A4C9 
X-CRM114-Status: GOOD (  13.08  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Manivannan Sadhasivam,

The patch 803eb124e1a6: "mtd: parsers: Add Qcom SMEM parser" from Jan
4, 2021, leads to the following static checker warning:

	drivers/mtd/parsers/qcomsmempart.c:109 parse_qcomsmem_part()
	warn: passing zero to 'PTR_ERR'

drivers/mtd/parsers/qcomsmempart.c
    68          pr_debug("Parsing partition table info from SMEM\n");
    69          ptable = qcom_smem_get(SMEM_APPS, SMEM_AARM_PARTITION_TABLE, &len);
    70          if (IS_ERR(ptable)) {

Can "ptable" be NULL here?

    71                  pr_err("Error reading partition table header\n");
    72                  return PTR_ERR(ptable);
    73          }
    74  
    75          /* Verify ptable magic */
    76          if (le32_to_cpu(ptable->magic1) != SMEM_FLASH_PART_MAGIC1 ||
    77              le32_to_cpu(ptable->magic2) != SMEM_FLASH_PART_MAGIC2) {
    78                  pr_err("Partition table magic verification failed\n");
    79                  return -EINVAL;
    80          }
    81  
    82          /* Ensure that # of partitions is less than the max we have allocated */
    83          numparts = le32_to_cpu(ptable->numparts);
    84          if (numparts > SMEM_FLASH_PTABLE_MAX_PARTS_V4) {
    85                  pr_err("Partition numbers exceed the max limit\n");
    86                  return -EINVAL;
    87          }
    88  
    89          /* Find out length of partition data based on table version */
    90          if (le32_to_cpu(ptable->version) <= SMEM_FLASH_PTABLE_V3) {
    91                  len = SMEM_FLASH_PTABLE_HDR_LEN + SMEM_FLASH_PTABLE_MAX_PARTS_V3 *
    92                          sizeof(struct smem_flash_pentry);
    93          } else if (le32_to_cpu(ptable->version) == SMEM_FLASH_PTABLE_V4) {
    94                  len = SMEM_FLASH_PTABLE_HDR_LEN + SMEM_FLASH_PTABLE_MAX_PARTS_V4 *
    95                          sizeof(struct smem_flash_pentry);
    96          } else {
    97                  pr_err("Unknown ptable version (%d)", le32_to_cpu(ptable->version));
    98                  return -EINVAL;
    99          }
   100  
   101          /*
   102           * Now that the partition table header has been parsed, verified
   103           * and the length of the partition table calculated, read the
   104           * complete partition table
   105           */
   106          ptable = qcom_smem_get(SMEM_APPS, SMEM_AARM_PARTITION_TABLE, &len);
   107          if (IS_ERR_OR_NULL(ptable)) {
   108                  pr_err("Error reading partition table\n");
   109                  return PTR_ERR(ptable);

If "ptable" is NULL then this code returns success.  It's not clear if
that's intentional.  If it is then just ignore this email.  Thanks!

   110          }
   111  
   112          parts = kcalloc(numparts, sizeof(*parts), GFP_KERNEL);

regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
