Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CDAC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Apr 2022 05:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0xMprPl73tXJ9sANFW3zNM/SzBBpvQKhhHq00FggXk=; b=36EpJ1oBvQVbuo
	s4UQkKQM+bvd5ASvsSlBtPJslYZ+FXIzmnKOWw0sQwDRNMDwvGbhAGYRxWlEqePrDQB/A6Px9H0F2
	bdRmtASNgQTUM/19IAddA7XBcEVwFgEbRGkfid5uKX8fZ39el1nYGBDm2ON716+hE1EIJvo+oFu/R
	kPaGGhx4yuBrLwdXMPY+0MOMg16MyTgKa421oB/oPKqahqGVNUNITN0je2eGWRX4wV69qJS67er6Z
	lFLvKb3wXORv8PiWrrmH7QAEYTU0VnIbBNt9DKjechvbQRc3YkZGMdZ+zFDM1jWQhrqRcMsU5ZlGj
	tmzMsfy+K8w+xYYZe18w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbyB4-003ozR-MU; Wed, 06 Apr 2022 05:25:58 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbyB0-003oyf-7t
 for linux-mtd@lists.infradead.org; Wed, 06 Apr 2022 05:25:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649222754; x=1680758754;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=COGVcZeVG09PEnU/9FDhc6NmD42bc+QMIbu3CrpFM+8=;
 b=cJUb0ZeOfMP7IR9B/w4zi6Nrxf1JriGAxW4P6cQoteC46xNKA7nsSI1c
 7QoF4cJz0Afou4PDeqSj13GstOzZxm9Z4G1AuTpxhJ+gp0fDfKeA9Z7l0
 xxvFsd7EUUHmkBJBexRJuLXtn6rxug/vUPRfbVLBQhEFzG9yu1nxgbmKW
 BPi5oWhphhywSfo9rUZJ+rRZ+C7aFIo56IWv8jE3Z39BRNEjz1yS+yu9F
 X3HAS6XKyXHccNYxcvVXyCIwjSZvJt02kITTj1KemdJKJWmotDf42RT6F
 HBtVBcfrK9/sM9b2jnahnwgL84BXSmlQhqlpEyTk7tFvX7LwWieXZ7IGw Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="240886524"
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; d="scan'208";a="240886524"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 22:25:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; d="scan'208";a="588230308"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 05 Apr 2022 22:25:49 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nbyAu-00046C-Ur;
 Wed, 06 Apr 2022 05:25:48 +0000
Date: Wed, 6 Apr 2022 13:25:34 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>, vigneshr@ti.com,
 richard@nod.at, miquel.raynal@bootlin.com, joern@lazybastard.org
Cc: kbuild-all@lists.01.org, kernel@axis.com,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, frowand.list@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] mtd: phram: Allow probing via reserved-memory
Message-ID: <202204061349.puriUTMO-lkp@intel.com>
References: <20220405130350.1640985-4-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220405130350.1640985-4-vincent.whitchurch@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_222554_368739_035D9C80 
X-CRM114-Status: GOOD (  16.92  )
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

Hi Vincent,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on mtd/mtd/next]
[also build test ERROR on mtd/mtd/fixes robh/for-next v5.18-rc1 next-20220405]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Whitchurch/mtd-phram-improvements/20220406-070357
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
config: i386-randconfig-a005 (https://download.01.org/0day-ci/archive/20220406/202204061349.puriUTMO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/5f942c36259bf6194f9cc8ed7cbacdca28200e20
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vincent-Whitchurch/mtd-phram-improvements/20220406-070357
        git checkout 5f942c36259bf6194f9cc8ed7cbacdca28200e20
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/mtd/devices/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/mtd/devices/phram.c:347:1: error: expected ',' or ';' before 'static'
     347 | static int phram_probe(struct platform_device *pdev)
         | ^~~~~~
>> drivers/mtd/devices/phram.c:372:27: error: 'phram_probe' undeclared here (not in a function); did you mean 'phram_write'?
     372 |         .probe          = phram_probe,
         |                           ^~~~~~~~~~~
         |                           phram_write


vim +347 drivers/mtd/devices/phram.c

   346	
 > 347	static int phram_probe(struct platform_device *pdev)
   348	{
   349		struct resource *res;
   350	
   351		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   352		if (!res)
   353			return -ENOMEM;
   354	
   355		/* mtd_set_of_node() reads name from "label" */
   356		return register_device(pdev, NULL, res->start, resource_size(res),
   357				       PAGE_SIZE);
   358	}
   359	
   360	static int phram_remove(struct platform_device *pdev)
   361	{
   362		struct phram_mtd_list *phram = platform_get_drvdata(pdev);
   363	
   364		mtd_device_unregister(&phram->mtd);
   365		iounmap(phram->mtd.priv);
   366		kfree(phram);
   367	
   368		return 0;
   369	}
   370	
   371	static struct platform_driver phram_driver = {
 > 372		.probe		= phram_probe,
   373		.remove		= phram_remove,
   374		.driver		= {
   375			.name		= "phram",
   376			.of_match_table	= of_match_ptr(phram_of_match),
   377		},
   378	};
   379	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
