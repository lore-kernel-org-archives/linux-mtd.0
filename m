Received: from rdu162-229-047.nc.rr.com ([24.162.229.47] helo=gateway.house)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16AH7x-0003MX-00
	for <linux-mtd@lists.infradead.org>; Sat, 01 Dec 2001 20:52:49 +0000
Received: from gromit.house (gromit.house [192.168.1.133])
	by gateway.house (8.11.6/8.11.2) with ESMTP id fB1Kues19894
	for <linux-mtd@lists.infradead.org>; Sat, 1 Dec 2001 15:56:40 -0500
Subject: JFFS2, 2.4.16, CVS-mtd -- mount, free memory, then hang
From: Michael Rothwell <rothwell@holly-springs.nc.us>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 01 Dec 2001 16:04:48 -0500
Message-Id: <1007240688.4762.4.camel@gromit>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


For a change of pace, and maybe fewer filesystem corruptions and oopses,
I upgraded to 2.4.16 plus the mtd from today's cvs. I ran the patchin.sh
and copied the cvs jffs2 code into the kernel tree. It compiled file,
and boots. But once JFFS2 is finished complaining about empty blocks,
etc and the filesystem is mounted readonly, 224k of memory is freed,
then the machine hangs. Pressing <enter> produces newlines on the
console, but init is never run. There's no complaints, though -- just
nothing.

alt-sysrq-t shows that init is the current task.

call trace shows:
init
keventd
ksoftirq_CPU
kswapd
bdflush
kupdated
blkmtdd
mtdblockd
khubd

khubd appears to be the child of init, which seems strange.

-Michael
