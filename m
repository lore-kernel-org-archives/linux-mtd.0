Received: from gateway.prograde.net ([66.92.163.78] helo=sol.prograde.net)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pke5i-00080F-Aj
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2011 14:53:55 +0000
Subject: Re: Numonyx NOR flash mutex problem when creating UBI volumes
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset=us-ascii
From: Michael Cashwell <mboards@prograde.net>
In-Reply-To: <4D493D95.6090005@keymile.com>
Date: Wed, 2 Feb 2011 09:54:39 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <43A4A174-AEE7-449B-9EAC-A7986BD3CA2C@prograde.net>
References: <4D493D95.6090005@keymile.com>
To: Stefan Bigler <stefan.bigler@keymile.com>
Cc: Holger brunck <holger.brunck@keymile.com>, linux-mtd@lists.infradead.org,
	Joakim Tjernlund <joakim.tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Feb 2, 2011, at 6:18 AM, Stefan Bigler wrote:

> To find the problem I added few printk in the cfi_cmdset_0001.c
> Adding a printk for erase suspend make the problem show always.

Interestingly, I've tended to see the problem also when doing UBI, but =
during writes, not formatting. And in my case adding printks to any =
relevant hot path tended to make the problem vanish.

> I expect a problem with the protection as discussed already in the =
thread Numonyx NOR and chip->mutex bug?

I believe I've found the issue. It was not a mutex bug as I originally =
thought though it was true that not dropping the chip mutex while =
waiting for lengthy commands to complete did mask the problem.

I was going to post my results later today anyway but as you are also =
struggling I'll endeavor to do this soon. I will also make the post as a =
follow-on to the message thread I originally started.

Just a few minutes, please.

-Mike Cashwell
