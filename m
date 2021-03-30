Return-Path: <SRS0=LUPw=I4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 807F5C433C1
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 13:13:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0890B6190A
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 13:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0890B6190A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UpatLAn/+e2LHlGYUxcJknuJK5SSpFmj0riU8QMqQi8=; b=A6zTcFNgkLrvHNcliMUTBdlWK
	t2lid9/ACaV80lOQ5edV/oz7XSgc9EBA+xftoAbx0K3iyXWMNPM0Hywmf51rB0UJ9iD/59JfQAJd/
	XV46Nyj6dzPjnWvlOfVLLZbffizzIEuGoWFhaLUrqxnyWwko6Lip6Jjd3SblDDX3oO9U7NRvSVAy1
	0G4vaTV22kVuOYdcTyDOP3yX8V65jrhC3n90rt0kYHy+zNnra4udds6njQquczK2E3JxRkkzzPhsE
	78GJ9zw27ZbOYtrcquh+JNYkapOQvt2qa/YFsAbdYP0zyUovNAY51hIEQMn3zNQqZ7i6BqauoHs3p
	5JQqeva0w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lREAT-003nXv-QB; Tue, 30 Mar 2021 13:12:26 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lREA7-003nN2-9Z
 for linux-mtd@lists.infradead.org; Tue, 30 Mar 2021 13:12:06 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1lRE9U-000488-00; Tue, 30 Mar 2021 15:11:24 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 405B2C1DF5; Tue, 30 Mar 2021 15:07:40 +0200 (CEST)
Date: Tue, 30 Mar 2021 15:07:40 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Wang Qing <wangqing@vivo.com>
Cc: Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Salah Triki <salah.triki@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, Ralf Baechle <ralf@linux-mips.org>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hams@vger.kernel.org,
 netdev@vger.kernel.org, linux-decnet-user@lists.sourceforge.net,
 gregkh@linuxfoundation.org
Subject: Re: [PATCH 1/6] mips/sgi-ip27: Delete obsolete TODO file
Message-ID: <20210330130740.GA11217@alpha.franken.de>
References: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
 <1617087773-7183-2-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617087773-7183-2-git-send-email-wangqing@vivo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_141203_577078_83113B68 
X-CRM114-Status: GOOD (  12.98  )
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

On Tue, Mar 30, 2021 at 03:02:44PM +0800, Wang Qing wrote:
> The TODO file here has not been updated for 15 years, and the function 
> development described in the file have been implemented or abandoned.
> 
> Its existence will mislead developers seeking to view outdated information.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  arch/mips/sgi-ip27/TODO | 19 -------------------
>  1 file changed, 19 deletions(-)
>  delete mode 100644 arch/mips/sgi-ip27/TODO

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
