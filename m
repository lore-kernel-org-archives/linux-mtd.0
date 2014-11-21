Date: Fri, 21 Nov 2014 09:19:28 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 0/4] mtd: nand: gpmi: add proper raw access support
Message-ID: <20141121011928.GB28861@shldeISGChi005.sh.intel.com>
References: <1413794777-32220-1-git-send-email-boris.brezillon@free-electrons.com>
 <20141120092336.GE3212@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20141120092336.GE3212@norris-Latitude-E6410>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Mike Voytovich <mvoytovich@paypal.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Roy Lee <roylee@paypal.com>,
 Huang Shijie <shijie8@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 20, 2014 at 01:23:36AM -0800, Brian Norris wrote:
> On Mon, Oct 20, 2014 at 10:46:13AM +0200, Boris Brezillon wrote:
> > This series provides an implementation for raw accesses taking care of
> > hidding the specific layout used by the GPMI controller.
> > 
> > I also updated the nand_ecc_ctrl struct documentation to clearly state that
> > specific layouts should be hidden when accessing the NAND chip in raw mode.
> 
> Can I get any ack's, tested-by's, or reviewed-by's?
> 
I will add my tested-by in the Boris's next release.

thanks
Huang Shijie
