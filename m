Date: Tue, 22 Sep 2015 09:52:06 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org, Priit
 Laes <plaes@plaes.org>, Hans de Goede <hdegoede@redhat.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: sunxi: fix sunxi_nand_chips_cleanup()
Message-ID: <20150922095206.4a4d85ea@bbrezillon>
In-Reply-To: <20150922001528.GL31505@google.com>
References: <1442160883-29011-1-git-send-email-boris.brezillon@free-electrons.com>
 <20150922001528.GL31505@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Mon, 21 Sep 2015 17:15:28 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Sun, Sep 13, 2015 at 06:14:43PM +0200, Boris Brezillon wrote:
> > The sunxi_nand_chips_cleanup() function is missing a call to list_del()
> > which generates a double free error.
> 
> And if you could manage to get past that...an infinite loop, no?

Right, feel free to add it in the commit message.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
