Date: Wed, 21 Mar 2007 00:02:39 +0300
From: Igor Marnat <marny@rambler.ru>
Message-ID: <1014706625.20070321000239@rambler.ru>
To: linux-mtd-bounces@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: jffs2_gcd_mtd0 invoked oom-killer
In-Reply-To: <1174323006.13341.504.camel@localhost.localdomain>
References: <16125243125.20070312152801@rambler.ru>
	<1173705053.5493.28.camel@sauron> <41978953.20070319084552@rambler.ru>
	<1174288746.13341.490.camel@localhost.localdomain>
	<9323738734.20070319144832@rambler.ru>
	<1174323006.13341.504.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: Igor Marnat <marny@rambler.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Thomas,

TG>  Invalid Inode      node at 0x000253ec, totlen 0x00000130, #ino   1807, version 106033, isize 428154883, csize     4597, dsize     4597, offset 37875712
TG>  Invalid Inode      node at 0x00025a14, totlen 0x00000046, #ino   8620, version 470658, isize 1019416371, csize     3596, dsize     3596, offset  5997846
TG>  Invalid Inode      node at 0x00025e20, totlen 0x00000091, #ino   8620, version 470663, isize  5997941, csize 3438493594, dsize 4294927703, offset  5997864

TG> Interrestingly enough are the node CRCs of some of the nodes intact, so
TG> the corruption must have happened before writing to flash.

TG> Does the patch below help ?

Unfortunately no, it still crashes in the same way.

Should I attach any debug output or something?

-- 
Best regards,
Igor Marnat
mailto:marny@rambler.ru
