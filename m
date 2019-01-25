Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD57BC282C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 14:16:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2A60218D0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 14:16:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aaLKcFo9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gs6Y+y8y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2A60218D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQPDC3+neQjLr7vHuP9fqQtqdfwTDPVxurMRNwfmRW8=; b=aaLKcFo9DDwqLG
	hAnLImnMStP7xUfy7M8u3CXKepmiHEk9POn+pPY1B26D0Q6PBwyN/YsuEPrC663ko4T4XxkUFQmjX
	ppRjOqp/Guusp5p85V+RSuUV2+hSOveP9HaK1jjmVkpKfxriHsxaroAUAZO6zUXS7z9jcJdeTcsBV
	KoAZwYeGnI+4uxg6NqY0rShIb4vnXNuSrgYvPbhqSxKQVS0vCkiu+RJaybDEXVTGWFXqCM5ERSKGD
	2okuHQR8itNVtIZ/Pa0CgZSTisCsI/TWw7+zukxWdReGHFkjD8eItJjqUdGofOv/liTlR8WnKTpKh
	9m6qo/yrBVrxvFLu1yqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gn2HD-000437-E6; Fri, 25 Jan 2019 14:16:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn2H9-00042f-EE
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 14:16:08 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C6CB72085B;
 Fri, 25 Jan 2019 14:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548425767;
 bh=nI8dVePVhlBqoprMFKvp98+pmJWUwvs5+3RO2qaF9CA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Gs6Y+y8yzrwKYcQZyPJVDXPXnyxVHvXo0iInXuRRunAG5ILZ8p7wgWZKmTtbvx4NS
 6A3V8U4+cS0GBh8GJhnfHglWYRrgKDITRcCj1x7ZLmsQHEvrXan6sXkvEAEnjsZLGe
 4sccRbBdCTtkvQ2zI7doTgL6x6MXaHlsizyBXIk0=
Date: Fri, 25 Jan 2019 15:15:59 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Subject: Re: [EXT] Re: [RESEND PATCH V2 2/2] mtd: core: NAND filling block
Message-ID: <20190125151559.36623227@bbrezillon>
In-Reply-To: <BYAPR08MB4533275427ECE1990F28B747DB9B0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB4533401FB969CA9A8D254F34DB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190119000135.0064da24@bbrezillon>
 <BYAPR08MB4533227B317D5AA334FEB240DB9F0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190121111255.79be03de@bbrezillon>
 <BYAPR08MB4533275427ECE1990F28B747DB9B0@BYAPR08MB4533.namprd08.prod.outlook.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_061607_491645_B302EBEE 
X-CRM114-Status: GOOD (  16.53  )
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
Cc: "richard@nod.at" <richard@nod.at>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "Zoltan Szubbocsev \(zszubbocsev\)" <zszubbocsev@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 25 Jan 2019 13:31:17 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> Hi, Boris
> 
> >
> >On Mon, 21 Jan 2019 10:04:15 +0000
> >"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:
> >  
> >> Hi, Boris
> >>  
> >> >On Fri, 18 Jan 2019 22:12:04 +0000
> >> >"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:
> >> >  
> >> >> +	/* Corrupt page0 and page1, in order to simulate an
> >> >> +	 * uncompleted eraseing scenario. Just for case of
> >> >> +	 * power loss hits while below programming. in this
> >> >> +	 * way, the PEB will be re-erased again.
> >> >> +	 */
> >> >> +	empty_page_mask |= 0x3;
> >> >> +	memset(data_buf, 0xAA,  mtd->writesize);  
> >> >
> >> >Why do you use the 0xaa pattern BTW?  
> >>
> >> Random pattern or any pattern is ok. Just to fill in page.  
> >
> >Let's use 0x0 then. This way all cells are actually in a "programmed"
> >state.   
> The proposed solution is effective in addressing the problem. A 00h pattern would also
> work but it would add unnecessary stress to the device, by programming more memory cells.

Then add a comment explaining that. Oh, BTW, you'll anyway wear the
block out pretty quickly since you're always programming the same cells
to 0, right?

> 
> >BTW, I'd still be interested in knowing more about the root cause of this
> >issue. What causes this wrong "cell is erased" detection in your chips? I thought
> >the ERASE operation was an iterative process and cells were being tested after
> >each step to know whether they are erased or not in order to decide to do
> >another step or stop.
> >Am I wrong? What happens here to cause this erroneous detection?  
> 
> I cannot comment on the details of the detection procedure, which is proprietary algorithm.

Which is a shame, but enough on that, I'm pissed off by Micron's
behavior and you already know it.

> The patch ensures that the erase detection is accurate.

As said in the other mail, I hope you're right...

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
