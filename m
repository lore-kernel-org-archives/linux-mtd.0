Subject: RE: sync() takes minutes while erasing
From: David Woodhouse <dwmw2@infradead.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <001901c7b9b6$81e76340$0e67a8c0@Jocke>
References: <001901c7b9b6$81e76340$0e67a8c0@Jocke>
Content-Type: text/plain
Date: Thu, 28 Jun 2007 20:02:42 +0100
Message-Id: <1183057362.1170.194.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: 'Linux MTD mailing list' <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-06-28 at 20:59 +0200, Joakim Tjernlund wrote:
> Thanks, this stop the complaints from the test team. They
> don't like to wait a few mins every time they delete an old install
> and reboot.

This is what the rest of us use 'flash_eraseall -j' for, btw :)

But I'll look into it. If we can do the erases from some other context
it would be nice. Although pdflush_operation() doesn't seem to give us
any way to _stop_ a pending call if we unmount.

-- 
dwmw2
