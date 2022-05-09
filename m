Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC612C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 07:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzynI4a5P6ZxhgGdJajzuPWg4GKbPneMVSSJy5tvERI=; b=ygsIFPbct9qJbl/VoCyfsZahXx
	F8o6/K86EVAiLgI+hxCJ9JGbxqWdNCNwOP9bwOT7T/iouWRuFbUUt0KcZBPBRdw02yX4ho+VPVBcF
	wYAiDljYNm4fNEza0YbSwM8qcP2JgBAoCXBxEo2wyXz8Tl3JM2Eei45ZDNse7jMim0MdZf74IRiSh
	C8UxrGgWj72GkzQFEfzLUOuzuK637OCFw+6ISTk5CHpioq8ju9o71uFqwbnfx3YHx0P5icyfiQj0U
	X91v9jU/RM93GNw1y0/zH+5qsTI8hf8CXUB9Flr/S6Tc2MYcKOjXNGgZu/1lthPuFDD7X/0AClLxq
	BPDP1aPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnxiB-00Covv-D0; Mon, 09 May 2022 07:21:43 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnxhz-00Cool-7H
 for linux-mtd@lists.infradead.org; Mon, 09 May 2022 07:21:32 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 4A84022239;
 Mon,  9 May 2022 09:21:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652080880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VZLEWB/zEY/FQpUQimQl7fXohmYMKV1f5etzN6r+r4k=;
 b=Wblq360gVXVP3pj+aJ2YZOuUGjbyxYVq91SJLzLBBDNeJe0MpIsby0zRvfni9HcB+NqkjS
 Hw98FfVlo1+/gd0KETGZ8rvMoc8biEElAmektThKVjU7aedB9VmP6X06zUwB0KDfJYUolm
 sWwqq3IL7HNME1q3I1i5NLVGUNsdnDI=
MIME-Version: 1.0
Date: Mon, 09 May 2022 09:21:12 +0200
From: Michael Walle <michael@walle.cc>
To: "Leon M. George" <leon@georgemail.eu>
Cc: linux-mtd@lists.infradead.org, p.yadav@ti.com
Subject: Re: [PATCH] mtd: spi-nor: support eon en25qh256a variant
In-Reply-To: <20220502233310.791565-2-leon@georgemail.eu>
References: <20220502115227.2435850-1-michael@walle.cc>
 <20220502233310.791565-2-leon@georgemail.eu>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <7bd074d3dce61f2925d823c377ddd06d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_002131_462572_74E16AE4 
X-CRM114-Status: GOOD (  15.96  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

For the next time if you submit a new patch version: the subject should
contain v2, eg. [PATCH v2]. See 
Documentation/process/submitting-patches.rst.
Also a changelog would be good.

Am 2022-05-03 01:33, schrieb Leon M. George:
> This patch allows accessing the upper 16m on the A variant (EN25QH256A) 
> of
> the EN25QH256 that shares same JEDEC ID.
> 
> Without this patch, addr_with is detected to be '4' but the read_opcode 
> is
> a plain READ (supporting only 3 byte addresses).
> Setting PARSE_SFDP is enough to detect the read_opcode READ_4B on the A
> variant. READ_4B is not available on the no-A variant.
> 
> Both variants support 4-byte address mode (spi_nor_set_4byte_addr_mode)
> but that is prone to breaking on unexpected reboots if the reset pin 
> isn't
> connected (broken-flash-reset).
> 
> The no-A variant supports a 'high bank latch mode' that affects read,
> program, and erase commands - similar to the extended address register
> (EAR).
> The HBL bit is manipulated using the ENHBL (0x67) and EXHBL (0x98)
> opcodes.
> 
> Should it become necessary to distinguish the two variants in the 
> future,
> the A variant sets the SNOR_HWCAPS_READ_1_1_4 SFDP param - the no-A
> variant doesn't.
> 
> Tested with and without fast read on the A variant only.
> 
> Signed-off-by: Leon M. George <leon@georgemail.eu>

Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
