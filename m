Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2282C7EE30
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jun 2025 18:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sw6PDuM94wWYpM0ez1jL9m7PBU0s8YuKUS0z7rrKsSs=; b=0juVbVfn4pl9Ly
	SSaBXi/uYZ5GUqJOuO0RDGwjG8ArvUacaIbLkvERW/wmrn29YweelbDdGMO7RhpzrUbeRgvtaQcVW
	qiPnIVBeki6GXSJMFZET6htp4NCE6Z6O776aYGuEumvIahmCvvsgH6U+gkmBPpIXwBDU9UREO8jAK
	bNd1bHWjWf1tiv409TiE3YzKJ4wxvglpnQuX43aI7iyFXs0Zvrvd8ozPtTWlOyyEl4uT+o847W5g9
	7WJgEPA/1JofZTDVhN7ndKm/aiMUdEaCrC+W7f0T2y/OLSAteAHmBt+muYJ3TxMkCewwE4Hm9IKK4
	kecel9WxifLrrbv23Pmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUsf-00000009awb-1iOB;
	Wed, 25 Jun 2025 18:29:57 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUT1n-00000009Iws-1ReS
	for linux-mtd@lists.infradead.org;
	Wed, 25 Jun 2025 16:31:19 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PFw81R012645;
	Wed, 25 Jun 2025 18:31:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	sYD/Lymlz7Mf2jc6nosjwnFLo2PusAF37AUx9QeP1Cg=; b=rh6geYpCt/a5QcHE
	Zg4iGmEtUbuC2rwrdezwKyU+87+2fCJpBJDjqzZaXVlyPLuewIdOevNI1GSeyKAr
	CnGMnOzWLlc4TRaP/DhGtvQtQw7MlttlbJXiQuPoYzKBTZCVSER5q5MgPI2ACYP4
	mpZeDT5HIVzcKN6rmJdbSx6SSgA7iPLyCLN+FJICA33t5Ttro0qPp+VEkQXvqY64
	194e7gv4CQbI04t0D+8/1tb1ANkTEPhXPywiBoFZfcJrD5XF7l4Lhm/sfEpESg/u
	y/4AnYW12AZEw6VfOMtqFugF8TV+asMQwKs36PQjceVjlRvuZjieC5VBpU/7y/Kh
	AGZtOA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47e6a6rsdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 18:31:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 825BC40044;
	Wed, 25 Jun 2025 18:30:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 55CA8BF539D;
	Wed, 25 Jun 2025 18:29:27 +0200 (CEST)
Received: from [10.48.86.103] (10.48.86.103) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 18:29:26 +0200
Message-ID: <f174540e-4b9a-4dc1-9ab8-f4f36fe1f837@foss.st.com>
Date: Wed, 25 Jun 2025 18:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fscrypt: don't use hardware offload Crypto API drivers
To: Eric Biggers <ebiggers@kernel.org>,
        Simon Richter
	<Simon.Richter@hogyros.de>
CC: <linux-fscrypt@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-ext4@vger.kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>,
        <ceph-devel@vger.kernel.org>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
 <20250612005914.GA546455@google.com> <20250612062521.GA1838@sol>
 <20250625063252.GD8962@sol>
Content-Language: en-US
From: Maxime MERE <maxime.mere@foss.st.com>
In-Reply-To: <20250625063252.GD8962@sol>
X-Originating-IP: [10.48.86.103]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_05,2025-06-25_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_093115_716076_B10A9A25 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 6/25/25 08:32, Eric Biggers wrote:
> That was the synchronous throughput.  However, submitting multiple requests
> asynchronously (which again, fscrypt doesn't actually do) barely helps.
> Apparently the STM32 crypto engine has only one hardware queue.
> 
> I already strongly suspected that these non-inline crypto engines aren't worth
> using.  But I didn't realize they are quite this bad.  Even with AES on a
> Cortex-A7 CPU that lacks AES instructions, the CPU is much faster!

 From a performance perspective, using hardware crypto offloads the CPU, 
which is important in real-world applications where the CPU must handle 
multiple tasks. Our processors are often single-core and not the highest 
performing, so hardware acceleration is valuable.

I can show you performance test realized with openSSL (3.2.4) who shows, 
less CPU usage and better performance for large block of data when our 
driver is used (via afalg):

command used: ```openssl speed -evp aes-256-cbc -engine afalg -elapsed```

+--------------------+--------------+-----------------+
| Block Size (bytes) | AFALG (MB/s) | SW BASED (MB/s) |
+--------------------+--------------+-----------------+
| 16                 | 0.09         | 9.44            |
| 64                 | 0.34         | 11.43           |
| 256                | 1.31         | 12.08           |
| 1024               | 4.96         | 12.27           |
| 8192               | 18.18        | 12.33           |
| 16384              | 22.48        | 12.33           |
+--------------------+--------------+-----------------+

to test CPU usage I've used a monocore stm32mp157f.
here with afalg, we have an average CPU usage of ~75%, with the sw based
approach CPU is used at ~100%

Maxime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
