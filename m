Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ytXV-0007c6-00
	for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2002 13:32:42 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <5.1.0.14.0.20021008132754.00b9b3d0@sss.dnsalias.net> 
References: <5.1.0.14.0.20021008132754.00b9b3d0@sss.dnsalias.net> 
To: Svenning Sorensen <sss@sss.dnsalias.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [BUG] Oops in nftl driver 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 08 Oct 2002 13:32:39 +0100
Message-ID: <29399.1034080359@passion.cambridge.redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

sss@sss.dnsalias.net said:
>  I don't know if it will be triggered under "normal" circumstances. In
> my case, it happened after I had switched from using the M-Systems
> driver to the linux-mtd driver, without reformatting the DOC in
> between, and with an ext2-compressed file system on it. I would say
> that the kernel should not oops, no matter the state and content of
> the DOC, so I believe the bug is real.

> I'm using the linux-2.4.19 driver, but the bug still appears to exist
> in the cvs version.

> I wrote down the oops info and handed it to ksymoops:

Thanks for the useful report. Does this help?

--- drivers/mtd/nftlmount.c     13 Sep 2002 14:35:33 -0000      1.29
+++ drivers/mtd/nftlmount.c     8 Oct 2002 12:32:24 -0000
@@ -740,7 +740,7 @@ int NFTL_mount(struct NFTLrecord *s)

        /* second pass to format unreferenced blocks  and init free block count */
        s->numfreeEUNs = 0;
-       s->LastFreeEUN = BLOCK_NIL;
+       s->LastFreeEUN = le16_to_cpu(s->MediaHdr.FirstPhysicalEUN);

        for (block = 0; block < s->nb_blocks; block++) {
                if (s->ReplUnitTable[block] == BLOCK_NOTEXPLORED) {

--
dwmw2
