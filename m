Date: Wed, 11 Mar 2015 16:42:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/6] mtd: teach mxc-nand about ONFI probing
Message-ID: <20150311234249.GE32500@ld-irv-0074>
References: <1423594800-24214-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1423594800-24214-1-git-send-email-u.kleine-koenig@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 10, 2015 at 07:59:54PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> this series implements support for ONFI probing in mxc-nand.
> Before a PARAM command was just ignored and the following read_bytes
> read whatever then happened to be available from the controller's RAM.
> But actually this wasn't that bad because the driver already failed to
> read the ONFI marker at offset 32 in response to the READID command and
> so the PARAM command wasn't issued at all :-)
> 
> Patch 1 is a robustness fix. Patch 2 is necessary to not make the
> controller stuck when the READPAGE command is issued before the flash
> chip is identified. Patch 3 is needed to be able to read more than 6
> bytes in the read_byte callback. Finally patch 4 fixes the driver to
> allow reading out the READID ONFI marker and patch 5 implements support
> for the PARAM command.
> 
> Patch 6 implements a WARN that triggers when the core requests an
> unknown command from the driver. In the case of missing PARAM support it
> wouldn't have triggered because READID at offset 0x20 failed, too, but
> it might be worthwhile anyhow; I'm not sure though, so I marked it RFC.
> Not sure the set of commands will grow in the near future ...
> 
> Best regards
> Uwe

Looks OK to me. Pushed all to l2-mtd.git.

Brian
