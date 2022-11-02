Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5516FC4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Nov 2022 22:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NO3/hyHG1zztoMjVpyhCdffpbJG7CtR60+d0iLMxmS4=; b=vUA4scGFZYGFgg
	US3JFq2aRG47nTfYmCi02uO5gMD3XFsBfddemCeVoGVYNt6LJjWrC69DS80tYb0ZUkdX6IDUIyqiN
	UAhUANNECO3G/vqWFgpAkH9OWJKKdsQZrpvYV0sPw4K+Ncl21cccjkO1tVt2Cb1gh/pXeDLRA5FOe
	n2qMeokTHQ+9NJ0lFD5vW50qcbWULaEVI21omr33yoX8Q9q0AOZFvHSPVc2hn8FSHJfseDAakKAor
	uVCaojf1glXrotE/QFSQ3sMKg4yCa0CjfRlY4TzdKIRN6NEQ/VpfRDYk8yVA7kTiDmuLP06ppx84a
	7wRzw9hqo26ChXb6edWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqMXx-00Em9e-Gz; Wed, 02 Nov 2022 22:49:21 +0000
Received: from mx0a-00105401.pphosted.com ([67.231.144.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqMXu-00Em5h-8f
	for linux-mtd@lists.infradead.org; Wed, 02 Nov 2022 22:49:19 +0000
Received: from pps.filterd (m0078137.ppops.net [127.0.0.1])
	by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 2A2MeOlf031090;
	Wed, 2 Nov 2022 22:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=8SHyD9eUEeybnycLiEUrfaizzRbamsWzSvBtdlMM57w=;
 b=dP/dHqfmMZMtM2B6d1OWBKvY3lURcvtmlDHQ0g0QK9WwokuUxetG3uLe1Drak6DepC0b
 vPDLGtarzlNyqWjojZV+j+mCPkQFILjeeTUtjnjsU88M2AOM0nIji0n/MeJvnI+5nqgq
 NGUXzz5i9WTbTvZwhbquIXGzhFVoC2pRnBbzhuYJmCwMD7wtR0FSOM9yTeff0LEchS5B
 L0hl4K/MigY+Jw0Y2i90+sO4H/xQYYbXYrSQ5F/tIZlo2l1PnsCnsd9CCuZyaIQLSR7x
 h3OsJZHfUNDzAwbTzZ2r1g0MFlqgfcUvLuASmQhx+ADuS51exdvXRv0vpffJsgpfJe2V Mw== 
Received: from xnwpv38.utc.com ([167.17.239.18])
	by mx0a-00105401.pphosted.com with ESMTP id 3kksese6as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Nov 2022 22:49:15 +0000
Received: from qusnwafe.utcapp.com (qusnwafe.utcapp.com [10.161.48.101])
	by xnwpv38.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 2A2MnD4l164377
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Nov 2022 22:49:13 GMT
Received: from ciulimr02.rockwellcollins.com ([10.172.224.19])
	by qusnwafe.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 2A2MnDvp016253
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 2 Nov 2022 22:49:13 GMT
X-Received: from kirk.rockwellcollins.lab (kirk.rockwellcollins.lab [10.148.204.208])
	by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 4D32A20092;
	Wed,  2 Nov 2022 17:49:13 -0500 (CDT)
From: Brandon Maier <brandon.maier@collins.com>
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
        Brandon Maier <brandon.maier@collins.com>
Subject: [PATCH mtd-utils 0/7] misc-utils: flashcp: Bugfixes to --partition
Date: Wed,  2 Nov 2022 17:47:50 -0500
Message-Id: <20221102224757.58012-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: mYhRAXps1NXMJTQ8VuuLxy9rNXmY61po
X-Proofpoint-GUID: mYhRAXps1NXMJTQ8VuuLxy9rNXmY61po
X-Proofpoint-Spam-Details: rule=outbound_default_notspam policy=outbound_default score=0
 mlxlogscore=957 malwarescore=0 clxscore=1011 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211020151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_154918_361663_2053172F 
X-CRM114-Status: GOOD (  13.16  )
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

Discovered an assortment of issues with the flashcp --partition code:
- not checking lseek() for errors
- overflowing the src and dest buffers
- not verifying data is written succesfully
- silently ignoring --erase-all

The patches "add safe_*" and "simplify logging" do not fix bugs but are
code cleanup.

Brandon Maier (7):
  misc-utils: flashcp: add safe_write
  misc-utils: flashcp: check for lseek errors
  misc-utils: flashcp: add safe_memerase
  misc-utils: flashcp: simplify logging
  misc-utils: flashcp: fix buffer overflow
  misc-utils: flashcp: verify data in --partition
  misc-utils: flashcp: abort on --partition and --erase-all

 misc-utils/flashcp.c | 284 +++++++++++++++++++++----------------------
 1 file changed, 138 insertions(+), 146 deletions(-)

-- 
2.38.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
