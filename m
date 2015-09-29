Date: Tue, 29 Sep 2015 15:21:44 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-sunxi@googlegroups.com, Hans de Goede <hdegoede@redhat.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] mtd: nand: sunxi: cleanup
Message-ID: <20150929222144.GA143959@google.com>
References: <1442389597-30698-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442389597-30698-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 16, 2015 at 09:46:35AM +0200, Boris Brezillon wrote:
> Hello,
> 
> Those two patches aim at cleaning up the sunxi_nand driver by first adding
> some consistency in the macro definitions, and then factorizing the code
> duplicated code found in hw_ecc and hw_syndrome_ecc implementations.
> 
> Best Regards,
> 
> Boris

I believe this series no longer applies cleanly
