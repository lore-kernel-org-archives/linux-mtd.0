Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZpnRL-0001pS-8i
 for linux-mtd@lists.infradead.org; Sat, 24 Oct 2015 01:16:11 +0000
Received: by pacfv9 with SMTP id fv9so137923026pac.3
 for <linux-mtd@lists.infradead.org>; Fri, 23 Oct 2015 18:15:50 -0700 (PDT)
Date: Fri, 23 Oct 2015 18:15:47 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ray Jui <rjui@broadcom.com>
Cc: Clay McClure <clay@daemons.net>, linux-mtd@lists.infradead.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH] mtd: brcmnand: Fix NAND_CMD_PARAM byte order
Message-ID: <20151024011547.GX13239@google.com>
References: <1445629626-27474-1-git-send-email-clay@daemons.net>
 <20151023232742.GV13239@google.com> <562AD54B.2000501@broadcom.com>
 <20151024011219.GW13239@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151024011219.GW13239@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 23, 2015 at 06:12:19PM -0700, Brian Norris wrote:
> On Fri, Oct 23, 2015 at 05:48:11PM -0700, Ray Jui wrote:
> > If so, then should the logic here be the following?
> > 
> > ret = cpu_to_le32(ctrl->flash_cache[offs >> 2]) >> ((offs & 0x03) << 3);
> 
> I guess so, but that's getting even uglier, not prettier.

Sorry, I misread. No, that will break brcmstb too. The logic as-is is
tested and works for little endian BCM7xxx MIPS and ARM, regardless of
theory. You'll need to figure out the quirks of why/how it's really
*supposed* to work (and then to write good code around that) to get more
platforms to work with it.

Brian
