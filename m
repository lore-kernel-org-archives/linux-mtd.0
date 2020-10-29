Return-Path: <SRS0=x3fM=EE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA67C2D0A3
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 10:28:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3216220782
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 10:28:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jSwQTrZX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LNadpuhd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3216220782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zv+IuFkZvlW7858MprT1BtWse0AIqytZc8VO0xDe1Pk=; b=jSwQTrZXICuTvvEKNGWEF/b6G
	j7GXX/xCC1ZDYkTbXttlSMvka/HTpjtbjqZeDET0NUA2a39bVbyhmvyfxV/yZCE7HzUAlSH0sLlit
	5+4XRWszwXv0W12Sxgk6lP5vQQwMkBI176DfWl49WScGL8NrLRbrn6U4wZX+IKHSlpq1KMed41+FY
	/4yW82tPV2BwcpbIj7eMBjuIhdaey5p605uUaLC+ivjGOKokg59ewT/NGsqiK3sEKO1jzQpGDinQo
	jKc4/tYVL2P1HPRY7guCV+t4F8HgCbHixuqsqaRorzlz/uw8Ahcm5JghrsTSsaPDv7x6ECAWfFV1u
	LjP/lhx1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY59W-0001PU-5Q; Thu, 29 Oct 2020 10:27:30 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY59T-0001OZ-3x
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2020 10:27:28 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09TAP8Qc050909;
 Thu, 29 Oct 2020 10:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Z1RnQs5AS1k/4IU0PDUoJ10hVum68KtlJR+3BjGbDbU=;
 b=LNadpuhdggdCxvL3LIz6redN2lULWMuK0SqSSgmcoMgDn2a/RDCK6BuzGw+gHe57OSy/
 23fCbHueri58FLZZfd32OAcVb/yz/o8/qd/IgAXB1Xqz9X4f1Joj3nyN6avdYXCzlV5L
 FKC1Pj/AVZcPcFGdBXuvhfLyc7MmEYxfCZV3XqU/oPCmQepIhaArYTZUpWYYwmRwxUYa
 347s3VfC+lKrlw61K6Is12pmRvcRhkKcUhFexic574fCYKbWPMQYJTqPiPYrPG2C2g+J
 MTSjhQ+WTlxUWO0MyAQQDMtOtCN0Kx1rLzILJ8A6zcrWiSPpJZfH1NDJrw8eVOh4dSad 0A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 34cc7m41nu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 29 Oct 2020 10:27:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09TAQARU157091;
 Thu, 29 Oct 2020 10:27:17 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 34cx60bs6y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Oct 2020 10:27:16 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09TARDgg004536;
 Thu, 29 Oct 2020 10:27:14 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 29 Oct 2020 03:27:13 -0700
Date: Thu, 29 Oct 2020 13:27:05 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: nand: ecc-hamming: Clarify the logic around rp17
Message-ID: <20201029102705.GR18329@kadam>
References: <20201029083847.21128-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201029083847.21128-1-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9788
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010290076
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9788
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1011 mlxscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010290076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_062727_247789_B27B6ED0 
X-CRM114-Status: GOOD (  23.49  )
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
Cc: Richard Weinberger <richard@nod.at>, kernel test robot <lkp@intel.com>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Oct 29, 2020 at 09:38:47AM +0100, Miquel Raynal wrote:
> This code has been written in 2008 and is fine, but in order to keep
> robots happy, I think it's time to change a little bit this code just
> to clarify the different possible values of eccsize_mult. Indeed, this
> variable may only take the value 1 or 2 because step_size, in the case
> of the software Hamming ECC engine may only be 256 or 512. Depending
> on the value of eccsize_mult, an extra rp17 variable is set, or not
> and triggers the following warning:
> 
>      smatch warnings:
>      ecc_sw_hamming_calculate() error: uninitialized symbol 'rp17'.
> 
> As highlighted by Dan Carpenter, if the only possible values for
> eccsize_mult are 1 and 2, then the code is fine, but "it's hard to
> tell just from looking".
> 
> So instead of shifting step_size, let's use a ternary condition to
> assign to eccsize_mult the only two possible values and clarify the
> driver's logic.
> 
> Now that the situation is clarified for humans, set rp17 to 0 in an
> else block to keep robots silent as well.

Smatch will parse it correctly with just the ternary change but there
might be other checkers which want the the else statement.  I'm not
sure.  GCC doesn't seem to warn about uninitialized variables these
days.

regards,
dan carpenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
