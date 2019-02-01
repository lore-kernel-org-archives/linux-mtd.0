Return-Path: <SRS0=9lEF=QI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4DDC282DA
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 10:28:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A350218AF
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 10:28:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MUqVyxlC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="g2FqmAix"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A350218AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yY8xgpoHJiEb6JR4qQR2h3KhxSWEZ/hT3kQrpopx/qg=; b=MUqVyxlC6UKalt
	SIHc1/wpWdgreG0CsE95z7TgPzx7UsA3Ql2Ol4XmhnuJWkFfDL2VOPaLvWiPEpHYjh+aXCIBCFB6K
	SN35nGi/99BetRd+mMDRJP3u/mMusSg2mM0FSb4XadyVDOWpsWqrafFOKSb74ljErp4HB1CLY3NH/
	fyCqDwFRja1HPI7QAIOY48NMhsUNUH84apzM/QZb1ikRP6JcIHHDI+wsXp1DhwhnkmTdlGzK9/t3r
	GgqbISsE4vm5KxXdENa0knasYdT66jZx0iY881VLegtPR/s7eGfOaH0UTk0IF/yeOZyiUPiaI86zU
	qDc4qQoq9SZqzuazecSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpW3w-0003Q7-Fy; Fri, 01 Feb 2019 10:28:44 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpW3s-0003PW-If
 for linux-mtd@lists.infradead.org; Fri, 01 Feb 2019 10:28:42 +0000
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id x11ASMC3002413
 for <linux-mtd@lists.infradead.org>; Fri, 1 Feb 2019 19:28:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x11ASMC3002413
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1549016903;
 bh=h78X69hmysRcuQAjIEmxJquoHYqPGCcvwTwZ91iDNo0=;
 h=From:Date:Subject:To:Cc:From;
 b=g2FqmAixsn3kjOMwoMN71yvRul7W2mhNN3wWLpuyPLPPyh464MR1BKTYiw94NcKsu
 JjkCZ+oObnJ/WJSMf915FUGpk6jK3p6n4rPtnceJOqVMMqEIqP4huMiOxXjHrwCknz
 0hZQvW6yzOfqtoTvmgft27YtuE/JL2JWem/PH/CUR78gekUNjQWc9pAQneVfuWr2IG
 tH+0HcUDpQeHoYBULFbx3sbnON8f/HiellQn5NbNvlICfl8ozgKU4POHZ3xhBVKYiY
 udsoVXo6xyWVspru8OB1UJmjUlDUPwUW3t634klNvLFoP/JxFETyr5S4RfoLBsP9N/
 1qX7kMdtrN1XA==
X-Nifty-SrcIP: [209.85.222.47]
Received: by mail-ua1-f47.google.com with SMTP id t8so2059264uap.0
 for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2019 02:28:23 -0800 (PST)
X-Gm-Message-State: AJcUukdU4+ENHT6G/1AjHKus4hScv8w4TQ+/uwp1wUiae1zaP7wILRrz
 /yqOyG/diond8aJONar/mCyvVQY4K8pPkTkvGbw=
X-Google-Smtp-Source: ALg8bN4RSEGmATIoufCNlaRLLNyF1h7U9UC7P3T6i/AYlepXF8uUFSrraWj21NQ7KOvLnjbBdvOLsPr0GdTJ6b40fh0=
X-Received: by 2002:ab0:849:: with SMTP id b9mr16028106uaf.93.1549016901885;
 Fri, 01 Feb 2019 02:28:21 -0800 (PST)
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 1 Feb 2019 19:27:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQLzvW-zDaR8qkDaxEXxmiCj7XQDK-G57sPhvZu1_eBdA@mail.gmail.com>
Message-ID: <CAK7LNAQLzvW-zDaR8qkDaxEXxmiCj7XQDK-G57sPhvZu1_eBdA@mail.gmail.com>
Subject: [Question] setup_data_interface() hook when switching to a different
 type of NAND chip
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_022840_839978_EF14E62F 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi.


When I was looking into the NAND controller/chips separation,
this question popped up in my mind.


Commit 2d472aba15ff169 provides us a more flexibility
about the controller/chips connection.
The connected NAND chips do not need to be homogeneous
any more.


My question is about the ->setup_data_interface() hook
when switching between NAND chips with different speed (timing mode).


Think about the case below:

{
        compatible = "foo-nand-controller";
        reg = <...>;
        #address-cells = <1>;
        #size-cells = <0>;

        nand@0 {
                  reg = <0>;
                  /* Slow NAND chip */
        }

        nand@1 {
                  reg = <1>;
                  /* Fast NAND chip */
        }

}



In this case, two devices /dev/mtdblock0 and /dev/mtdblock1
will appear.

If a user gets access to those two devices in turns,
I think ->setup_data_interface() should be invoked somehow
in order to update the timing registers on the controller side.

Currently, ->setup_data_interface() is invoked in nand_scan_tail()
and that's it.

So, both nand@0 and nand@1 are accessed by the timing mode of nand@1
(assuming nand@0 and nand@1 are initialized in this order)


Of course, it depends on the controller.

If a controller has a register set for every chip select,
the hardware will be able to change the access speed automatically.


I think most of controllers just have a single set of timing registers.
So, when switching between different types of chips,
the driver must update the timing registers.


If this is a worthwhile usecase,
should it be taken care of by the NAND framework,
or by drivers ?


I just thought we could do something in
nand_get_device() / nand_release_device().


If this should be done per driver,
drivers can update registers in select_target or select_chip.


Thought?


-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
