Return-Path: <SRS0=9pOF=GL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,BIGNUM_EMAILS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1745C433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Jan 2021 15:01:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B2DF23998
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Jan 2021 15:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B2DF23998
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HWQMzCSVr9FoOPYPwjJr8I60lyEPNrbFkEAjqfUO6Qw=; b=dbhr8yZGwbuRkMlVR6X/Du7gp
	Pl2ieTFyZdfMbNPwdWiBXmFz6B7hrbddmm2xE27sksygW8p/hzned1hIn3r/QITqIB6KDJXfj4u/e
	L5ohqLNVQ8f0eJS/0q+QoK2Js5Di2ij7SYzt9YIAXo3w9jlrXV6U1nhp1oxEWxDmDmyMxKc0nenop
	C20sUpynpMgdQXLwDv+EMWicfmwYuqA+3wkOhYz2ay5GDux+Agbfbu8yLattZsJPlKmcJO0G+N15L
	oAqzKYQ21FUyEANct5ML+mpGERF9rxXqP3eHp9vAFzTUpnXH4fef7anabz2H6fPvSZLxrNsv6cOLP
	lh1gkDlJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxtFP-0005Sj-VQ; Fri, 08 Jan 2021 15:00:16 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxtFN-0005S2-8Z
 for linux-mtd@lists.infradead.org; Fri, 08 Jan 2021 15:00:14 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 108Et2j8122872;
 Fri, 8 Jan 2021 15:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=UW3ALFpXs9mwY/ZTNSxhk01nPeIrcsyW43Xh7CF/OjM=;
 b=Zko/sBDkTcDWA85CO0APE0G3XrWtYnLeJ48X6A2enUuHHHtfWXndiy+ue5O9I3082l0T
 6373QxTBuFi9QMkEchgsOaWyaDGfHVph1wOiDSmrMSuUPl9iEYLOIFfKVaj5L3GuwsCN
 MdYsVIRGL4kb8kouE8Kb7nrDt6hU0rN8ywQK1C1BBfFmZAq1A7b8bgs3Dbe5l5IHwQ5M
 6aB4s4A1wpp9IRcmX0sZE4zbN8Gff37BMD+xKAeixKCVHnAd8jMn+Bh5Nqqif4kNwjPz
 F72p9pIlONmMQhTdqpwTTWMYVqypjuwgYPcxcg4tSECfPK+tcdj7V71d4EHSJkaDwxDC cw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 35wepmhe4j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 08 Jan 2021 15:00:05 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 108EuY88154749;
 Fri, 8 Jan 2021 14:58:04 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 35v4rfcxhg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Jan 2021 14:58:04 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 108Ew4a8023636;
 Fri, 8 Jan 2021 14:58:04 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 08 Jan 2021 06:58:03 -0800
Date: Fri, 8 Jan 2021 17:57:58 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [bug report] mtd: parsers: Add Qcom SMEM parser
Message-ID: <20210108145758.GD5105@kadam>
References: <X/hVmWrQqLd09/KJ@mwanda>
 <20210108132828.GA28625@work>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210108132828.GA28625@work>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101080086
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101080086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_100013_432372_4926FCBA 
X-CRM114-Status: GOOD (  17.66  )
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

On Fri, Jan 08, 2021 at 06:58:28PM +0530, Manivannan Sadhasivam wrote:
> Hi Dan,
> 
> On Fri, Jan 08, 2021 at 03:52:41PM +0300, Dan Carpenter wrote:
> > Hello Manivannan Sadhasivam,
> > 
> > The patch 803eb124e1a6: "mtd: parsers: Add Qcom SMEM parser" from Jan
> > 4, 2021, leads to the following static checker warning:
> > 
> > 	drivers/mtd/parsers/qcomsmempart.c:109 parse_qcomsmem_part()
> > 	warn: passing zero to 'PTR_ERR'
> > 
> > drivers/mtd/parsers/qcomsmempart.c
> >     68          pr_debug("Parsing partition table info from SMEM\n");
> >     69          ptable = qcom_smem_get(SMEM_APPS, SMEM_AARM_PARTITION_TABLE, &len);
> >     70          if (IS_ERR(ptable)) {
> > 
> > Can "ptable" be NULL here?
> > 
> 
> No it won't. It will return valid error ptr in failure cases.

The Smatch warning is actually about the IS_ERR_OR_NULL() later.  If it
returns NULL then that's counted as success.  It's sometimes intentional
but here is seems like qcom_smem_get() never returns NULL so it could
be changed to just IS_ERR().

regards,
dan carpenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
