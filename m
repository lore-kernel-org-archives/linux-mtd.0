Subject: Re: [RFC: 2.6 patch] remove the broken MTD_PCMCIA driver
From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20061118214056.GB31879@stusta.de>
References: <20061118214056.GB31879@stusta.de>
Content-Type: text/plain
Date: Tue, 28 Nov 2006 22:16:27 +0000
Message-Id: <1164752187.14595.20.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Simon Evans <spse@secret.org.uk>, linux-pcmcia@lists.infradead.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2006-11-18 at 22:40 +0100, Adrian Bunk wrote:
> The MTD_PCMCIA driver has:
> - already been marked as BROKEN in 2.6.0 three years ago and
> - is still marked as BROKEN.
> 
> Drivers that had been marked as BROKEN for such a long time seem to be
> unlikely to be revived in the forseeable future.

Actually, there's hardware currently on its way to me, and I plan to fix
this driver fairly soon.

> But if anyone wants to ever revive this driver, the code is still
> present in the older kernel releases.

I'm unconvinced by that argument in the general case. People don't go
looking back through git history, do they? Drivers such as this don't
really do any harm as they are, and they're _much_ easier to find when
someone does want to fix them up.

-- 
dwmw2
