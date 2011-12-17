Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rc1zi-0002pA-K7
 for linux-mtd@lists.infradead.org; Sat, 17 Dec 2011 21:40:39 +0000
Received: by lahc1 with SMTP id c1so2850097lah.36
 for <linux-mtd@lists.infradead.org>; Sat, 17 Dec 2011 13:40:36 -0800 (PST)
Subject: Re: [PATCH 0/5] MTD: bcm63xxpart: improve robustness
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sat, 17 Dec 2011 23:40:30 +0200
In-Reply-To: <1324126698-9919-1-git-send-email-jonas.gorski@gmail.com>
References: <1324126698-9919-1-git-send-email-jonas.gorski@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1324158035.2240.5.camel@koala>
Mime-Version: 1.0
Cc: linux-mips@linux-mips.org, Artem Bityutskiy <Artem.Bityutskiy@intel.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Florian Fainelli <florian@openwrt.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2011-12-17 at 13:58 +0100, Jonas Gorski wrote:
> This patchset aims at improving the robustness of the CFE detection and
> image tag validation and parsing.
> 
> The image tag parsing improvement is especially useful when booting a
> ramdisk image through tftp, since there is no guarantee that the image
> on the flash is valid at this point.
> 
> As usual this patchset should got through the MTD tree and is based on
> the l2-mtd-2.6 git.

Looks good except of the "explain 64KiB" nit-pick. Pushing to
l2-mtd-2.6.git, but I'll take the improved version of patch 2.

Artem.
