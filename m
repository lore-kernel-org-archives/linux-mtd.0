Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SjcBt-0007Ll-P7
 for linux-mtd@lists.infradead.org; Tue, 26 Jun 2012 20:16:51 +0000
Received: from beldin (unknown [IPv6:2a01:e35:2f37:a360:1036:e451:c7cd:ed7b])
 by smtp1-g21.free.fr (Postfix) with ESMTP id BE35094019C
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2012 22:16:41 +0200 (CEST)
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: linux-mtd@lists.infradead.org
Subject: Re: Linux 3.5-rc2 and ubifs as root
References: <87k3z616s4.fsf@free.fr>
Date: Tue, 26 Jun 2012 22:16:40 +0200
In-Reply-To: <87k3z616s4.fsf@free.fr> (Robert Jarzmik's message of "Sun, 17
 Jun 2012 14:07:07 +0200")
Message-ID: <87hatxzv4n.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Robert Jarzmik <robert.jarzmik@free.fr> writes:

> Hi all,
>
> I have my root partition on a UBIFS, on top on my docg3 MTD.
> With version 3.4, my kernel boots fine. With version 3.5-rc2, my kernel can't
> find the root partition.

OK, I found out, wrong manipulation on my part, the cmdline mtdparts on my
3.5-rc2 was corrupted ... I rechecked, and everything works as expected.

Cheers.

-- 
Robert
