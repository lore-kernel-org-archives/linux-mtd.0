Return-Path: <SRS0=0ANE=S3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F301C10F03
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 11:24:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2E67205F4
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 11:24:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZUiEFeTm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intenta.de header.i=@intenta.de header.b="VBn1SO2y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2E67205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intenta.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JrpOV25dtIq7Y102836sfm5x46cuEFAVufC2wua6Qg=; b=ZUiEFeTmPM7Yqh
	MVJZr2/aguyv+0Te3XwfMkQH3Hxa5sECk2E6pA5iNvPOc1mevR6VHGOaIA6GglROq3dy37OYivOJ6
	72TPqe7U50kTMNuNBW5DAtn7I3uEVqWCHTpBE8vXVoXRXeAgpVKQMUEaYA+oWgapCttbGzJ/oI+t+
	JTTmv905AYzLlFVIvM1jRWh6HLNtfuYEtrESpOC02ihKjC4onyrvYncqa/Omkk6ryWmHCPLPiBrXS
	Zvc9+6b4wAwJlbULn5GnjiEH3GIrbAU0J7VjXjeMo8PZ0Kk7jgLnqAy3HxoV8JO4qpiq0MZmhAizF
	6S5N9ZuMqwv3djorqmdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJcU7-0003xQ-Dr; Thu, 25 Apr 2019 11:24:11 +0000
Received: from mail.intenta.de ([178.249.25.132])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJcTt-0003b3-SN
 for linux-mtd@lists.infradead.org; Thu, 25 Apr 2019 11:24:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=intenta.de;
 s=dkim1; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date;
 bh=labrIMZHzxpCaXBdQod/UvvCoeBNd9NwvtHV6HFSVmE=; 
 b=VBn1SO2y2FEbHYIKuYVAxx+DoY03KP7oppl+FnpouCcgEASlYE+Z6xY1lctjW9TVn9JHgM6U2LbrpBMClp9wD41DElDvnYITaardTGdW3WoB3QvBbdkpuymZ5/BUnPjLnRA5fdwFQiMbCSG8B/C+rDwPH9q/RFEj7zgYt9LRq4fKYt6AJyMAJGQ6LP8yvrHFJiLUpndf58HJRRsO+idhwofLbDNIQUPN6hsOGB/M4sD0yuyKLRnQTQGuWsUYxohwuTpKKcAzq7ukFpfjD1C5jY12RxqJJJYMzfHpMTOp6v5dBNL4sGqK7inaMH+liR+FVMrzqGVMH8dG7vVz9JCupw==;
X-CTCH-RefID: str=0001.0A0C0208.5CC198BA.0014, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Date: Thu, 25 Apr 2019 13:23:37 +0200
From: Helmut Grohne <helmut.grohne@intenta.de>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>
Subject: Re: [LINUX PATCH v14] mtd: rawnand: pl353: Add basic driver for arm
 pl353 smc nand interface
Message-ID: <20190425112337.wno2a6dccptffldz@laureti-dev>
References: <1555326613-26739-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20190423124525.axaprwy4qofbqfhj@laureti-dev>
 <DM6PR02MB47797E4A5ADFC87DE4B04A81AF3C0@DM6PR02MB4779.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM6PR02MB47797E4A5ADFC87DE4B04A81AF3C0@DM6PR02MB4779.namprd02.prod.outlook.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-ClientProxiedBy: ICSMA002.intenta.de (10.10.16.48) To ICSMA002.intenta.de
 (10.10.16.48)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_042358_758384_D1C0EE06 
X-CRM114-Status: GOOD (  12.14  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "nagasureshkumarrelli@gmail.com" <nagasureshkumarrelli@gmail.com>,
 Michal Simek <michals@xilinx.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Apr 24, 2019 at 05:04:38AM +0000, Naga Sureshkumar Relli wrote:
> > You previously used cond_resched (via nand_wait_ready) here. Why did you change it to
> > cpu_relax()?
> I just replicated the pl353_wait_for_ecc_done() API definition.
> But did you see any issue with this?
> Anyway I will replace it with cond_resched(), instead of cpu_releax()

This was an observation and it made me ask for reasons. I did not have
any practical issues here.

> Did you follow the same thing that you tried earlier?
> i.e. updated "nand-bus-width" property and "nand-ecc-mode" ?

Yes, I used the same device tree that made v13 partially work here.

> > After trying the driver, the flash chip was bricked. Neither the old driver nor the uboot-xlnx
> > driver nor the Xilinx fsbl are able to talk to the chip afterwards. This behaviour persists even
> > after a full power cycle. I'll try reinitializing the flash chip next. I've only seen this behaviour
> > once, so there is a slight chance that the cause is something else.
> Sometimes I also faced the same problem during driver development.
> What I did is, in standalone nandps driver example,  I forcibly created BBT in the init and once
>  it is done. I just reloaded the actual example. Then after wards u-boot and Linux are able to scan
> the BBT.

I confirm. It was just the BBT being bad. It can also be recreated using
u-boot with "nand scrib.chip".

I also spent some time reviewing the code and will send another mail
about that.

Helmut

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
