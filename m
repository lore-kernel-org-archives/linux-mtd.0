Date: Sun, 17 Dec 2017 17:23:42 +0100
From: Willy Tarreau <w@1wt.eu>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: pxa3xx_nand times out in 4.14 with JFFS2
Message-ID: <20171217162342.GA1833@1wt.eu>
References: <20171217120503.GA3323@1wt.eu>
 <CAAEAJfBUyhvi68A6QEJRywq9hxMBYuJ4m+O6ogBtV1nkeBR_og@mail.gmail.com>
 <20171217155305.16c5bb4f@bbrezillon> <20171217150043.GA1403@1wt.eu>
 <CAAEAJfD47bGTSppEqcRszjAgBUjiCevmdYLKfsQTPYMcVu8VDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAEAJfD47bGTSppEqcRszjAgBUjiCevmdYLKfsQTPYMcVu8VDA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 17, 2017 at 12:53:36PM -0300, Ezequiel Garcia wrote:
> If not too much to ask, this is the test that I believe is needed.
> You seem to have a setup ready, hence why I'm asking you, if
> possible, to give it a shot.
> 
> (1) Scrub the BBT from the NAND. Or scrub the whole NAND.
> You cannot do this from the kernel, it needs to be done from the bootloader.
> 
> (2) Mark a couple blocks as bad using the OOB -- AFAICR, there
> was a command to do this in the bootloader.
> 
> (3) Boot, let Linux create the BBT and see if it catches the bad blocks.

Are the current boot loaders safe regarding the scrub operation ? I'm
asking because that's how I bricked my mirabox a few years ago when
trying to mark a bad block from u-boot :-/  If someone has a good
knowledge of these commands to limit the risk and helps me only playing
with a small part at the end of the flash (or in the unused area) I'd
prefer it :-)

> This would guarantee that devices with factory bad blocks,
> (and no BBT), would be OK with this patch.

I see. I'm fine with trying provided I have reasonably good assurance
that I won't have to go through the kwboot pain again :-/

Cheers,
Willy
