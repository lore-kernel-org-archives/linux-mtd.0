Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C617C2BD09
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 08:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qGbFFqFxRkigvzkVAlnGSjW3MwVVqXryKzXyHH1z0g4=; b=3USi5heVtlTxaJ
	YFTNOLdgeGE6zInCj1XPZ7HI8IgQmk6qKMwLcoVp5PhOsZAMPWWyUQU7GoST7LiBf4Rjlhphekacz
	6F7y7sAAIxtiVQ6Cm3/EUeXLSjlcSrPnO6PhzbC8034y/DdaO2wxT27CVztSh4UjhE6soEHoWGmFm
	5uX/H7wSCz2ug8h36ypRL7JkTsIgu3bCsNqg+yqgh4oxl9ZLI9hFoshVYLrC+RWofJVlmBeia+VNd
	cyoY1ceuGtImM2/k75rieIhFbB6l5kIG8q7Bufr1Rh0X8eXieXWWaULfTNJ3IoQ+ohshKnMpbo3rn
	GJjErWwAQO/vfFOYHDWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOByr-000000029oO-0IcZ;
	Mon, 01 Jul 2024 08:01:45 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOByn-000000029nA-29Bf
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 08:01:43 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4WCJQk48fkz1syBw;
	Mon,  1 Jul 2024 10:01:34 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4WCJQk3KFkz1qqlY;
	Mon,  1 Jul 2024 10:01:34 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id aOkZ3z2766x9; Mon,  1 Jul 2024 10:01:25 +0200 (CEST)
X-Auth-Info: wbSlFLtAlZYzP+qzJRT26bvEYztCj0/Z+VZBl+7Ts8eeYQOHTk/mYU/mXaYQCS6J
Received: from hawking (unknown [81.95.8.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon,  1 Jul 2024 10:01:24 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>,  Jean-Michel Hautbois
 <jeanmichel.hautbois@yoseli.org>,  linux-m68k@lists.linux-m68k.org,
  linux-mm@kvack.org,  linux-mtd@lists.infradead.org,  Geert Uytterhoeven
 <geert@linux-m68k.org>,  Christoph Hellwig <hch@infradead.org>,
  wbx@openadk.org
Subject: Re: m68k 54418 fails to execute user space
In-Reply-To: <b6eb0a0a-b7db-4e51-8504-27073d8a7246@linux-m68k.org> (Greg
	Ungerer's message of "Mon, 1 Jul 2024 08:35:16 +1000")
References: <c252ab82-dc4a-4267-84c3-4a20471524c5@yoseli.org>
	<735e19b6-3747-417f-ba5b-1a7da137a3a3@yoseli.org>
	<7fb2988d-ab89-405f-8cf1-edcdd2196376@gmail.com>
	<a7084eac-b92a-4ddb-a079-f4a600b93f8e@yoseli.org>
	<c7235957-1f00-40dd-a78a-925b0b943ec7@gmail.com>
	<57879ac8-eaf5-48f1-b4ef-6619d9108440@yoseli.org>
	<d66e2daa-8b31-727f-bd66-6976b0bc0130@gmail.com>
	<ce18844d-9a93-40c7-9ac6-b49b8f823c47@yoseli.org>
	<64c30829-499d-fb48-16ee-891f8d8c443a@gmail.com>
	<b6eb0a0a-b7db-4e51-8504-27073d8a7246@linux-m68k.org>
X-Yow: Does that mean I'm not a well-adjusted person??
Date: Mon, 01 Jul 2024 10:01:19 +0200
Message-ID: <mvmed8dlewg.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_010141_713951_5433FC48 
X-CRM114-Status: UNSURE (   8.07  )
X-CRM114-Notice: Please train this message.
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

On Jul 01 2024, Greg Ungerer wrote:

> I am not sure why JM's link has applications linked at 0x70000000.
> Is that a glibc thing?  My examples above are all based on uClibc.

No, it is defined by the linker (TEXT_START_ADDR).

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
