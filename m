Date: Sun, 7 Sep 2014 09:38:51 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Arnaud Ebalard <arno@natisbad.org>
Subject: Re: [PATCH 1/2] ARM: mvebu: Netgear RN104: Use Hardware BCH ECC
Message-ID: <20140907093851.377ddd29@free-electrons.com>
In-Reply-To: <920c7e7169dc6aaaa3eb4bced2336d38e77b8864.1410035142.git.arno@natisbad.org>
References: <cover.1410035142.git.arno@natisbad.org>
 <920c7e7169dc6aaaa3eb4bced2336d38e77b8864.1410035142.git.arno@natisbad.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, Ben Peddell <klightspeed@killerwolves.net>,
 Jason Cooper <jason@lakedaemon.net>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Russell King <linux@arm.linux.org.uk>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Arnaud Ebalard,

On Sat, 06 Sep 2014 22:49:25 +0200, Arnaud Ebalard wrote:

> Fixes: 0373a558bd79 ("ARM: mvebu: Enable NAND controller in ReadyNAS 104 .dts file")
> Depends-on: 5b3e507820c6 ("mtd: nand: pxa3xx: Use ECC strength and step size devicetree binding")

Maybe it's worth noting that it's not a build dependency: your commit
changing the Device Tree files can perfectly be applied without the
NAND ECC strength and step size bindings. Of course, it will have no
effect on an older kernel that doesn't support those bindings, but it
will not cause a build failure.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
