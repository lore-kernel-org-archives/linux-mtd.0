Received: from smtp1.cybersurf.net ([209.197.145.111])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 153KyC-0000R3-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 May 2001 18:01:49 +0100
Received: from localhost.localdomain ([209.197.132.58]) by
          smtp1.cybersurf.net (Netscape Messaging Server 4.15) with SMTP
          id GDWI5W00.89H for <linux-mtd@lists.infradead.org>; Fri, 25 May
          2001 11:05:56 -0600
From: Herman Oosthuysen <herman@wirelessnetworksinc.com>
To: "linux-mtd@lists.infrared.org" <linux-mtd@lists.infradead.org>
Subject: Re: Why timer interrupt is disabled?
Date: Fri, 25 May 2001 11:06:11 -0600
Content-Type: text/plain
References: <3B0EF62E.30207@niisi.msk.ru> <25506.990803856@redhat.com> <1765.990808662@redhat.com>
In-Reply-To: <1765.990808662@redhat.com>
MIME-Version: 1.0
Message-Id: <01052511093801.00873@localhost.localdomain>
Content-Transfer-Encoding: 8bit
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

On Fri, 25 May 2001, David Woodhouse wrote:
> The kernel is not preemptively scheduled. Unless the first process 
> explicitly calls schedule(), it's not going to lose the CPU. Only processes 
> in user mode are scheduled from the timer IRQ.

Is it not dangerous to assume that the kernel is non-preemptive?
MTD is after all most likely to be used in a real-time system, which may very
well have a different scheduler from the common/garden variety Linux.

Cheers,
-- 
Herman Oosthuysen
Phone: 403+569-5687
E-mail: Herman@WirelessNetworksInc.com
