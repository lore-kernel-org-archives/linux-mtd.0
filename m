Return-Path: <SRS0=Xxtu=JO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581E4C433ED
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Apr 2021 10:26:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF1C86023F
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Apr 2021 10:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF1C86023F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ahWYKDfWaCZGi3N1OWlaidBmkV0TBQIn/8g+uVCfr68=; b=a7lzJd9mWbWiCf2A9buUH5+qY
	kfYdgV5BMQ1FHjnhQxXjqQ1eplGwZU3Q9+6GrkW1axlxrdYguMUd+wyuWFNh1x+O+E5A7HkstudKi
	Hi//oaJjewezeUkI1QEBGboMGzWcHBjBmIFgueBYhH5JWLu3U5SByBi6l9DT45tXL1airvsIXe8/p
	U7uhK58zU18ay5Y1kFdMdmR77Y1jq6HOp9f+/i/klqOh+u1arBIjWUCt3fvscBZma2zRjfMQui/8p
	+B+eVjzeCbQ/8s9Pr6RYYNLG4o8KkSgR8Ph8wgUV1wKVMuXjBIFbD4Jl+Nogi0oc9ILCSw5G1Ljx0
	A8GDvbJdg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXi8T-004zXO-S8; Sat, 17 Apr 2021 10:25:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXi8M-004zWS-HL
 for linux-mtd@desiato.infradead.org; Sat, 17 Apr 2021 10:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Sv5e1id0xmN6AnV4mguXiCqPq8KQ5QvmLZmfSk/+Hdg=; b=so0jiu7xo4s2B4/ElpvxOj9sAT
 fbBOO4TGbMPs/7tJW+5vvMV/Icp9IEJgNDpko7uYSf1tsGl9Atoo+bh16CoxCsD0/vWFB36CG37WR
 3QZ11HzYiTjlkTYg6wRbGIGgG53fGIXZRxxf36vT7FZNznnH6lufKDAec2sCVRCqCuBgQYYp1fF9L
 u4vEOxzwLIVebm15eBQhn5rvc8RWe6cGy3/XsKyzhEheu+NvDBmJp2Q2k3aEfaYG2JvI13hZMd2E4
 mJl/kIi3y+JGGBqWMLgnK83wzn5hEJ3QmHhmnHfAzjTXP+/9rr4v/ZLaIKXo49YPKEoFCafj3oJOH
 8VyK6M1w==;
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXi8H-009ye0-2h
 for linux-mtd@lists.infradead.org; Sat, 17 Apr 2021 10:25:01 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13HAKb26014842;
 Sat, 17 Apr 2021 10:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Sv5e1id0xmN6AnV4mguXiCqPq8KQ5QvmLZmfSk/+Hdg=;
 b=niSKvMOZ6NqJIOvccj1TipOsmfdar3kCfn3OUlHCtcyx/43aKpUHcgJdREdqperLWSEf
 jgRN7syutnZEWY1zzwOKa+ixRU+HPADE6VU2y60XdyUbsA5hYm+WKmWgUsqiDNqooeqC
 c2xGdffMFumm/2s554VNxuDJmpDSEAuP063c8nX442Qqtvk/ZB8N7Wz4mkL7US5xX7cl
 c0jkhjLglevTVq5ccfzeNLn/W6C6/hBHGBpqgxs2l/t4elf58oLPl8kDvUFHdnih1Q9t
 QCVQKMz4knxNUoJEm1gvXBfI815dgQN+SJLrwyQjaZ70XiAGuKW/bIiSuyDI/bAUAruW FA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 37yrap8bg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 17 Apr 2021 10:24:42 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13HAJfpq139444;
 Sat, 17 Apr 2021 10:24:41 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 37yq0k3p36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 17 Apr 2021 10:24:41 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13HAOYaI016727;
 Sat, 17 Apr 2021 10:24:34 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sat, 17 Apr 2021 03:24:34 -0700
Date: Sat, 17 Apr 2021 13:24:26 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: fix an error code in nand_setup_interface()
Message-ID: <20210417102426.GP6048@kadam>
References: <YHaEEYg2DUFwnxSo@mwanda>
 <20210416170040.4e467039@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416170040.4e467039@xps13>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9956
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104170071
X-Proofpoint-ORIG-GUID: rbBbbTqEYbSJNA5J3RbjxamUH4pw2Nq6
X-Proofpoint-GUID: rbBbbTqEYbSJNA5J3RbjxamUH4pw2Nq6
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9956
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104170071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210417_032457_297813_66548570 
X-CRM114-Status: GOOD (  26.64  )
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

On Fri, Apr 16, 2021 at 05:00:40PM +0200, Miquel Raynal wrote:
> Hi Dan,
> 
> Dan Carpenter <dan.carpenter@oracle.com> wrote on Wed, 14 Apr 2021
> 08:56:33 +0300:
> 
> > We should return an error code if the timing mode is not acknowledged
> > by the NAND chip.
> 
> This truly is questionable (and I am not yet decided whether the answer
> should be yes or no).
> 
> Returning an error here would produce the entire boot sequence to fail,
> even though the NAND chip would work in mode 0.
> 
> Not returning an error would print the below warning (so the
> user/developer is warned) and continue the boot with the slowest
> timing interface.
> 
> Honestly I would be more in favor of letting things as they are
> because I don't think this may be considered as a buggy situation, but I
> am open to discussion.
> 

If we decided that the original code is correct then one way to silence
the warning would be to do:

	if (tmode_param[0] != chip->best_interface_config->timings.mode) {
		pr_warn("timing mode %d not acknowledged by the NAND chip\n",
 			chip->best_interface_config->timings.mode);
		ret = 0;
		goto err_reset_chip;
	}

Setting "ret = 0;" right before the goto makes the code look more
intentional to human readers as well.

regards,
dan carpenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
