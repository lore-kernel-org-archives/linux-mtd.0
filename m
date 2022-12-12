Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A75C00145
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Dec 2022 18:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B2d0RYpgqPw1CzBreV+3COoBCGLxEJBMIoK25mKiPSg=; b=0uthvpAZt9TFZm
	PcrmGwnTIvms5MegaxH31sVjQvh7rlciy+zUuMhXfwJYANgx3tIzjiuX6+SPRPZCJ2o7qGj3f2g+B
	Au08gfGn/NopG7a0MSLD0czrObLcd4Hf6NfVHlK/qW0sEo57u4nay83LEpfoFZqcdF1PmzAehtEX5
	/WdWwLbvfsSZD7cVakbKXGTwFcrKZJRG/a8fHyQ3AbWcSrzmcK9t7rk7C8htmzis6lLUTlQokZqSN
	hXDdIE5IOAF1q6djVhKf4u+kW0tYIA7HKesy2zU9iy5TwBD3LbrYytwh3eRUU9eEEnmPMGKIJS1mU
	IF4u3JPa8VuYtSvnjhdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4n8K-003Oef-3H; Mon, 12 Dec 2022 18:02:32 +0000
Received: from mx0a-00105401.pphosted.com ([67.231.144.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4n8D-003OWk-8f
	for linux-mtd@lists.infradead.org; Mon, 12 Dec 2022 18:02:27 +0000
Received: from pps.filterd (m0075556.ppops.net [127.0.0.1])
	by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 2BCHxPZY041008;
	Mon, 12 Dec 2022 18:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=H+KACB49SyYfbGVgiE0/xTXzArUsJ9SoGOxej1nl4ag=;
 b=kOFx2SPepAdxaVy33BqXJkQ6UZIzy6PspPSFvIt2wTipmyvhK8kTAKy/28mQvZu1PeRR
 hfEmulxEXSqJ5JnQ9P8V8ZUPS51HRKUgMUlFvOMVn29JDW9kPXD0tgss6MjyIRWZ26IG
 L5Oph1hhwQcMR2ReUo8oOi+xdnwlq4QAxd4kMcPggd951L6aZVNcRMCQlDdK7txmHRqI
 iQN76OUaHn9/yIqg/+hSL7ng2poQOUKMllkmL7chuID47x6zzbJXmRc6inSLcSmQgWc8
 WipzhClg/CCyJS5cdCHMHVXDHnrVzk40G1+fA+a7FxwVHa52rAloklnOyBgHNuWjBSOy /A== 
Received: from xnwpv35.utc.com ([167.17.239.15])
	by mx0a-00105401.pphosted.com with ESMTP id 3mch2bvx75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Dec 2022 18:02:15 +0000
Received: from qusnwaff.utcapp.com (qusnwaff.utcapp.com [10.161.48.102])
	by xnwpv35.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 2BCI2EHW171127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Dec 2022 18:02:14 GMT
Received: from dtulimr02.rockwellcollins.com ([10.172.224.19])
	by qusnwaff.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 2BCI2DkM001658
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 12 Dec 2022 18:02:14 GMT
X-Received: from kirk.rockwellcollins.lab (kirk.rockwellcollins.lab [10.148.204.208])
	by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id 7BDFC20042;
	Mon, 12 Dec 2022 12:02:13 -0600 (CST)
From: Brandon Maier <brandon.maier@collins.com>
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
        Brandon Maier <brandon.maier@collins.com>
Subject: [PATCH mtd-utils 0/2] Support referencing MTD devices by name
Date: Mon, 12 Dec 2022 12:01:56 -0600
Message-Id: <20221212180158.57833-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.38.2
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: quk5xdCR-Mv0bE467alN-T2LLVOBP3Ai
X-Proofpoint-GUID: quk5xdCR-Mv0bE467alN-T2LLVOBP3Ai
X-Proofpoint-Spam-Details: rule=outbound_default_notspam policy=outbound_default score=0 spamscore=0
 suspectscore=0 clxscore=1011 impostorscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_100225_331881_30BBF400 
X-CRM114-Status: GOOD (  15.71  )
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

This series adds an libmtd function and support to various MTD utilities
for looking up MTD devices by their name.

The first patch adds mtd_get_dev_info2(), an optimized function for
looking up MTD device by name with /sys/class/mtd or legacy /proc/mtd.

The second patch wraps mtd_get_dev_info2() with a helper function that
accepts Linux filesystem mount style "mtd:<name>" string and tries to
translate it to the /dev/mtdX device node. It then hooks the helper
function into a subset of tools.

There are probably many more tools in mtd-utils that could be hooked in,
but this is a proof-of-concept. More could be supported if this series
is acceptable.

Brandon Maier (2):
  libmtd: Add function to get MTD info by device name
  mtd-utils: Add new syntax to get devices by name

 include/common.h                 |  1 +
 include/libmtd.h                 | 13 +++++-
 lib/common.c                     | 46 +++++++++++++++++++++
 lib/libmtd.c                     | 68 +++++++++++++++++++++++++++++++-
 lib/libmtd_int.h                 |  1 +
 lib/libmtd_legacy.c              | 38 ++++++++++++++++++
 misc-utils/Makemodule.am         |  5 +++
 misc-utils/flash_erase.c         |  6 ++-
 misc-utils/flash_unlock.c        |  9 ++++-
 misc-utils/flashcp.c             |  7 +++-
 misc-utils/mtd_debug.c           |  7 +++-
 misc-utils/mtdpart.c             |  7 +++-
 tests/mtd-tests/flash_readtest.c | 10 +++--
 tests/mtd-tests/flash_speed.c    | 10 +++--
 tests/mtd-tests/flash_stress.c   | 10 +++--
 tests/mtd-tests/flash_torture.c  | 10 +++--
 ubi-utils/mtdinfo.c              | 13 ++++--
 17 files changed, 237 insertions(+), 24 deletions(-)

-- 
2.38.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
