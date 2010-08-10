From: John Ogness <john.ogness@linutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [v2] Add i.MX51 support to mxc_nand
References: <1281360053-8386-1-git-send-email-s.hauer@pengutronix.de>
Date: Tue, 10 Aug 2010 13:31:18 +0200
In-Reply-To: <1281360053-8386-1-git-send-email-s.hauer@pengutronix.de> (Sascha
	Hauer's message of "Mon, 9 Aug 2010 15:20:44 +0200")
Message-ID: <80aaou4sc9.fsf@merkur.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Baruch Siach <baruch@tkos.co.il>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, Ivo Clarysse <ivo.clarysse@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sascha,

On 2010-08-09, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> In this series I swapped the "fix correct_data function" with the
> "support 8bit ecc" patch as suggested by Baruch. Also, I integrated
> the patches sent by John Ogness. John, I hope I addressed all your
> patches, it would be good if you could test them on 16bit flash as you
> seem to be the only one having a board with such a flash.

Not quite. The patch to use interrupt masking instead of interrupt
disabling is not included. Also the patch to set some register fields is
not included. I have ported these patches to your latest patchset. There
will be 3 in all. I will post them shortly.

I tested your patchset "as is" and it works for the i.MX35 with a 16-bit
flash chip. I also tested ECC error detection and it is ok.

With an RT-kernel the driver has some interrupt issues, which are
resolved by the patch to mask instead of disabling interrupts (which I
will be posting shortly).

John Ogness
