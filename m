Date: Tue, 25 Mar 2014 11:01:02 -0600
From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RFC 02/47] mtd: nand: add ONFI NAND Timing Mode Specifications
Message-ID: <20140325170102.GC30641@obsidianresearch.com>
References: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
 <1395735604-26706-3-git-send-email-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395735604-26706-3-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, Boris BREZILLON <b.brezillon.dev@gmail.com>,
 kernel@stlinux.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 25, 2014 at 08:19:19AM +0000, Lee Jones wrote:
> This patch adds a new structure, 'nand_timing_spec', to capture the A/C
> timing characteristics of NAND devices.

Boris BREZILLON <b.brezillon.dev@gmail.com> has been working on a
similar patch for a time now, and I think has an implementation for
the sunxi driver.
 
> some of the major NAND manufacturers (e.g. Samsung, Toshiba). Here we
> have followed broadly the ONFI timing definitions.

Timing specifications that are not precisely defined are
useless.. I would stick entirely with the well defined ONFI ones
until a need arises..

> + * Note, 'tR' field (maximum page read time) is extracted from the ONFI
> + * parameter page during device probe.
> + */
> +struct nand_timing_spec nand_onfi_timing_specs[] = {

const?

> +	/*
> +	 * ONFI Timing Mode '0' (supported on all ONFI compliant devices)
> +	 */
> +	[0] = {
> +		.tCLS	= 50,
> +		.tCS	= 70,
> +		.tALS	= 50,

Use picoseconds, ns is already loosing precision at the higher timing
modes.

Cheers,
Jason
