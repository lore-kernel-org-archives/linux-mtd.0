Received: from web14702.mail.yahoo.com ([216.136.224.119])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dQ9I-0001Ub-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Feb 2002 06:22:41 +0000
Message-ID: <20020220063356.59191.qmail@web14702.mail.yahoo.com>
Date: Tue, 19 Feb 2002 22:33:56 -0800 (PST)
From: Michael Michael <memmel2@yahoo.com>
Subject: Slow jffs2 startup on DOM
To: linux-mtd@lists.infradead.org
In-Reply-To: <200202191424.g1JEOUk01211@uk-proclin7.altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Hello I'm using jffs2 on a DOM with the block device
driver. I find the startup times very slow. It seams
to me from reading the source that jffs2 may be
scanning every block with this driver. It takes about
3 min for the first mount. Is there anyway to fix this
?
Would it be  possible to add say a checkpoint such
that if the disk  is "clean" we proceed with normal
startup ?
I do write to the DOM but I can certianly ensure that
its clean except on sudden power downs.  I suspect
that a lot of people who write to the devices can
ensure that the writes are checkpointed so we don't
have to do a full scan.

Mike
 


__________________________________________________
Do You Yahoo!?
Yahoo! Sports - Coverage of the 2002 Olympic Games
http://sports.yahoo.com
