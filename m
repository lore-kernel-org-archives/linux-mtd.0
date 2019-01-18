Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D568BC43387
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 06:23:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A44822086D
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 06:23:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gPv/o2xq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="dpODoQra"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A44822086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75T1H059t5QA/+CyfnGtT35ot/cqqb8HpHUn2otFinY=; b=gPv/o2xqhL/ET7
	td7lq/dS4MYkL6qHabLHcVdpppVQeEJETXf7q86zeWs3z5gHXHeJzGikd6rIHdh4biFHxOBykxmuZ
	oJMtrwjKfYM46PcdbWhvCFUdg9FGldYeQmdjPO1PgEWIYFRH5XIrFE1FSTGcjttoj1EEI5ujzY6im
	6+zNC5uMGNkSHHXnTiDVhNa0qKvT0WiZQYmY99Jh9tDC61RGKaEcEoLLZmKGpZ15EJ6MqP+ZaY2jo
	Z2IZbsYFrHCnixt3yxaQfO0BWxzxFGjkR3pFUiwwB3u/VDToSK6DvCxjJeIQsFUN4CjduJ1CsoPoI
	uIYB2wtEOLvb0MYOJqNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkNYn-0000zm-16; Fri, 18 Jan 2019 06:23:21 +0000
Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkNYk-0000zG-3l
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 06:23:19 +0000
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id x0I6Malv015876
 for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2019 15:22:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x0I6Malv015876
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1547792557;
 bh=QK0uZ64YK14cCtWnVuSCI9akqYw9PJxLdNs+A9HvrDM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dpODoQrakdXpeBOA9vNE3Z+kPnBGOqZ/vHrPqpNQRfnxYKdOKphLREOK53o4ap+Dj
 Em9kbyOMe4MyNc6p6Gh6uzBbiY+lvnuf6aXBUMv4yJBcNpXjSNf176mxKqhIBwlRyD
 bokbVCCAgqCJsn8nXFvynHrcukdwCcRcKSh3kr6/W6QFvZ1bnjnZd8HpnrKbll6hiF
 6ff3CjZypGhkG2xOuUrARshe9Nszkj8/WyXbqvnNs1HgWr5ej+6pTakqYbgPqgcdOc
 AjVONO8Ykph23QJTWCRNo4yeMQubdQwmlakAMtHeoS854RkNLAuKjgkXe+MN1iEVcB
 xQMo7vY1WN3lw==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id z3so7788865vsf.7
 for <linux-mtd@lists.infradead.org>; Thu, 17 Jan 2019 22:22:36 -0800 (PST)
X-Gm-Message-State: AJcUuke/YOwfIxCnL9Eh9weyGn+KcnLrKNhLkeCqu6nW+anG7wo5Lbnw
 ohQBujFY/u00+hMXsETR6x3U7T+PZySKqi0G398=
X-Google-Smtp-Source: ALg8bN5RfcLfyfu4eFITK3YR8PY6iatuYhDILA1w9J5OgghGPUHknkfgV8bhpMwRgCrw1Bw+TkkMIsCV9s5JXajHYks=
X-Received: by 2002:a67:a858:: with SMTP id r85mr6812974vse.215.1547792555738; 
 Thu, 17 Jan 2019 22:22:35 -0800 (PST)
MIME-Version: 1.0
References: <1547789438-11899-1-git-send-email-yamada.masahiro@socionext.com>
 <20190118071919.5c4015f6@bbrezillon>
In-Reply-To: <20190118071919.5c4015f6@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 18 Jan 2019 15:21:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNASaXXO6nJemH5p+zE+xEXDN-QzajK=-KyfRB_+FBOd7ig@mail.gmail.com>
Message-ID: <CAK7LNASaXXO6nJemH5p+zE+xEXDN-QzajK=-KyfRB_+FBOd7ig@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: denali: get ->setup_data_interface()
 working again
To: Boris Brezillon <bbrezillon@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_222318_371760_B5119ED9 
X-CRM114-Status: GOOD (  10.46  )
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
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-stable # v4 . 20" <stable@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jan 18, 2019 at 3:19 PM Boris Brezillon <bbrezillon@kernel.org> wrote:
>
> On Fri, 18 Jan 2019 14:30:38 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
> > Commit 7a08dbaedd36 ("mtd: rawnand: Move ->setup_data_interface() to
> > nand_controller_ops") missed to invert the if-conditonal for denali.
> > Since then, the Denali NAND driver cannnot invoke setup_data_interface.
> >
> > Fixes: 7a08dbaedd36 ("mtd: rawnand: Move ->setup_data_interface() to nand_controller_ops")
> > Cc: linux-stable <stable@vger.kernel.org> # v4.20
>
> Commit 7a08dbaedd36 was merged in 5.0, I'll drop Cc stable when
> applying.


Ah, right. Thanks.




-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
