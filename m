Received: from protonic.xs4all.nl ([213.84.116.84] helo=protonic.prtnl)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ECAj6-0007PL-CR
	for linux-mtd@lists.infradead.org; Mon, 05 Sep 2005 02:45:14 -0400
Received: from localhost (localhost [127.0.0.1])
	by protonic.prtnl (Postfix) with ESMTP id 2AB52533F
	for <linux-mtd@lists.infradead.org>;
	Mon,  5 Sep 2005 08:45:09 +0200 (CEST)
Received: from protonic.prtnl ([127.0.0.1])
	by localhost (protonic [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 22427-09 for <linux-mtd@lists.infradead.org>;
	Mon,  5 Sep 2005 08:45:08 +0200 (CEST)
Received: from linux.local (linux.prtnl [192.168.1.97])
	by protonic.prtnl (Postfix) with ESMTP id C8E56533C
	for <linux-mtd@lists.infradead.org>;
	Mon,  5 Sep 2005 08:45:08 +0200 (CEST)
From: David Jander <david.jander@protonic.nl>
To: linux-mtd@lists.infradead.org
Date: Mon, 5 Sep 2005 08:44:59 +0200
References: <1125888149.24477.32.camel@Vigor4>
In-Reply-To: <1125888149.24477.32.camel@Vigor4>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200509050845.00348.david.jander@protonic.nl>
Subject: Re: Mounting large JFFS2 causes other process to stop running!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 05 September 2005 04:42, Benny Chen wrote:
> Hi there,
> I have this problem, where when I mount a large JFFS2 partition (5M),
> nothing else seems to be running.  The jffs2 routines seems to have the
> processor all for itself.

What version of mtd/kernel are you using and on what hardware?

> I am aware that JFFS2 takes a long time to mount large partitions. But
> to have no process running during the mount duration is a little funny.

This sounds indeed funny.... almost tragic.
I have seen several minute-long stalls due to either mounting or GC, but all 
processes that are not dependant on that partition keep running nicely.
The only processes that suffer from such a thing are those that want to access 
the partition immediately, so mounting the root partition in rw-mode for 
example, is something to avoid because any given day GC can kick in right 
after mount, and then booting up can take veeery looong.

Greetings,

-- 
David Jander
Protonic Holland.
