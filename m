Return-Path: <SRS0=+z0R=Y7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=BIGNUM_EMAILS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF01C5DF61
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 08:01:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF7612187F
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 08:01:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YsMpkgH5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NMYADlkc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF7612187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FL8Fwue9e0sZTV2y76+rVS4Ca/27cxCdQVcXBBDYWgs=; b=YsMpkgH5vUjHSF
	XoEmSgSW4p4QyESrD4zl5kpiSFXOrmBk1lD/+lq0tLeWKH/YffTrVzoU7FzZLopKxj66UsV/rCztD
	gzsXZlU++xeoJ0xcqPlcVIrZPDrJ9TLfY84tqdnRbjC1rVSt+4IROL+mZTlBBg1n2DigwLRG+rZvV
	AENfE/Sw1BfAw0J1NR/OVtjSqbLTsAW+Lrndv+VScOoy7U4LBDop5HcWEUDcVMyCjZqrP3vpBI8ul
	JDxumsS3Oqx2DGOgLMqQw/THa5gzyDUXcrrecoQdr+//6od2OmgupthCIJCyJGCTtJqJvvEtM4acA
	P8c3xZIlmvvkBvlF448g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iScix-0000U4-Fn; Thu, 07 Nov 2019 08:00:59 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSciu-0000SN-On
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2019 08:00:58 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA780pNA082837;
 Thu, 7 Nov 2019 08:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=IgOd1+NVhW3kry+wUk17qqMNyvFGVFGvBVK83FppSFU=;
 b=NMYADlkc5WAosLB4I1FVVy85IwuToE80jwJSXWc7TASLf4E4H5tV7o1q06iEfIwXyTF4
 ZNp4dNFRfNZT5lWpBIhkTYmnE+YR5l+JI1AcuP9WyGFZy7j4i3VFvHzgEa8oYxlCRdgg
 x+dQ9boN/Mdweln9r+i/Mi5LYewdi9XUAFpB8DLNjYf1L8Bzjq7NjM0wIfPta72oBZo0
 EUgEnrjP1w9R0p+5Hhlpdqvqo4yhFP+ANdeGdh7LcIq51yoQ1OQwrez9GVq5Gx50tPbY
 YiV3VkUenda1iW0SdSe/zyApbCfwofl0SsdqDjdRZmGd4ib16U43aQA477kMY1lyrmE6 hA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2w41w1475t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Nov 2019 08:00:51 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA77voaK176355;
 Thu, 7 Nov 2019 08:00:48 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2w41wghpk8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Nov 2019 08:00:48 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xA780lnA026052;
 Thu, 7 Nov 2019 08:00:47 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 07 Nov 2019 00:00:46 -0800
Date: Thu, 7 Nov 2019 11:00:41 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: havasi@inf.u-szeged.hu
Subject: [bug report] [JFFS2] Add erase block summary support (mount time
 improvement)
Message-ID: <20191107080041.GA14320@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9433
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=823
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911070080
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9433
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=902 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911070080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_000056_934970_8DC09F5A 
X-CRM114-Status: GOOD (  11.93  )
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

Hi JFFS2 devs,

The patch e631ddba5887: "[JFFS2] Add erase block summary support
(mount time improvement)" from Sep 7, 2005, leads to the following
static checker warning:

fs/jffs2/wbuf.c:934 jffs2_flash_writev()
warn: inconsistent returns 'c->wbuf_sem'.
  Locked on  : 908
  Unlocked on: 916,934

fs/jffs2/wbuf.c
   859          for (invec = 0; invec < count; invec++) {
   860                  int vlen = invecs[invec].iov_len;
   861                  uint8_t *v = invecs[invec].iov_base;
   862  
   863                  wbuf_retlen = jffs2_fill_wbuf(c, v, vlen);
   864  
   865                  if (c->wbuf_len == c->wbuf_pagesize) {
   866                          ret = __jffs2_flush_wbuf(c, NOPAD);
   867                          if (ret)
   868                                  goto outerr;
   869                  }
   870                  vlen -= wbuf_retlen;
   871                  outvec_to += wbuf_retlen;
   872                  donelen += wbuf_retlen;
   873                  v += wbuf_retlen;
   874  
   875                  if (vlen >= c->wbuf_pagesize) {
   876                          ret = mtd_write(c->mtd, outvec_to, PAGE_DIV(vlen),
   877                                          &wbuf_retlen, v);
   878                          if (ret < 0 || wbuf_retlen != PAGE_DIV(vlen))
   879                                  goto outfile;
   880  
   881                          vlen -= wbuf_retlen;
   882                          outvec_to += wbuf_retlen;
   883                          c->wbuf_ofs = outvec_to;
   884                          donelen += wbuf_retlen;
   885                          v += wbuf_retlen;
   886                  }
   887  
   888                  wbuf_retlen = jffs2_fill_wbuf(c, v, vlen);
   889                  if (c->wbuf_len == c->wbuf_pagesize) {
   890                          ret = __jffs2_flush_wbuf(c, NOPAD);
   891                          if (ret)
   892                                  goto outerr;
   893                  }
   894  
   895                  outvec_to += wbuf_retlen;
   896                  donelen += wbuf_retlen;
   897          }
   898  
   899          /*
   900           * If there's a remainder in the wbuf and it's a non-GC write,
   901           * remember that the wbuf affects this ino
   902           */
   903          *retlen = donelen;
   904  
   905          if (jffs2_sum_active()) {
   906                  int res = jffs2_sum_add_kvec(c, invecs, count, (uint32_t) to);
   907                  if (res)
   908                          return res;
                                ^^^^^^^^^^^
This should probably be "ret" instead of "res" and then goto outfile or
got outerr?

   909          }
   910  
   911          if (c->wbuf_len && ino)
   912                  jffs2_wbuf_dirties_inode(c, ino);
   913  
   914          ret = 0;
   915          up_write(&c->wbuf_sem);
   916          return ret;
   917  
   918  outfile:
   919          /*
   920           * At this point we have no problem, c->wbuf is empty. However
   921           * refile nextblock to avoid writing again to same address.
   922           */
   923  
   924          spin_lock(&c->erase_completion_lock);
   925  
   926          jeb = &c->blocks[outvec_to / c->sector_size];
   927          jffs2_block_refile(c, jeb, REFILE_ANYWAY);
   928  
   929          spin_unlock(&c->erase_completion_lock);
   930  
   931  outerr:
   932          *retlen = 0;
   933          up_write(&c->wbuf_sem);
   934          return ret;
   935  }

regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
