Received: from [85.183.114.52] (helo=Dublin.logfs.org)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RFxae-0001Ms-Vl
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2011 00:31:33 +0000
Date: Tue, 18 Oct 2011 02:32:15 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: h-fache@ti.com
Subject: Re: [PATCH] phram: make kernel boot command line arguments work
Message-ID: <20111018003215.GB31782@logfs.org>
References: <1318866038-11781-1-git-send-email-h-fache@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1318866038-11781-1-git-send-email-h-fache@ti.com>
Cc: joern@lazybastard.org, linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 17 October 2011 17:40:38 +0200, h-fache@ti.com wrote:
> From: Hervé Fache <h-fache@ti.com>
> 
> This patch is based on Ville Herva's similar patch to block2mtd.
> 
> Trying to pass kernel command line arguments at boot-time did not work, as
> phram_setup() was called so early that kmalloc() was not functional.
> 
> This patch only saves the option string at the early boot stage, and parses
> it later when init_phram() is called. This is determined by the fact that
> init was called, or not.
> 
> With this patch, I can boot with a statically-compiled phram, and mount a
> ext2 root fs from physical RAM, without the need for a initrd.
> 
> Signed-off-by: Hervé Fache <h-fache@ti.com>

I like it.
Acked-by: Joern Engel <joern@logfs.org>

Dedekind, can I leave it to you to merge this?  And Hervé, can I
motivate you to remove the #ifdef MODULE parts from block2mtd as well?
If someone complains about increased binary size, I am willing to look
for ten bytes to remove elsewhere as a trade-off.

Jörn

-- 
Computer system analysis is like child-rearing; you can do grievous damage,
but you cannot ensure success."
-- Tom DeMarco
