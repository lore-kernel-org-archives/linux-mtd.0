From: Arnd Bergmann <arnd@arndb.de>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: cfi: don't warn about broken geometry for !CONFIG_MTD
Date: Mon, 30 Nov 2015 22:41:46 +0100
Message-ID: <14806491.ddHvmkgsQi@wuerfel>
In-Reply-To: <20151130205505.GN64635@google.com>
References: <3747078.dk5V5gxuXa@wuerfel> <7025557.qur2fOT79A@wuerfel>
 <20151130205505.GN64635@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 30 November 2015 12:55:05 Brian Norris wrote:
> 
> I guess no one includes mtd/cfi.h with CONFIG_MTD=n? Otherwise, we might
> have the same problems there.

Right, I checked that all users of that file depend on CONFIG_MTD.

> Pushed to l2-mtd.git, thanks!

Thanks,

	ARnd
