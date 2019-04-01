Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D79C4360F
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 17:53:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF95520896
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 17:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ojhW0rZA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DE+OlkdH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF95520896
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=P1ruh8hAib2XkK32/1eyJd5gnK6uOirJQP3XeXoDiU8=; b=ojhW0rZAuC5B5e
	AVQ6YeorBhBIZwcQwWT8p2Rypbrhgq8TAThysyeqU1MCAtP8RiB2T1+wktPxMKt8kfBw/Js0G+NaO
	huURps1SNeTr2GL1YBBi1KSjdfXIlDrTGGNuaXXG/GULF+rfNV+4YLdQeCb6ioPzEMN2lTrGSKiwV
	Qi9cA1zhA/Bpl7MHnThCdnOTKY9qyD4t8yTBkLqvnUoaNRumujq/IBB1ExAzKxiE9895U3P892XsM
	hmOv6PEHtKuEHdZFJXzf1h00No+hxSATpG6pmKY4wxiKAYavoWFRdvvSKUfnCQCLUr4jmtOcIFoGj
	xWMz7fN3p2HAB+bgyCDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hB17r-00054N-DN; Mon, 01 Apr 2019 17:53:39 +0000
Received: from us01smtprelay-2.synopsys.com ([198.182.47.9]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB17o-00053e-RK; Mon, 01 Apr 2019 17:53:38 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id A006A24E296F;
 Mon,  1 Apr 2019 10:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1554141214; bh=+6jPDjKFQ9sJW2gKGb9LUdktY1skiJXwXVZDLw2X0Jg=;
 h=From:To:CC:Subject:Date:References:From;
 b=DE+OlkdHKslsSbVtU2kSEJ0CQOEks0NDbyt9Dv8XCuWBfu1Y95HBwzvSRKK4o0rAj
 6CbRgjY2ZuOXpNINVDglDuq+6qKPqfhLh5D+Y5VjOibV2/dKgftBwrBnD35YqmQhAn
 rZlz3acIi8rk14rDbOF9SBJcayOosSDtF77O8hh6SKAjnWoJNBwEDyJ0pukGYKrm6D
 jGSfv//9amToUJ3PNU8nOS5xWNPnnEG9NE7mdJQJKSQYZ01h2hjBVzYX40uijID+Om
 jdFP0PIQSyPLg/L/MYOdEK6lD+OVYwRu1UtEk3Ps5t3oWGFAp9wu08rr0xR+kSyvgb
 MmUqL7HQ4yeoQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 81EF7A0069;
 Mon,  1 Apr 2019 17:53:20 +0000 (UTC)
Received: from US01WEMBX2.internal.synopsys.com ([fe80::e4b6:5520:9c0d:250b])
 by US01WEHTC3.internal.synopsys.com ([::1]) with mapi id
 14.03.0415.000; Mon, 1 Apr 2019 10:53:20 -0700
From: Vineet Gupta <vineet.gupta1@synopsys.com>
To: Andrey Abramov <st5pub@yandex.ru>, benh <benh@kernel.crashing.org>, paulus
 <paulus@samba.org>, mpe <mpe@ellerman.id.au>, tglx <tglx@linutronix.de>,
 mingo <mingo@redhat.com>, bp <bp@alien8.de>, hpa <hpa@zytor.com>, x86
 <x86@kernel.org>, mark <mark@fasheh.com>, jlbec <jlbec@evilplan.org>, richard
 <richard@nod.at>, dedekind1 <dedekind1@gmail.com>, adrian.hunter
 <adrian.hunter@intel.com>, gregkh <gregkh@linuxfoundation.org>, naveen.n.rao
 <naveen.n.rao@linux.vnet.ibm.com>, jpoimboe <jpoimboe@redhat.com>, "Dave
 Chinner" <dchinner@redhat.com>, darrick.wong <darrick.wong@oracle.com>,
 ard.biesheuvel <ard.biesheuvel@linaro.org>, George Spelvin <lkml@sdf.org>,
 linux-snps-arc <linux-snps-arc@lists.infradead.org>, "Linux Kernel Mailing
 List" <linux-kernel@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, ocfs2-devel <ocfs2-devel@oss.oracle.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, sfr <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2 1/5] arch/arc: unwind.c: replace swap function with
 built-in one
Thread-Topic: [PATCH v2 1/5] arch/arc: unwind.c: replace swap function with
 built-in one
Thread-Index: AQHU6LPJnnREyZHcl02YdFJlzGBU3g==
Date: Mon, 1 Apr 2019 17:53:20 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014643F9C4@US01WEMBX2.internal.synopsys.com>
References: <19606671554056883@myt3-1179f584969c.qloud-c.yandex.net>
 <23405591554057090@iva8-b333b7f98ab0.qloud-c.yandex.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.144.199.106]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_105336_885480_FE5543CE 
X-CRM114-Status: UNSURE (   6.67  )
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
Cc: mhocko <mhocko@suse.com>, rppt <rppt@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 3/31/19 11:31 AM, Andrey Abramov wrote:
> Replace swap_eh_frame_hdr_table_entries with built-in one, because
> swap_eh_frame_hdr_table_entries does a simple byte to byte swap.
>
> Since Spectre mitigations have made indirect function calls more
> expensive, and the default simple byte copies swap is implemented
> without them, an "optimized" custom swap function is now
> a waste of time as well as code.
>
> Signed-off-by: Andrey Abramov <st5pub@yandex.ru>
> Reviewed by: George Spelvin <lkml@sdf.org>
>

Acked-by: Vineet Gupta <vgupta@synopsys.com>

Thx,
-Vineet

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
