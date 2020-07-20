Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F8BC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 12:38:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C59372070A
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 12:38:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FW1lhklY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="yBgA/5fk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C59372070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9TpK9BJTO4pnc+DlyXepW3hUVQqPwaeLE5PVG9FFXQE=; b=FW1lhklYGWy3hpfu3Yfrq6DQMR
	AFbicH3RIrfGj5bBIX7t0NeK0QGBPzDwrnHB8hfIss4uip+KqXeawn907M1oEkYSsh/jg+atNZMR8
	rjwWo8IteDWOfeYWZWiuZpmpP+PR2CeZUWGANUuz98LMLT8EmKUjg13XpRlZPNK1Eqq/RDMqdtXtt
	mAWsw3w4uhPeNLyjhkZE46vbTfdMcDPkXUx9jeu6q6xzXI4HJ7R12a70lWDSoTolkenpLvtWT3T9G
	oGeTZDE2sw3bWh76YYtARv0Z93dpoiTaTnqBakhPHsIaVQLIGWlZsuA7kMWKLoBCJw2mrc7bfo8mT
	vq8H98Sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxV3T-0001lY-GJ; Mon, 20 Jul 2020 12:38:03 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxV3R-0001kX-5O
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2020 12:38:02 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06KCXEwk165106;
 Mon, 20 Jul 2020 12:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=9kXHHwVK1pHrizFKFmjZl4Mw/esySJJ8iCZPdLwUu7c=;
 b=yBgA/5fk6RZk+tqBOt8hPYKV24S42geytsRBQHYTTGz68n6CE5dtRL88nu2raS6tEbyG
 GFb0RhlAWYY49VEi0U/tP1sjGxy8/VSpvx+mZ8Hah94zKxqwkF+NTigwZBkb2oqTy/LC
 6swqKfRwma34QE8mZtIpey5PILzb2cIoMWH3vfSpf7MBe9b5Vrmr5rkPv3CQ6yauDUIK
 JjF+7PACggxRrEaKYh5BqRkiVOx+wUIPgZlv9BMwU3vFslUr/IKTvcz2UcQoxpLGD9io
 V+c+lUNRZzxFy3UyieMibc2vr1zjkC+63EMm8AwJSIGG7bWcpuPP1TOd3s3p8QP5adrJ ow== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 32bs1m6n0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Jul 2020 12:37:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06KCXuF6097037;
 Mon, 20 Jul 2020 12:37:54 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 32d8kyr5ed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jul 2020 12:37:54 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06KCbq9w011850;
 Mon, 20 Jul 2020 12:37:53 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 20 Jul 2020 12:37:52 +0000
Date: Mon, 20 Jul 2020 15:37:47 +0300
From: <dan.carpenter@oracle.com>
To: christophe.kerello@st.com
Subject: [bug report] mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash
 controller driver
Message-ID: <20200720123747.GA58697@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9687
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=3
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007200086
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9687
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 bulkscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1011
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007200086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_083801_332451_67676AB6 
X-CRM114-Status: GOOD (  12.65  )
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
Cc: linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Christophe Kerello,

The patch 2cd457f328c1: "mtd: rawnand: stm32_fmc2: add STM32 FMC2
NAND flash controller driver" from Dec 14, 2018, leads to the
following static checker warning:

	drivers/mtd/nand/raw/stm32_fmc2_nand.c:350 stm32_fmc2_nfc_select_chip()
	error: buffer overflow 'nfc->data_phys_addr' 2 <= 2

drivers/mtd/nand/raw/stm32_fmc2_nand.c
   334  static int stm32_fmc2_nfc_select_chip(struct nand_chip *chip, int chipnr)
   335  {
   336          struct stm32_fmc2_nfc *nfc = to_stm32_nfc(chip->controller);
   337          struct stm32_fmc2_nand *nand = to_fmc2_nand(chip);
   338          struct dma_slave_config dma_cfg;
   339          int ret;
   340  
   341          if (nand->cs_used[chipnr] == nfc->cs_sel)
   342                  return 0;
   343  
   344          nfc->cs_sel = nand->cs_used[chipnr];
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

   345          stm32_fmc2_nfc_setup(chip);
   346          stm32_fmc2_nfc_timings_init(chip);
   347  
   348          if (nfc->dma_tx_ch && nfc->dma_rx_ch) {
   349                  memset(&dma_cfg, 0, sizeof(dma_cfg));
   350                  dma_cfg.src_addr = nfc->data_phys_addr[nfc->cs_sel];

The ->data_phys_addr[] array has FMC2_MAX_CE elements.

   351                  dma_cfg.dst_addr = nfc->data_phys_addr[nfc->cs_sel];
   352                  dma_cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
   353                  dma_cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
   354                  dma_cfg.src_maxburst = 32;
   355                  dma_cfg.dst_maxburst = 32;
   356  
   357                  ret = dmaengine_slave_config(nfc->dma_tx_ch, &dma_cfg);

[ snip ]

  1741  static int stm32_fmc2_nfc_parse_child(struct stm32_fmc2_nfc *nfc,
  1742                                        struct device_node *dn)
  1743  {
  1744          struct stm32_fmc2_nand *nand = &nfc->nand;
  1745          u32 cs;
  1746          int ret, i;
  1747  
  1748          if (!of_get_property(dn, "reg", &nand->ncs))
  1749                  return -EINVAL;
  1750  
  1751          nand->ncs /= sizeof(u32);
  1752          if (!nand->ncs) {
  1753                  dev_err(nfc->dev, "invalid reg property size\n");
  1754                  return -EINVAL;
  1755          }
  1756  
  1757          for (i = 0; i < nand->ncs; i++) {
  1758                  ret = of_property_read_u32_index(dn, "reg", i, &cs);
  1759                  if (ret) {
  1760                          dev_err(nfc->dev, "could not retrieve reg property: %d\n",
  1761                                  ret);
  1762                          return ret;
  1763                  }
  1764  
  1765                  if (cs > FMC2_MAX_CE) {

Which suggests that this should be >= FMC2_MAX_CE to prevent an off by
one.

  1766                          dev_err(nfc->dev, "invalid reg value: %d\n", cs);
  1767                          return -EINVAL;
  1768                  }
  1769  
  1770                  if (nfc->cs_assigned & BIT(cs)) {
  1771                          dev_err(nfc->dev, "cs already assigned: %d\n", cs);
  1772                          return -EINVAL;
  1773                  }
  1774  
  1775                  nfc->cs_assigned |= BIT(cs);
  1776                  nand->cs_used[i] = cs;
                        ^^^^^^^^^^^^^^^^^^^^^
  1777          }

regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
