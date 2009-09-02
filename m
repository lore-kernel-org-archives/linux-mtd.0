Received: from mail-ew0-f209.google.com ([209.85.219.209])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Miqbp-0004re-VF
	for linux-mtd@lists.infradead.org; Wed, 02 Sep 2009 14:14:54 +0000
Received: by ewy5 with SMTP id 5so803719ewy.27
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 Sep 2009 07:14:48 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 2 Sep 2009 16:14:37 +0200
Message-ID: <46a038f90909020714s599c9608r8a3dea0fd6814d6b@mail.gmail.com>
Subject: Patch to mtd_debug "info" to provide a bad block count --
From: Martin Langhoff <martin.langhoff@gmail.com>
To: linux-mtd@lists.infradead.org, navigator.atreides@gmail.com,
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi list,

I've munged a patch initially floated by navigator.atreides@gmail.com
on this list to add a bad block count to the mtd_debug 'info' command.

The patch is here - http://dev.laptop.org/~martin/mtd_debug.patch

Using it on OLPC's XOs, I found that I had to "end" the scanning of
the device 4 blocks short of the actual end of device to avoid reading
the blocks reserved for BBT.

In the patch I have hardcoded the number of blocks to skip, but I
understand this may be configurable. Is there an ioctl to read the
number of blocks to skip?

I've also seen some patches to support per-chip BBT, which would make
this more complex again - so the point of this is actually
differentiating true bad blocks from blocks MTD protects from our
prying eyes (and from jffs2 I presume) wrongfully reporting them as
bad.

Either way, it'd be great if a variant of this patch finds its way
into the mtd-utils package, as this aids in-the-field debugging
enormously.

cheers,



m
-- 
 martin.langhoff@gmail.com
 martin@laptop.org -- School Server Architect
 - ask interesting questions
 - don't get distracted with shiny stuff  - working code first
 - http://wiki.laptop.org/go/User:Martinlanghoff
