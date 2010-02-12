Subject: Re: [PATCHv2] MTD: Add UBI reboot notifier
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
In-Reply-To: <4B755B72.9060805@aimvalley.nl>
References: <1244550775.5847.385.camel@localhost.localdomain>
	<f5be75d5abc1acd236bedf36c55a860e@localhost>
	<1265980392.29027.12.camel@localhost> <4B755B72.9060805@aimvalley.nl>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 12 Feb 2010 17:21:00 +0200
Message-ID: <1265988060.30922.35.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-02-12 at 14:45 +0100, Norbert van Bolhuis wrote:
> Artem Bityutskiy wrote:
> > FYI, I do not like this patch, because it is not solving the problem, it
> > just makes the problem less likely. I.e., you are still screwed if you
> > reboot while some other task is doing erasure. Indeed, the background
> > thread is not the only task which may do erases.
> > 
> > I'm not going to revert this patch, but wanted to let you know that I
> > think it was my mistake to push it.
> > 
> 
> so, how to solve this properly ?
> 
> probably the only way is the reboot notifier of the MTD chip driver
> (for NOR flash only cmdset_0001 has one).

Well. UBI itself does not have problems with half-erased eraseblocks. As
the comment to the patch says, this is for a strange platform where the
boot loader panics when it encounters a half-erased EB.

So the most proper fix is to fix the boot-loader. Remember, a power cut
can introduce half-erased EBs, and you cannot address this in SW.

For clean reboots, you would need to have a reboot notifier in the MTD
lever, not in UBI. This notifier should:

1. Finish the current erase operation.
2. Prevent further erase operations.

The UBI patch is not a good solution.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
