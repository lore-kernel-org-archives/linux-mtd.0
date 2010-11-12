Received: from comal.ext.ti.com ([198.47.26.152])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PGlDw-0006ab-PD
	for linux-mtd@lists.infradead.org; Fri, 12 Nov 2010 04:26:54 +0000
From: "Savinay Dharmappa" <savinay.dharmappa@ti.com>
To: "'Sergei Shtylyov'" <sshtylyov@mvista.com>
References: <1289462153-4350-1-git-send-email-savinay.dharmappa@ti.com>
	<4CDC338F.30600@mvista.com>
In-Reply-To: <4CDC338F.30600@mvista.com>
Subject: RE: [PATCH 1/2] mtd: NOR flash driver for OMAP-L137/AM17x
Date: Fri, 12 Nov 2010 09:50:25 +0530
Message-ID: <000901cb8220$edf40df0$c9dc29d0$@dharmappa@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Cc: amakarov@ru.mvista.com, davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org, 'David Griego' <dgriego@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 11, 2010 at 23:48:55, Sergei Shtylyov wrote:
> Hello.
> 
> Savinay Dharmappa wrote:
> 
> > From: David Griego <dgriego@mvista.com>
> 
> > OMAP-L137/AM17x has limited number of dedicated EMIFA
> > address pins, enough to interface directly to an SDRAM.
> > If a device such as an asynchronous flash needs to be
> > attached to the EMIFA, then either GPIO pins or a chip
> > select may be used to control the flash device's upper
> > address lines.
> > 
> > This patch adds support for the NOR flash on the OMAP-L137/
> > AM17x user interface daughter board using the latch-addr-flash
> > MTD mapping driver which allows flashes to be partially
> > physically addressed. The upper address lines are set by
> > a board specific code which is a separate patch.
> 
> > Signed-off-by: David Griego <dgriego@mvista.com>
> 
>     It's again not clear why you've dropped my and Alexei's signoff. Did
we 
> request you to do so?

I had sent this series to all MV folks to get their signoff but nobody
replied.
If you are OK with the updated version of this patch, which I'll be
submitting
shortly, please add your signoff.

Regards,
Savinay.
