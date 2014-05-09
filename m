Date: Fri, 9 May 2014 20:55:06 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] mtd: orion-nand: fix build error with ARMv4
Message-ID: <20140509235506.GA792@arch.cereza>
References: <1399560433-1402630-1-git-send-email-arnd@arndb.de>
 <20140509212810.GF18257@obsidianresearch.com>
 <20140509220915.GA391@arch.cereza> <4160510.VJSlHZLhNz@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4160510.VJSlHZLhNz@wuerfel>
Cc: Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10 May 12:24 AM, Arnd Bergmann wrote:
> On Friday 09 May 2014 19:09:15 Ezequiel Garcia wrote:
> > # time nanddump /dev/mtd5 -f /dev/null -q
> > real    0m 5.82s
> > user    0m 0.20s
> > sys     0m 5.60s
> > 
> > Jason: Care to submit a proper patch?
> > 
> > On 08 May 04:56 PM, Arnd Bergmann wrote:
> > > Ok, that is a noticeable difference. For scale, what is the size of that partition?
> > 
> > The board is Openblocks A6, running mainline.
> > 
> > # cat /proc/mtd 
> > dev:    size   erasesize  name
> > mtd0: 00090000 00004000 "uboot"
> > mtd1: 00044000 00004000 "env"
> > mtd2: 00024000 00004000 "test"
> > mtd3: 00400000 00004000 "conf"
> > mtd4: 01d20000 00004000 "linux"
> > mtd5: 01dec000 00004000 "user"
> 
> Ok, so it takes 5.6 seconds in kernel mode to access 31MB, which comes down
> to 5.60MB/s. That isn't very fast compared to the time the CPU should take
> for those instructions, so I'm surprised it actually makes any difference
> at all.
>
> There isn't a usable slave DMA engine in Armada XP by chance?
> 

The Openblocks A6 is a Kirkwood, not Armada XP.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
