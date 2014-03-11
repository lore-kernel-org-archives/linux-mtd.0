Date: Tue, 11 Mar 2014 12:55:54 -0600
From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
To: Boris BREZILLON <b.brezillon.dev@gmail.com>
Subject: Re: [RFC PATCH v2 04/14] mtd: nand: define struct nand_timings
Message-ID: <20140311185554.GD31835@obsidianresearch.com>
References: <1391006064-28890-1-git-send-email-b.brezillon.dev@gmail.com>
 <1391006064-28890-5-git-send-email-b.brezillon.dev@gmail.com>
 <531DC1A4.7010208@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <531DC1A4.7010208@gmail.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, dev@linux-sunxi.org,
 linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>,
 linux-mtd@lists.infradead.org, Grant Likely <grant.likely@linaro.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 10, 2014 at 02:44:04PM +0100, Boris BREZILLON wrote:

> Some timings are missing here (see Table 55 in the ONFI spec):

Right..

The 'mode' covers only the raw electrical parameters needed to
exchange commands, other timings cover the commands
themselves. Notably the timing mode does not alter those parameters.

To me it seems tidy to keep the 'mode' timings contained in their own
struct and find other homes for the other parameters.

> -tR
> -tBERS
> -tCCS
> -tPLEBSY
> -...
> 
> I see at least 3 of those timings that could be useful (for the moment) :
> - tR: this one should be used to fill the chip_delay field
> - tPROG and tBERS: could be used within nand_wait to choose the timeo
>   value appropriately.

IIRC these timing values are really only necessary if the controller
does not support the READY/BUSY input, in that case drivers typically
seem to use 'chip_delay' which is the maximum possible command
execution time (a sleep long enough to guarentee that READY/BUSY is
de-asserted).

> Or should I create a new struct for these timings ?
> In the latter case how should I name it ?

struct onfi_command_timings ?

Regards,
Jason
