Received: from comal.ext.ti.com ([198.47.26.152])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PJ372-00080N-Se
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2010 11:57:17 +0000
From: "Savinay Dharmappa" <savinay.dharmappa@ti.com>
To: "'Sergei Shtylyov'" <sshtylyov@mvista.com>
References: <1289548911-21243-1-git-send-email-savinay.dharmappa@ti.com>
	<4CE50C64.60001@mvista.com>
In-Reply-To: <4CE50C64.60001@mvista.com>
Subject: RE: [PATCH v2 1/2] mtd: NOR flash driver for OMAP-L137/AM17x
Date: Thu, 18 Nov 2010 17:20:32 +0530
Message-ID: <003c01cb8716$ce4bb750$6ae325f0$@dharmappa@ti.com>
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

Hi Sergei,

On Thu, Nov 18, 2010 at 16:52:12, Sergei Shtylyov wrote:
> Hello.
> 
> On 12-11-2010 11:01, Savinay Dharmappa wrote:
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
>     Please add back my signoff, omitted in this version. Some of the code,

> including a bug fix, was authored by me.
> 

I'll surely do this. What about your Sign-off on 2/2 patch? Also shall I add
Aleksey's Sign-off on this patch and David's Sign-off on 2/2 patch?

Thanks,
Savinay.
