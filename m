From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] mtd: orion-nand: fix build error with ARMv4
Date: Sat, 10 May 2014 00:24:02 +0200
Message-ID: <4160510.VJSlHZLhNz@wuerfel>
In-Reply-To: <20140509220915.GA391@arch.cereza>
References: <1399560433-1402630-1-git-send-email-arnd@arndb.de>
 <20140509212810.GF18257@obsidianresearch.com>
 <20140509220915.GA391@arch.cereza>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 09 May 2014 19:09:15 Ezequiel Garcia wrote:
> # time nanddump /dev/mtd5 -f /dev/null -q
> real    0m 5.82s
> user    0m 0.20s
> sys     0m 5.60s
> 
> Jason: Care to submit a proper patch?
> 
> On 08 May 04:56 PM, Arnd Bergmann wrote:
> > Ok, that is a noticeable difference. For scale, what is the size of that partition?
> 
> The board is Openblocks A6, running mainline.
> 
> # cat /proc/mtd 
> dev:    size   erasesize  name
> mtd0: 00090000 00004000 "uboot"
> mtd1: 00044000 00004000 "env"
> mtd2: 00024000 00004000 "test"
> mtd3: 00400000 00004000 "conf"
> mtd4: 01d20000 00004000 "linux"
> mtd5: 01dec000 00004000 "user"

Ok, so it takes 5.6 seconds in kernel mode to access 31MB, which comes down
to 5.60MB/s. That isn't very fast compared to the time the CPU should take
for those instructions, so I'm surprised it actually makes any difference
at all.

There isn't a usable slave DMA engine in Armada XP by chance?

	Arnd
