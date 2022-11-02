Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA75C433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Nov 2022 22:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vRvOGw/syxy08rDWERH1E5rr/d5cLfwCWLFnksXIv0Y=; b=0DA1A3CSkhKSKg
	H8OcNMNmpTEjwGhi0PWmCbagYdrcr2LapoX4iOq2sIHRJFb3KvRAiTNhUJvoSUfEVCq1uJdGDML2P
	4XFufMTus4btaIUg/0bzqJrA6Ds1cbQxUvLmydDhAUocfg7Tmx4ue7BMTPgDldrrKQI225HPQV+Ny
	nrMPHt8UcPd0dC+vG7MIpv/fXZHlNZfR7D/bGX8i7of8edHy+0rAEaELzRPfKyNaUEWuwFa1uFh1Z
	F9cnRGKEVZugXDpKuSJiG8QiRWN/PDLIbhGAwDXQE4pU5LVvIq9iDiceB4k2iuegfjEv/HDlzbiGh
	fggJUamXuYDpRL8Yq96A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqMY1-00EmBb-Kq; Wed, 02 Nov 2022 22:49:25 +0000
Received: from mx0a-00105401.pphosted.com ([67.231.144.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqMXu-00Em5x-9Y
	for linux-mtd@lists.infradead.org; Wed, 02 Nov 2022 22:49:21 +0000
Received: from pps.filterd (m0078137.ppops.net [127.0.0.1])
	by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 2A2Medis031662;
	Wed, 2 Nov 2022 22:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=pjCMiIbua9TLm2GCFrHf3aY7+IAWdA2o+ZZ1n9GRSeo=;
 b=am0DCopJa4CVytEOwy4rkSHI9AqapDrxzyqJPqU5tAP9Ni1avzjqO/PwvF4v4iZKosp2
 yhaBYDkJoSjLOEy9GeMs5EZrXHo/L7bFpth4VU5mydFByRfxnzamRZEmGCghGv1gkyqr
 RnJMgHGTQyJWWIu9e7KKb1MsaThJ4RnKsNdJTcTJ5H7a4fkeqvuYaC8PNU9HVhVkHtS5
 ycRsXIpAwxJNAauWPm8mx0Hc80sqSgo/U0I/kyoOm2ZApL3vpeSrYitMPlt3tgDu/x6h
 HsP+GKIydwu2vaoJlC3uOaggSlQCpEzufxLe3/6koveX5TG/F/M16/2PoPlRD2kXdQOR 8A== 
Received: from xnwpv35.utc.com ([167.17.239.15])
	by mx0a-00105401.pphosted.com with ESMTP id 3kksese6av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Nov 2022 22:49:15 +0000
Received: from qusnwadv.utcapp.com (QUSNWADV.utcapp.com [10.161.48.86])
	by xnwpv35.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 2A2MnE8w074105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Nov 2022 22:49:14 GMT
Received: from ciulimr02.rockwellcollins.com ([10.172.224.19])
	by qusnwadv.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 2A2MnELU001706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 2 Nov 2022 22:49:14 GMT
X-Received: from kirk.rockwellcollins.lab (kirk.rockwellcollins.lab [10.148.204.208])
	by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id AC9D3200A4;
	Wed,  2 Nov 2022 17:49:13 -0500 (CDT)
From: Brandon Maier <brandon.maier@collins.com>
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
        Brandon Maier <brandon.maier@collins.com>
Subject: [PATCH mtd-utils 5/7] misc-utils: flashcp: fix buffer overflow
Date: Wed,  2 Nov 2022 17:47:55 -0500
Message-Id: <20221102224757.58012-6-brandon.maier@collins.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102224757.58012-1-brandon.maier@collins.com>
References: <20221102224757.58012-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: nQ2OIzW21jLMD2gMcCogUIrNEI7yJgdY
X-Proofpoint-GUID: nQ2OIzW21jLMD2gMcCogUIrNEI7yJgdY
X-Proofpoint-Spam-Details: rule=outbound_default_notspam policy=outbound_default score=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211020151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_154918_387065_9C3E1300 
X-CRM114-Status: GOOD (  19.49  )
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

The DIFF_BLOCKS code requires that src and dest buffers be large enough
to hold one MTD erasesize. This is because each loop operates on one
eraseblock so that it can erase and write one whole sector. But the src
and dest buffers are fixed at BUFSIZE, so on platforms where the MTD
erasesize are larger then BUFSIZE it will overflow the buffers.

Instead allocate the buffers dynamically so that they can be sized to
fit the erasesize.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 misc-utils/flashcp.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/misc-utils/flashcp.c b/misc-utils/flashcp.c
index 9e669b4..02be081 100644
--- a/misc-utils/flashcp.c
+++ b/misc-utils/flashcp.c
@@ -57,9 +57,6 @@
 #define KB(x) ((x) / 1024)
 #define PERCENTAGE(x,total) (((x) * 100) / (total))
 
-/* size of read/write buffer */
-#define BUFSIZE (10 * 1024)
-
 /* cmd-line flags */
 #define FLAG_NONE		0x00
 #define FLAG_HELP		0x02
@@ -222,7 +219,7 @@ int main (int argc,char *argv[])
 	struct mtd_info_user mtd;
 	struct erase_info_user erase;
 	struct stat filestat;
-	unsigned char src[BUFSIZE],dest[BUFSIZE];
+	unsigned char *src,*dest;
 
 	/*********************
 	 * parse cmd-line
@@ -305,6 +302,14 @@ int main (int argc,char *argv[])
 	if (filestat.st_size > mtd.size)
 		log_failure("%s won't fit into %s!\n",filename,device);
 
+	src = malloc(mtd.erasesize);
+	if (!src)
+		log_failure("Malloc failed");
+
+	dest = malloc(mtd.erasesize);
+	if (!dest)
+		log_failure("Malloc failed");
+
 	/* diff block flashcp */
 	if (flags & FLAG_PARTITION)
 	{
@@ -356,11 +361,11 @@ int main (int argc,char *argv[])
 
 	log_verbose ("Writing data: 0k/%lluk (0%%)",KB ((unsigned long long)filestat.st_size));
 	size = filestat.st_size;
-	i = BUFSIZE;
+	i = mtd.erasesize;
 	written = 0;
 	while (size)
 	{
-		if (size < BUFSIZE) i = size;
+		if (size < mtd.erasesize) i = size;
 		log_verbose ("\rWriting data: %dk/%lluk (%llu%%)",
 				KB (written + i),
 				KB ((unsigned long long)filestat.st_size),
@@ -387,12 +392,12 @@ int main (int argc,char *argv[])
 	safe_rewind (fil_fd,filename);
 	safe_rewind (dev_fd,device);
 	size = filestat.st_size;
-	i = BUFSIZE;
+	i = mtd.erasesize;
 	written = 0;
 	log_verbose ("Verifying data: 0k/%lluk (0%%)",KB ((unsigned long long)filestat.st_size));
 	while (size)
 	{
-		if (size < BUFSIZE) i = size;
+		if (size < mtd.erasesize) i = size;
 		log_verbose ("\rVerifying data: %luk/%lluk (%llu%%)",
 				KB (written + i),
 				KB ((unsigned long long)filestat.st_size),
-- 
2.38.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
