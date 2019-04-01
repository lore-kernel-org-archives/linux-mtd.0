Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B36C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 09:57:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EA6E2086C
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 09:57:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kpzhlovn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sdf.org header.i=@sdf.org header.b="SVHocj+q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EA6E2086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sdf.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Subject:To:Message-Id:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YTETCsTcAk7mn7OO1azTzlGTRhMOy6J6+RFcDW+WEUE=; b=KpzhlovntTEyrx4j164rSN9/k6
	LdSc6a8NGJK2sAoQnIkSJXS9rDfbjGSTPFqQEeuY69+04PPoWmKcsRp0Ybxp0rsgJlJKfnwtXeIue
	AKubkKwwk4luLivUEkNI7Zv4JHd0kT4mwp0w6QOLFue1dkaIuHD9FfF2zPSOhFTu9f7Vb4sgkA5tm
	7PBpOmNmdNUypFQfDCLo3ccMwzUz5F6CnCT7bi6xlG/jaJLl6stlEqB0Vn20toPb4RbFsWlCc+6hZ
	SXcgHXw3aczSGL8sziDJ59rY9fmQZ+aWEiEsRnivwhPqIYgMKbkbkWdLuE3d558XRWbGx3AcXwlit
	Le48d5mw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAthS-0004oU-S0; Mon, 01 Apr 2019 09:57:54 +0000
Received: from mx.sdf.org ([205.166.94.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAthQ-0004o9-4s; Mon, 01 Apr 2019 09:57:53 +0000
Received: from sdf.org (IDENT:lkml@sdf.lonestar.org [205.166.94.16])
 by mx.sdf.org (8.15.2/8.14.5) with ESMTPS id x319u8Fl017367
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits) verified NO); 
 Mon, 1 Apr 2019 09:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sdf.org; s=default;
 t=1554112582; bh=nfyrQ8GwYN1dR+36K+w2KJmeeTK++gvNmVw4hbCgtQ4=;
 h=Date:From:To:Subject:Cc:In-Reply-To:References;
 b=SVHocj+qYv7EIPnLIfPgOVaNlCkoSdLXLVw6GFrl9DCOnxhLWUjOM9vbGSgCCoGcp
 D1nD66gIhO4CU+TNaRxHv3p9OlqQMQLiL6LH5yenIMo9bJvE6E7MQYstcxd8XbGkjb
 GywuxAxfIpYFvEK00nepx2+Z/kokFUYZ+IxaQyMI=
Received: (from lkml@localhost)
 by sdf.org (8.15.2/8.12.8/Submit) id x319u70q021113;
 Mon, 1 Apr 2019 09:56:07 GMT
Date: Mon, 1 Apr 2019 09:56:07 GMT
From: George Spelvin <lkml@sdf.org>
Message-Id: <201904010956.x319u70q021113@sdf.org>
To: andriy.shevchenko@linux.intel.com, st5pub@yandex.ru
Subject: Re: [PATCH v2 5/5] Lib: sort.h: replace int size with size_t size in
 the swap function
In-Reply-To: <20190401093555.GD9224@smile.fi.intel.com>
References: <19606671554056883@myt3-1179f584969c.qloud-c.yandex.net>,
 <23051461554058370@iva6-3ac3de5fcc31.qloud-c.yandex.net>,
 <20190401093555.GD9224@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_025752_227181_840DCC71 
X-CRM114-Status: UNSURE (   5.00  )
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
Cc: peterz@infradead.org, benh@kernel.crashing.org, dchinner@redhat.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, hpa@zytor.com,
 jslaby@suse.cz, sfr@canb.auug.org.au, darrick.wong@oracle.com,
 mpe@ellerman.id.au, mark@fasheh.com, x86@kernel.org, mingo@redhat.com,
 naveen.n.rao@linux.vnet.ibm.com, linux-snps-arc@lists.infradead.org,
 jannh@google.com, bp@alien8.de, jlbec@evilplan.org, jpoimboe@redhat.com,
 tglx@linutronix.de, lkml@sdf.org, ard.biesheuvel@linaro.org,
 gregkh@linuxfoundation.org, dedekind1@gmail.com, adrian.hunter@intel.com,
 vgupta@synopsys.com, richard@nod.at, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, ocfs2-devel@oss.oracle.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 1 Apr 2019 at 12:35:55 +0300, Andy Shevchenko wrote:
> Hmm... If (*swap)() is called recursively it means the change might increase
> stack usage on 64-bit platforms.
> 
> Am I missing something?

Under what conceivable circumstance would someone write a recursive
(*swap)() function?

You're technically right, but the precondition is more fantastical
than "if the U.K.'s parliament get their shit together before the
12th", so I have a hard time worrying about it.

But you did make me think of something: the whole reason swap()
takes a size argument is for the benefit of the (no longer existing)
generic swap functions.  All of the custom swap functions ignore
it.

So how about *deleting* the parameter instead?  That simplifies
everything.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
