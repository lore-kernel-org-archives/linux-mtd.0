From: David Woodhouse <dwmw2@infradead.org>
To: Wang JinFeng <wangjinfeng@gmail.com>
In-Reply-To: <a46577d50412131817139c1966@mail.gmail.com>
References: <a46577d50412131817139c1966@mail.gmail.com>
Content-Type: text/plain
Date: Tue, 21 Dec 2004 12:32:31 +0000
Message-Id: <1103632351.6111.67.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, uclinux-dev@uclinux.org
Subject: Re: Failed to implent MTD on uclinux(kernel version 2.4.20-uc0)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-12-14 at 10:17 +0800, Wang JinFeng wrote:
> ****Don`t know why this happen,somebody may give me some advice,thanks
> ****kernel version 2.4.20-uc0
> ****SoC:s3c4510b
> ****Flash chip:am29lv160DB

I'm led to believe that 2.4.20-uc0 on smdk2410 means a commercial port
which is of fairly low quality. You'd probably do better to use a 2.6
kernel instead. You may still need to do a little bit of work on it, but
at least you'll be working from a sane starting point.

-- 
dwmw2
