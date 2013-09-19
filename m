Date: Thu, 19 Sep 2013 15:41:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH v3] mtd: atmel_nand: use minimum ecc requirements of
 nand: ecc_{strength,step}_ds
Message-ID: <20130919224154.GT4550@ld-irv-0074.broadcom.com>
References: <1379483928-18253-1-git-send-email-josh.wu@atmel.com>
 <20130918214225.GP4550@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130918214225.GP4550@ld-irv-0074.broadcom.com>
Cc: nicolas.ferre@atmel.com, plagnioj@jcrosoft.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 18, 2013 at 02:42:25PM -0700, Brian Norris wrote:
> On Wed, Sep 18, 2013 at 01:58:48PM +0800, Josh Wu wrote:
> > Since ecc_{strength,step}_ds is introduced in nand_chip structure for
> > minimum ecc requirements. So we can use them directly and remove our
> > own get_onfi_ecc_param function.
> > 
> > Signed-off-by: Josh Wu <josh.wu@atmel.com>
...
> I'll just apply the appended diff, to address these small comments and
> to shorten the messages a little (they are a bit verbose and are over 80
> characters). It's still not under 80, but it's more reasonable.
> 
> Let me know if you have any objections, or else I'll push this to
> l2-mtd.git.

Pushed to l2-mtd.git. Thanks!

Brian
