Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60F4C43217
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Nov 2022 22:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rLa/QjWe2lFOwaNFM46FW3JXCKXNiJNyn17EkJZbiXk=; b=fMWcDXWmoDbWeB
	pYPSPrnE/7WSEIC4ixaYyF87IMz8JTTJov+99E5eoU3tFyMjxnuRRQCpFU4UIhrgVQy/EL9mH05P4
	VFB7KLEoB4xatmIHvN6hIgWQpXWfq4+YG6OZOmKKV9tNUlj4XnsAcZkHJQCeLRgJSp12GH6Cbk7Hn
	1k3Th7lCpBAxwqxDWESRiItYu17MpEVc4wpxjJhpje4faEJIzTXXPdzM2Ejp54dNUgd3uR5CnrKOq
	ZpQWQhJtPBgJGidINciXq+7jk+MW1G4A+aaHFT2Ex+ao4Zrc0FGiloYLkttQ+8ObHlqd3eTLW2iQi
	1e3Vc8cPYyjZEIIc6JZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqMY3-00EmC8-G8; Wed, 02 Nov 2022 22:49:27 +0000
Received: from mx0b-00105401.pphosted.com ([67.231.152.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqMXu-00Em5s-Gm
	for linux-mtd@lists.infradead.org; Wed, 02 Nov 2022 22:49:21 +0000
Received: from pps.filterd (m0075793.ppops.net [127.0.0.1])
	by mx0b-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 2A2IOPfX005649;
	Wed, 2 Nov 2022 22:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=7H2bdSij3eQrpkhHUeznDlahY+pAQ7RJh5JpVB8rdBc=;
 b=tYVDpWy9E4hsfPiPkz1gYnb2tNzwrvDCmpZEalPKVdTcKzEBy5lZXSmHqa2Rm/moUkEP
 sqVrnmAUQUCXmM2BOHHfHBpwOz9RpRY/5fandB/qVQ8MMHOJDynO5D63wNYbCK7r3g2f
 9Jp3EmZetGypKdo0qHhvArdqppcx/mmb5xy4wSE0FfMU9YA+tVoIHw+yGlYnygKhd8f+
 Zefp6M7gOY87OJVc+pa+9S1scEu67CeTMJdd4OGyq711BQC49c9kMgXwFlghTluLyIIx
 ivtnZNjfCLH+vI2TQ6Eo0IxFebT+e0IeZNcC7AnWP8nDBy2K7rqp2gP7xDyLOV5Bf5nQ gA== 
Received: from xnwpv35.utc.com ([167.17.239.15])
	by mx0b-00105401.pphosted.com with ESMTP id 3kkk199sxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Nov 2022 22:49:15 +0000
Received: from qusnwady.utcapp.com (QUSNWADY.utcapp.com [10.161.48.89])
	by xnwpv35.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 2A2MnEb1074106
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Nov 2022 22:49:14 GMT
Received: from ciulimr02.rockwellcollins.com ([10.172.224.19])
	by qusnwady.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 2A2MnEUI030964
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 2 Nov 2022 22:49:14 GMT
X-Received: from kirk.rockwellcollins.lab (kirk.rockwellcollins.lab [10.148.204.208])
	by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id D59DA20097;
	Wed,  2 Nov 2022 17:49:13 -0500 (CDT)
From: Brandon Maier <brandon.maier@collins.com>
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
        Brandon Maier <brandon.maier@collins.com>
Subject: [PATCH mtd-utils 7/7] misc-utils: flashcp: abort on --partition and --erase-all
Date: Wed,  2 Nov 2022 17:47:57 -0500
Message-Id: <20221102224757.58012-8-brandon.maier@collins.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102224757.58012-1-brandon.maier@collins.com>
References: <20221102224757.58012-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: eMPByha7rMdC2Lfd-HJi2DI8f6uYArmG
X-Proofpoint-GUID: eMPByha7rMdC2Lfd-HJi2DI8f6uYArmG
X-Proofpoint-Spam-Details: rule=outbound_default_notspam policy=outbound_default score=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 phishscore=0 clxscore=1011
 mlxscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211020119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_154918_686612_435869C1 
X-CRM114-Status: GOOD (  14.89  )
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

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 misc-utils/flashcp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/misc-utils/flashcp.c b/misc-utils/flashcp.c
index 13ff2f1..80f2086 100644
--- a/misc-utils/flashcp.c
+++ b/misc-utils/flashcp.c
@@ -283,6 +283,9 @@ int main (int argc,char *argv[])
 	if (flags & FLAG_HELP || device == NULL)
 		showusage(flags != FLAG_HELP);
 
+	if (flags & FLAG_PARTITION && flags & FLAG_ERASE_ALL)
+		log_failure("Option --partition does not support --erase-all\n");
+
 	atexit (cleanup);
 
 	/* get some info about the flash device */
-- 
2.38.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
