Return-Path: <SRS0=cBb+=FT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,BIGNUM_EMAILS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A53C2BB48
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Dec 2020 12:43:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4750224D4
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Dec 2020 12:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4750224D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8HImfV2tYKLYjDXmUb3VkbROA11taQDK86zLUh4T6lA=; b=jkLDF3qKNS+0PsNwsVHHHsYV0M
	8mHBFHJgHHln4/67AELfk+xBqyptyTsQsEqJls8GJPTWtvva37pywyYgVZpws9G0Ipcxm2GDPxtBl
	TgWUshIbsoyNS2jwrikm2q6quzQIiVggzeT3Oy10XUUciH1kVBi+kR/1UTz2exqCLzMLtLOH70Hqy
	/QM6VDdu/jHSY6hTHl7zvQxIvt03seLtMljgsn8Yd+jcAdOoPuEKi0+eFZD13ErqUA/6GuD1JMYgw
	xAHUL4AhV68sSE1jLFckXa2BNl41I6fsp9dB2wNXSJJKAfCQMlH2g64IqwtXj9pSchISAT6VO8z5Z
	f9yUr21A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kp9fE-00065P-4m; Tue, 15 Dec 2020 12:42:48 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kp9fB-00064p-Rt
 for linux-mtd@lists.infradead.org; Tue, 15 Dec 2020 12:42:46 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BFCYFQa004333;
 Tue, 15 Dec 2020 12:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=u+SfNaOsD6SKg7kZNjVKQoBUmn78iriSfAYz8UpN+9U=;
 b=RLKvMGBXy5Y3g8gMGN9jK1UOM+vKzEry0cVUAz+TedVRYKPGvrvGuJWZZpS8pL/pKssT
 XLComAVz+xo+c4kp6/FusdqhNlqgACw5iZvl1cLK0tzfiEYT3f0ZzTPcU6XYSQk3qvEz
 FYWcOrPG3PESoKufjczEzVkWxER5vCkC5jo+vt6h5EkJ2jUZjJgL67+J/upSCqZlJa8C
 1Bhrfzsa21zXGViiAMAhiOyy7Kz01Bxwd7ROp6ki6owJcD0szrlNnjidoabP/nUcV+FW
 +xeCJKkei/VZnx+khQylY3rVP5q4yobHr/IcJtywY4TQ8/wEeOi3HBSh9ZENZ2vvjs0r 6g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 35cn9raam2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Dec 2020 12:42:41 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BFCg7eb065449;
 Tue, 15 Dec 2020 12:42:41 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 35d7sw4y85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Dec 2020 12:42:40 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BFCgdVV005333;
 Tue, 15 Dec 2020 12:42:40 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 15 Dec 2020 04:42:39 -0800
Date: Tue, 15 Dec 2020 15:42:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: [bug report] mtd: rawnand: Add NAND controller support on Intel LGM
 SoC
Message-ID: <X9ivOeOWa9rtbXpl@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9835
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=859 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012150090
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9835
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=876
 impostorscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012150089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_074246_075491_1F950750 
X-CRM114-Status: GOOD (  13.65  )
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

Hello Ramuthevar Vadivel Murugan,

The patch 0b1039f016e8: "mtd: rawnand: Add NAND controller support on
Intel LGM SoC" from Nov 10, 2020, leads to the following static
checker warning:

	drivers/mtd/nand/raw/intel-nand-controller.c:683 ebu_nand_probe()
	warn: 'ebu_host->clk' not released on lines: 633,638,644,652.

drivers/mtd/nand/raw/intel-nand-controller.c
   617                  return PTR_ERR(ebu_host->cs[cs].chipaddr);
   618  
   619          ebu_host->clk = devm_clk_get(dev, NULL);
   620          if (IS_ERR(ebu_host->clk))
   621                  return dev_err_probe(dev, PTR_ERR(ebu_host->clk),
   622                                       "failed to get clock\n");
   623  
   624          ret = clk_prepare_enable(ebu_host->clk);
   625          if (ret) {
   626                  dev_err(dev, "failed to enable clock: %d\n", ret);
   627                  return ret;
   628          }
   629          ebu_host->clk_rate = clk_get_rate(ebu_host->clk);
   630  
   631          ebu_host->dma_tx = dma_request_chan(dev, "tx");
   632          if (IS_ERR(ebu_host->dma_tx))
   633                  return dev_err_probe(dev, PTR_ERR(ebu_host->dma_tx),
   634                                       "failed to request DMA tx chan!.\n");

clk_disable_unprepare(ebu_host->clk); before returning?

   635  
   636          ebu_host->dma_rx = dma_request_chan(dev, "rx");
   637          if (IS_ERR(ebu_host->dma_rx))
   638                  return dev_err_probe(dev, PTR_ERR(ebu_host->dma_rx),
   639                                       "failed to request DMA rx chan!.\n");

Here

   640  
   641          resname = devm_kasprintf(dev, GFP_KERNEL, "addr_sel%d", cs);
   642          res = platform_get_resource_byname(pdev, IORESOURCE_MEM, resname);
   643          if (!res)
   644                  return -EINVAL;

here

   645          ebu_host->cs[cs].addr_sel = res->start;
   646          writel(ebu_host->cs[cs].addr_sel | EBU_ADDR_MASK(5) | EBU_ADDR_SEL_REGEN,
   647                 ebu_host->ebu + EBU_ADDR_SEL(cs));
   648  
   649          nand_set_flash_node(&ebu_host->chip, dev->of_node);
   650          if (!mtd->name) {
   651                  dev_err(ebu_host->dev, "NAND label property is mandatory\n");
   652                  return -EINVAL;

here

   653          }
   654  
   655          mtd = nand_to_mtd(&ebu_host->chip);
   656          mtd->dev.parent = dev;
   657          ebu_host->dev = dev;
   658  
   659          platform_set_drvdata(pdev, ebu_host);
   660          nand_set_controller_data(&ebu_host->chip, ebu_host);
   661  
   662          nand = &ebu_host->chip;
   663          nand->controller = &ebu_host->controller;
   664          nand->controller->ops = &ebu_nand_controller_ops;
   665  
   666          /* Scan to find existence of the device */
   667          ret = nand_scan(&ebu_host->chip, 1);
   668          if (ret)
   669                  goto err_cleanup_dma;
   670  
   671          ret = mtd_device_register(mtd, NULL, 0);
   672          if (ret)
   673                  goto err_clean_nand;
   674  
   675          return 0;
   676  
   677  err_clean_nand:
   678          nand_cleanup(&ebu_host->chip);
   679  err_cleanup_dma:
   680          ebu_dma_cleanup(ebu_host);
   681          clk_disable_unprepare(ebu_host->clk);
   682  
   683          return ret;
   684  }

regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
