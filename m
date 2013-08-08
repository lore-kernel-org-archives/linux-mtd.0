Date: Wed, 7 Aug 2013 23:24:38 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH] mtd: atmel_nand: move the sanity check to the beginning
 of pmecc_enable()
Message-ID: <20130808062438.GA4479@brian-ubuntu>
References: <1375869491-25137-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1375869491-25137-1-git-send-email-josh.wu@atmel.com>
Cc: dedekind1@gmail.com, David Woodhouse <dwmw2@infradead.org>,
 nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 07, 2013 at 05:58:11PM +0800, Josh Wu wrote:
> It is better to do the sanity check for the parameter before any hardware
> operation.
> 
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

Pushed to l2-mtd.git. I would squash it into the original patch, but
David has already taken it into his tree. I'll leave it up to him, then.

Thanks,
Brian
