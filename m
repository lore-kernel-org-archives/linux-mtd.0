Return-Path: <SRS0=rnzE=K3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1BCC47080
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 12:15:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4330613AE
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 12:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4330613AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mv1NWg3mszTS/gpn+NVLkx46k3P1rqVPNLytjb8cHQs=; b=Fzsg08Jo7apObL
	qhUDFbx2BabZw4RDXOYwQ8un9pu6j/LqQjyNmpmrgZodQR4mR89gtH/AWBweqg04St5lneBku+20v
	uSuNOcEzVJg6o/MP2qU3v15HupTZep5I3QGIRsTDpVaZd8slVGg8ZF5VlMBt6QcZTELFp5BPwM1A1
	nfdt6zcCnTzZPDHShNvptTYMMvTZM2Fn4xjYjfL/lNg3gdnMGIPj4NJ5E3yF7peDECkspuM1Tt6nn
	YayqyJbSr0F4TRLKa8HVSI2NHHqwcS3MGir/Ud/Ldyru4pejRsy2YEWbOvAnrYPRgkzp8+EIdkGas
	A2WRsX1rG6EtjK0i626A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo3I0-00GU8u-OG; Tue, 01 Jun 2021 12:14:32 +0000
Received: from aserp2130.oracle.com ([141.146.126.79])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo3Hy-00GU7Z-Ps
 for linux-mtd@lists.infradead.org; Tue, 01 Jun 2021 12:14:32 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 151C8wY8157385;
 Tue, 1 Jun 2021 12:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=TY/l/e9NEFH9rioskKiN8eW/uAap6wHenLerhBZ8eeQ=;
 b=I2F0TiHqQwTnfOVMqOsbxFYnaKsT39+yZBMC9vNjJt0xHkOl48hBgetbPuqNqEH9/5Vd
 jIqTiGWNH3XSTzV1JlowUFmBaCZOIuW8ytwDL3xOSejejrtoz0X+kTiZ7HS+aJQ7PE4M
 SvfQnxi/1zXoLaYJghwYRr/dYBsP9kgwluE6OctZtQrqSooIAMwngf7gC8Vu3LazMfq+
 zw8Se3I83SlwWCh1M8jMN+/RCPp0Wh9bku76o4vFF6mI0X/nIf9JGZcrEU/OFOz5oQK8
 H96Dj1ZlApxGUP+au2bFi2Pps39j5FISabWdyY+aAsBUCYuZWycJmvZGJXt4gF+4AYJk fA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 38ub4cnb60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Jun 2021 12:14:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 151CAbv3049882;
 Tue, 1 Jun 2021 12:14:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 38uycr8b7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Jun 2021 12:14:19 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 151CEI8U065031;
 Tue, 1 Jun 2021 12:14:18 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 38uycr8b7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Jun 2021 12:14:18 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 151CECxS013783;
 Tue, 1 Jun 2021 12:14:13 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 01 Jun 2021 05:14:12 -0700
Date: Tue, 1 Jun 2021 15:14:02 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Colin King <colin.king@canonical.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] mtd: rawnand: ensure return variable is initialized
Message-ID: <20210601121401.GY1955@kadam>
References: <20210527145048.795954-1-colin.king@canonical.com>
 <20210527170309.4d99bc31@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210527170309.4d99bc31@xps13>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: W5IuRZZzOTQyTDaouT9Db3Ml8C9ASZZ7
X-Proofpoint-ORIG-GUID: W5IuRZZzOTQyTDaouT9Db3Ml8C9ASZZ7
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10001
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 mlxscore=0
 mlxlogscore=854 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106010083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_051430_954459_5CEA9E87 
X-CRM114-Status: GOOD (  24.00  )
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

On Thu, May 27, 2021 at 05:03:09PM +0200, Miquel Raynal wrote:
> Hi Colin,
> 
> Colin King <colin.king@canonical.com> wrote on Thu, 27 May 2021
> 15:50:48 +0100:
> 
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Currently there are corner cases where spec_times is NULL and
> > chip->parameters.onfi or when best_mode is zero where ret is
> 
>                        ^
> something is missing here, the sentence is not clear
> 
> > not assigned a value and an uninitialized return value can be
> > returned. Fix this by ensuring ret is initialized to -EINVAL.
> 
> I don't see how this situation can happen.
> 
> In both cases, no matter the value of best_mode, the for loop will
> always execute at least one time (mode 0) so ret will be populated.
> 
> Maybe the robot does not know that best_mode cannot be negative and
> should be defined unsigned, but the current patch is invalid.
>

People think list counter unsigned is a good idea, but it's a terrible
idea and has caused hundreds of bugs for me to fix/report over the
years.  *grumble*.

Anyway, I was revisiting this code because it showed up as a Smatch
warning and the bug appears to be real.

	best_mode = fls(chip->parameters.onfi->sdr_timing_modes) - 1;

The "onfi->sdr_timing_modes" comes from the hardware in nand_onfi_detect()
and nothing checks that it is non-zero so "best_mode = fls(0) - 1;" is
negative and "ret" is uninitialized.

regards,
dan carpenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
