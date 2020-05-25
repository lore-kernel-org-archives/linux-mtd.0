Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B77C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 08:35:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34D9D2070A
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 08:35:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BUH71Z6E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34D9D2070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L9iNPzq2RTA9Pvp/xgqGNjNktnGdd3HcEyR6+ciWmeI=; b=BUH71Z6EBC25T+
	kfoBiFMUnB2kQv3NxY4ep0HXQ3DHQ+OffHTRgw+rqYbHkckDjfe8qu7StUQoWB50Zvru0Z275QklI
	0SnBU5Maj2VTlGjBCkPMvlVQd8lroi6YE3WTFTJVImjbA+ToiJaCPTkJZyLa6Pdsg4vz2CnjG/rKX
	eMh3UiXy9fB8ixipXPLC1YUsGb3Qbxo/khMHsz290yW7u5RzJOcXm4Q1SOyOZtfpxDj/F66eBq9di
	rsJDe2JeFYvUOkbIC6JzYa5plVzZwBZJOpYH9U7D0PWBJAlE6k67Az1nIMJwjNn9S0w9fQZc5OWeQ
	J0RkFVghr4xMqj386Vuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd8Zn-0003hN-2V; Mon, 25 May 2020 08:35:15 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd8Zj-000327-OY
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 08:35:13 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2FDBA2A00AD;
 Mon, 25 May 2020 09:35:09 +0100 (BST)
Date: Mon, 25 May 2020 10:35:02 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 17/17] mtd: rawnand: nandsim: Reorganize
 ns_cleanup_module()
Message-ID: <20200525103502.2b838933@collabora.com>
In-Reply-To: <20200525102852.068349d8@xps13>
References: <20200509191431.15862-1-miquel.raynal@bootlin.com>
 <20200509191431.15862-18-miquel.raynal@bootlin.com>
 <CAFLxGvzU2ESxZ74cve9w=CLBY2v95MMMJqzOFEmCAhVHYF5VvA@mail.gmail.com>
 <20200525001328.6b52da1f@xps13>
 <20200525084637.328d2872@collabora.com>
 <20200525084735.0ca0dad3@collabora.com>
 <20200525092315.5f950554@xps13> <20200525102852.068349d8@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_013511_955821_1DF07269 
X-CRM114-Status: GOOD (  17.27  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Richard Weinberger <richard@nod.at>, dedekind@infradead.org,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 25 May 2020 10:28:52 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Miquel Raynal <miquel.raynal@bootlin.com> wrote on Mon, 25 May 2020
> 09:23:15 +0200:
> 
> > Hi Boris,
> > 
> > Boris Brezillon <boris.brezillon@collabora.com> wrote on Mon, 25 May
> > 2020 08:47:35 +0200:
> >   
> > > On Mon, 25 May 2020 08:46:37 +0200
> > > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > >     
> > > > On Mon, 25 May 2020 00:13:28 +0200
> > > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > > >       
> > > > > Hi Richard,
> > > > > 
> > > > > Richard Weinberger <richard.weinberger@gmail.com> wrote on Sun, 24 May
> > > > > 2020 23:37:13 +0200:
> > > > >         
> > > > > > On Sat, May 9, 2020 at 9:19 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:          
> > > > > > >         ns_debugfs_remove(ns);
> > > > > > > -       ns_free(ns);    /* Free nandsim private resources */
> > > > > > > -       nand_release(chip); /* Unregister driver */
> > > > > > > -       kfree(ns);        /* Free other structures */
> > > > > > > -       ns_free_lists();
> > > > > > > +       WARN_ON(mtd_device_unregister(nsmtd));
> > > > > > > +       ns_free(ns);
> > > > > > > +       kfree(erase_block_wear);
> > > > > > > +       nand_cleanup(chip);
> > > > > > > +       list_for_each_safe(pos, n, &grave_pages) {
> > > > > > > +               kfree(list_entry(pos, struct grave_page, list));
> > > > > > > +               list_del(pos);            
> > > > > > 
> > > > > > Are you sure you can use pos after freeing the entry?
> > > > > > Smells like use after free.
> > > > > >           
> > > > > 
> > > > > Mmmmh, I should probably invert those two lines, first call list_del()
> > > > > and then call kfree() on list_entry().        
> > > > 
> > > > You can also use  list_for_each_entry_safe():    
> > 
> > I usually use this helper, but I guess I copy/pasted the below lines
> > from somewhere else in this file... I'll use list_for_each_entry_safe().  
> 
> Actually, grave_pages, weak_pages and weak_blocks are three structures
> of different types, that's why they called kfree() directly on
> list_entry() -> to avoid having to declare 6 different pointers. I'll
> stick to the same presentation than ns_free_lists then.

Hm, okay. I guess having the init/cleanup split is sub-functions would
be cleaner, but it's not like we want to invest time in nandsim, so I'm
fine with the list_for_each_safe().

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
