Date: Tue, 30 Sep 2014 10:07:20 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 0/3] mtd: nand: gpmi: add proper raw access support
Message-ID: <20140930100720.45625804@bbrezillon>
In-Reply-To: <1411481256-29141-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1411481256-29141-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <shijie8@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Roy Lee <roylee@paypal.com>,
 Mike Voytovich <mvoytovich@paypal.com>,
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

Hi,

On Tue, 23 Sep 2014 16:07:33 +0200
Boris BREZILLON <boris.brezillon@free-electrons.com> wrote:

> Hello Huang, Brian,
> 
> This is just a new proposal to support raw accesses in a more standard way
> in the GPMI driver.
> This series has been tested on an imx28 board.
> 
> Any suggestions are welcome.

Brian, any chance you could take a look at this series and give your
opinion and/or suggest a new approach ?

Huang, did you have time to think about a better way to implement these
raw access functions ?

Best Regards,

Boris
-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
