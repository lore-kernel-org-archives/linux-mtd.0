Date: Sat, 13 Sep 2014 23:36:24 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: gpmi: add proper raw access support
Message-ID: <20140913153622.GA10132@localhost.localdomain>
References: <1410339339-25561-1-git-send-email-boris.brezillon@free-electrons.com>
 <20140911120928.GA1585@localhost.localdomain>
 <20140911143616.3ebb025a@bbrezillon>
 <20140911142511.GA2543@localhost.localdomain>
 <20140911163847.5e2f85c7@bbrezillon>
 <20140912004550.GB26904@shldeISGChi005.sh.intel.com>
 <20140912143050.014ad4c3@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140912143050.014ad4c3@bbrezillon>
Cc: Mike Voytovich <mvoytovich@paypal.com>, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Roy Lee <roylee@paypal.com>, Huang Shijie <shijie.huang@intel.com>,
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

On Fri, Sep 12, 2014 at 02:30:50PM +0200, Boris BREZILLON wrote:
> On Fri, 12 Sep 2014 08:45:50 +0800
> 
> My bad, capabilities might not be the appropriate word in this context.
> I meant ECC algorithm strength, and that's exactly the purpose of
> nandbiterrs testsuite: insert bitflips in in-band data until the MTD
> layer complains about uncorrectable errors.
okay. 

> This test validates what's returned by ecc_strength file in sysfs
> (which in turn is specified by the NAND controller when initializing
> the NAND chip).
> 
> Doing this should not imply knowing the ECC algorithm in use in the
> NAND controller or the layout used to store data on NAND.
the difficulty is that the ECC parity area can be not byte aligned.

As I ever said, it is hard to implement the two hooks.

thanks
Huang Shijie
