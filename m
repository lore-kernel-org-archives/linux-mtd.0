Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012D0C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Nov 2022 14:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dcte6N2RW7lzlkWBfpx+N/pBf2Wb0P2hsZyS335LycA=; b=FzoGp5NwtLAzdC
	DJaqgeJK+PDddeSZaTKUfHsxpE9MAza1gvXm8ol0RWCmu8j9OV2GUzm0eaZtKJVtPT/hhylSy0Jvz
	4NvM3eFzm9x7dEoYYyFYbu9+Q4J7k0f/iNvrHP+BWPS6CO5Mp884K8ux7v4f9yn/JofQPKwsC5aob
	fwnPWJwL7L9hDXybcUKfXsyiEZQN0lu7k7XljsRDXaJ0jCbTi3eM7Q2VPIsK0jI6UGqrYnHaUyN0f
	ZEI9JO00o2+MaeGdd2rcsNUYraXOpEylvqgdEdZdNsx/5zrRcUJZBAuGb7EL+bIusMBK7gTYEKnHt
	deSXnqPy87ffpcBEzbPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqaxX-0002jS-Mc; Thu, 03 Nov 2022 14:12:43 +0000
Received: from mx0b-00105401.pphosted.com ([67.231.152.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqaxS-0002e1-Qe
	for linux-mtd@lists.infradead.org; Thu, 03 Nov 2022 14:12:42 +0000
Received: from pps.filterd (m0074334.ppops.net [127.0.0.1])
	by mx0b-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 2A3E9hcq022110;
	Thu, 3 Nov 2022 14:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=ShNH+c1jpFuSqUCy6kalHE7BkDip9aTmBnd6SbmxonI=;
 b=YnPMlTwbSuRV+hbA6TProOSK7WqwCwZ0VnyYk04lAse07gH1RsGiWlVaolEK35KvYFcU
 GA2sNQn5VWXLI4ztHAcAyH4qi7wkkpD++Y2TaLt8iUTZaLKeMI48QSS9CTw8eeX1GDj8
 3gVoyS42654WYDZF+SzT/cLoyiY86rFH7X6Z8I/Dl8PRSp7gNi73yM/HfN+cV/exBmDC
 qpdM7lkQFsyGnF596IUpioS/VsLFzAqci59Fbk//a9vTYFlFtgwM/efMlrgQyq3z5yIt
 h3NdtuJoern1w1IRW5MvRBgKl2bjlXM8fl5xf2YWnx5XwOH4+MEJk8Pf6TnmU0FYIM/R 9w== 
Received: from xnwpv38.utc.com ([167.17.239.18])
	by mx0b-00105401.pphosted.com with ESMTP id 3km2tfdv9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Nov 2022 14:12:25 +0000
Received: from qusnwafe.utcapp.com (qusnwafe.utcapp.com [10.161.48.101])
	by xnwpv38.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 2A3ECOC4069935
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Nov 2022 14:12:24 GMT
Received: from dtulimr01.rockwellcollins.com ([10.172.224.19])
	by qusnwafe.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 2A3ECO0P022191
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 3 Nov 2022 14:12:24 GMT
X-Received: from kirk.rockwellcollins.lab (kirk.rockwellcollins.lab [10.148.204.208])
	by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id E6126604EE;
	Thu,  3 Nov 2022 09:12:23 -0500 (CDT)
From: Brandon Maier <brandon.maier@collins.com>
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
        Brandon Maier <brandon.maier@collins.com>
Subject: [PATCH mtd-utils 1/1] misc-utils: mtdpart: document partition of size 0
Date: Thu,  3 Nov 2022 09:12:17 -0500
Message-Id: <20221103141217.22119-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Proofpoint-GUID: 1xo5FFqYtr5jrVQBFKxPbQ1N_00swbaZ
X-Proofpoint-ORIG-GUID: 1xo5FFqYtr5jrVQBFKxPbQ1N_00swbaZ
X-Proofpoint-Spam-Details: rule=outbound_default_notspam policy=outbound_default score=0 clxscore=1015
 malwarescore=0 adultscore=0 mlxscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211030097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_071239_025791_F6101071 
X-CRM114-Status: GOOD (  16.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If the partition size passed in to the BLKPG_ADD_PARTITION ioctl is 0,
Linux will make the partition fill to the end of the device[1]. Document
this feature in the help.

[1] https://elixir.bootlin.com/linux/v6.0.6/source/drivers/mtd/mtdpart.c#L254

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 misc-utils/mtdpart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/misc-utils/mtdpart.c b/misc-utils/mtdpart.c
index ba35d87..c8cd79b 100644
--- a/misc-utils/mtdpart.c
+++ b/misc-utils/mtdpart.c
@@ -37,7 +37,7 @@ static void display_help(int status)
 "  -V, --version Output version information and exit\n"
 "\n"
 "START location and SIZE of the partition are in bytes. They should align on\n"
-"eraseblock size.\n",
+"eraseblock size. If SIZE is 0 the partition will go to end of MTD device.\n",
 	PROGRAM_NAME
 	);
 	exit(status);
-- 
2.38.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
