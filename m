Subject: Re: [PATCH][NAND] Add ssfdc read-only translation layer
From: David Woodhouse <dwmw2@infradead.org>
To: Claudio Lanconelli <lanconelli.claudio@eptar.com>
In-Reply-To: <449AA7E2.5020609@eptar.com>
References: <449AA7E2.5020609@eptar.com>
Content-Type: text/plain
Date: Tue, 27 Jun 2006 15:07:22 +0100
Message-Id: <1151417243.17609.151.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-06-22 at 16:23 +0200, Claudio Lanconelli wrote:
> Hi,
> here is another try.
> Now it builds fine against git mtd-2.6, however I can't test if it works 
> anymore after the changes,
> my target system at the moment doesn't support kernel 2.6, sigh!

Thanks.

> One question, I use major number 44 (since it's the number used by old 
> ssfdc.c) but I don't know if it's the correct number.

It isn't. Please send mail to device@lanana.org requesting a new major
number.

Also, why is the GETGEO stuff conditional? Why not just build it in
always? And do we need the table? Can't we just calculate it? There's
code to do similar calculations in NFTL already.

-- 
dwmw2
