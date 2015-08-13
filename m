Date: Wed, 12 Aug 2015 19:00:04 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Joachim Eastwood <manabian@gmail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 David Woodhouse <dwmw2@infradead.org>, shijie.huang@intel.com,
 linux-mtd@lists.infradead.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 devicetree@vger.kernel.org, Han Xu <han.xu@freescale.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: add driver for NXP SPI Flash
 Interface (SPIFI)
Message-ID: <20150813020004.GA108786@google.com>
References: <1433106362-6032-1-git-send-email-manabian@gmail.com>
 <1433106362-6032-2-git-send-email-manabian@gmail.com>
 <5570692E.2050603@vanguardiasur.com.ar>
 <CAGhQ9VzU+J1ZT45e-yZ+BAmyZvLUm1cyXE2T__O_4gGjtHrX-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGhQ9VzU+J1ZT45e-yZ+BAmyZvLUm1cyXE2T__O_4gGjtHrX-w@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 04, 2015 at 05:58:07PM +0200, Joachim Eastwood wrote:
> On 4 June 2015 at 17:05, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
> > I think the "auto-detect" quirk is really needed, or you are will
> > otherwise fail to probe with the generic "jedec,spi-nor" compatible
> > string.
[...]
> Note that this code was copied from fsl-quadspi so I assume it has the
> same problem.

Yes, fsl-quadspi gets this a bit wrong, I think. But spi_nor_scan()
didn't have a notion of "NULL means autodetect" when it was first
written. The framework is still evolving a bit.

I have a simple patch for fsl-quadspi to fix this up now, but I don't
have the HW. Maybe I'll send with a RFT.

Brian
