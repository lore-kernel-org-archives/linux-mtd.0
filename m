Received: from tiger.actrix.co.nz ([203.96.26.135] helo=creative.actrix.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16vx42-0000vA-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2002 10:09:50 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: linux-mtd@lists.infradead.org, dmwm2@infradead.org
Subject: Possible JFFS2 bug
Date: Fri, 12 Apr 2002 20:21:08 +1200
References: <200204080906.47847.hxos@rz.fh-augsburg.de>
In-Reply-To: <200204080906.47847.hxos@rz.fh-augsburg.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020412090913.3DDE34059@creative.actrix.co.nz>
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

I'm not using JFFS2, but I happened to be reading the code in 2.4.18

In dir.c/jffs2_readdir()....

I notice that if the filldir returns <0 during the fill for "." and "..", the 
execution gotos out:. This bypasses the down() of the semaphore, however the 
semaphore still gets up()ed.

The up without a corresponding down was, I hunch, unintended.

Maybe someone using the code would like to take a look.


-- Charles
