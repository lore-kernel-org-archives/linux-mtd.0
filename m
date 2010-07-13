Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OYX4K-0000lp-U7
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 04:26:09 +0000
Subject: Re: error handling in replay_log_leb()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: twebb <taliaferro62@gmail.com>
In-Reply-To: <AANLkTik882oGTwZZZ31T7YjfyvCmETlZgisjS6teDCB1@mail.gmail.com>
References: <AANLkTik882oGTwZZZ31T7YjfyvCmETlZgisjS6teDCB1@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jul 2010 07:21:12 +0300
Message-ID: <1278994872.16634.119.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 2010-06-24 at 16:00 -0400, twebb wrote:
> In the replay.c/replay_log_leb(), is there any disadvantage to calling
> ubifs_recover_log_leb() regardless of whether need_recovery is true or
> not?

All the UBIFS recovery was written and tested for the unclean power cut
cases. We worked on SLC which is quite trustworthy and did not show
other types of corruptions so fat.

When UBIFS is cleanly unmounted, we update the UBIFS master node and
clean the "dirty" flag there. When UBIFS mounts, it checks the master
node, and if it is dirty, there was an unclean reboot, and the FS needs
recovery. Otherwise UBIFS was unmounted cleanly, and UBIFS assumes there
cannot be any issues, and if there are issues, they are not because of
unclean unmounts, and the current implementation does not deal with
them.

This is why UBIFS does not try to recover if !c->need_recovery - this
was just not needed, not implemented and not tested.

You are working with MLC and you may have issues even if there was a
clean ummount.

You can teach UBIFS handle corrupted empty space. However, the current
way is not appropriate for MLC. AFAIR, currently UBIFS assumes that
there may be a half-written UBIFS node at the end, but then there should
be only 0xFF bytes. In your case, you can have bit-flips in the empty
space, so some bytes will be 0xEF, etc.

I suggest you to introduce another function which checks the 0xFF space
and distinguish between 0xFFs + bitflips and total garbage. In the
former case you recover, in the latter - refuse mounting.

This should not be too difficult to implement.

>   I'm having an issue with ubifs dealing with a PEB with corrupt
> empty space and this condition is handled fine during a mount when
> need_recovery is true, but is not handled the same otherwise and
> results in a failed mount.  A patch with the proposed change is below.

This patch is not enough for your case anyway, because recovery will
fail in ubifs_recover_leb() (see is_last_write() usage).

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
