From: David Woodhouse <dwmw2@infradead.org>
To: Christopher Hoover <ch@murgatroid.com>
In-Reply-To: <20040925021907.D14A2A00043@mail.murgatroid.com>
References: <20040925021907.D14A2A00043@mail.murgatroid.com>
Content-Type: text/plain
Message-Id: <1096108415.31730.4411.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sat, 25 Sep 2004 11:33:36 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: RE: Supporting flash that is locked by default
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-09-24 at 19:18 -0700, Christopher Hoover wrote:
> Somone (either rmk or David -- I don't recall whom) didn't feel the unlock
> belonged in the mapping code and didn't want the patch.   It would be nice
> to come up with a solution that pleased everyone.

This locking scheme is daft. My original reaction was to hide it in the
mapping driver for such idiotic flashes, but they're more common now and
it really is a function of the flash not of the board. I suspect we
ought to add a quirk entry for these flashes, and automatically unlock
them on probe.

-- 
dwmw2
