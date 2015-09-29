Date: Tue, 29 Sep 2015 13:57:27 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: dwmw2@infradead.org, sebastian@breakpoint.cc, robh+dt@kernel.org,
 pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
 shawn.guo@linaro.org, kernel@pengutronix.de,
 boris.brezillon@free-electrons.com, marb@ixxat.de,
 aaron@tastycactus.com, bpringlemeir@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 albert.aribaud@3adev.fr, klimov.linux@gmail.com,
 Bill Pringlemeir <bpringlemeir@nbsps.com>
Subject: Re: [PATCH v12 2/5] mtd: nand: vf610_nfc: add hardware BCH-ECC support
Message-ID: <20150929205727.GP31505@google.com>
References: <1441242397-870-1-git-send-email-stefan@agner.ch>
 <1441242397-870-3-git-send-email-stefan@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1441242397-870-3-git-send-email-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pushed this patch to l2-mtd.git, as it looks pretty much good. Although,
I'd like raw read support...

On Wed, Sep 02, 2015 at 06:06:34PM -0700, Stefan Agner wrote:
> This adds hardware ECC support using the BCH encoder in the NFC IP.
> The ECC encoder supports up to 32-bit correction by using 60 error
> correction bytes. There is no sub-page ECC step, ECC is calculated
> always accross the whole page (up to 2k pages).
> 
> Limitations:
> - HW ECC: Only 2K page with 64+ OOB.
> - HW ECC: Only 24 and 32-bit error correction implemented.
> 
> Raw writes have been tested using the generic nand_write_page_raw
> implementation. However, raw reads are currently not possible
> because the controller need to know whether we are going to use
> the ECC mode already at NAND_CMD_READ0 command time. At this point
> we do not have the information whether it is a raw read or a
> regular read at driver level...

Hmm, can you get this in ecc.read_page_raw()?
