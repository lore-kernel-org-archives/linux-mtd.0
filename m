Return-Path: <SRS0=MD77=YS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201F4CA9EA0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2019 12:37:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBB7321D71
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2019 12:37:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M8G9Ns/0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cSPUvxaD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBB7321D71
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xi3vTErlQWSjWEO40nui3FPXu/VLj+moSo9R0Cygr8k=; b=M8G9Ns/0gcqMcQ
	iPGmUn2Bh1HYp3mayi/BkgJttYTgxWPIsN2FrYl6vlE7NpTMMciL8x2yGHijSv9DcqQlgqcqNjBAa
	Y2eC7O4a8qHGBC4Vc619VAki26IY66g4HelbBWUmoQQMdDCnmxC9qiFfMtz7+J9SAprcbrCCIsXRP
	ggAc7gg38D9CZjVuAAxlc6LUc8mp3/aIkmaZceGZDwgNnkK6Hvwl09cDjT+V1zBWyB/LPwFUv011E
	EP3La6z7Q5lAzpoW20AJOfiXV3vNQfP3R3LvX4KSCOUrQcac4lC/SO40rs9LzlESNLCMsnvbBcn93
	x8VT+w3/yalRShyyAV+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNyqm-0004J6-LD; Fri, 25 Oct 2019 12:37:52 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNyqj-0004Ih-LI
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2019 12:37:50 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9PCXqKG107015;
 Fri, 25 Oct 2019 12:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=16ZLqO4VSjnmgEVQJxkgFUQoBokPWRolKulo+rt1Ksg=;
 b=cSPUvxaDNpc1q6N4S9wk0Xz1019HZsTesXGZAjevivUegqg3fVwrOKsiy0MvT+flFFaV
 KTCsMjFcCsc8Rj40gpPlw88iZj4+WRgD0IgiXEYOflKjJMC+lW9DwwpDgao4pzFuoD69
 oyMflfRg/6qPaFc2cs/bgpMjwtgyGspew5F827DChZ5m/Wx3U3PBGBTgyee4SHP+fMhm
 b5yI46LpU/1utvJGqq/o7k35HMYotId8KbDEdC+iLB+O4d0jbRBKNhjVcZ5VZoGOS0yz
 Fj8fEOi/wyLymUJSOyKX4D4OfR5z6RaMwWq9Vw27ZcrQ1bx5vNcysgWso3Vs3SAJJkrV rQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2vqteqas8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Oct 2019 12:37:44 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9PCY1AX135159;
 Fri, 25 Oct 2019 12:37:44 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2vuun14esx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Oct 2019 12:37:44 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9PCbgjt007700;
 Fri, 25 Oct 2019 12:37:42 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 25 Oct 2019 05:37:42 -0700
Date: Fri, 25 Oct 2019 15:37:30 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH] mtd: spi-nor: Move condition to avoid a NULL check
Message-ID: <20191025123730.GF23523@kadam>
References: <f86ee955-d08a-cd24-e214-95cb3746e756@microchip.com>
 <20191025123217.12790-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191025123217.12790-1-tudor.ambarus@microchip.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9420
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=927
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910250120
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9420
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910250120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191025_053749_788840_A971B89B 
X-CRM114-Status: GOOD (  13.89  )
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

On Fri, Oct 25, 2019 at 12:32:25PM +0000, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> When the controller is not under the SPI-MEM interface it may implement
> the optional controller_ops->erase() method.
> 
> nor->spimem and nor->controller_ops are disjunctive. Move the
> nor->controller_ops->erase != NULL check as an 'else if' case to
> nor->spimem, in order to avoid the nor->controller_ops != NULL
> check.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> Intended for better readability.

Thanks!

regards,
dan carpenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
