Received: from fed1mtao02.cox.net ([68.6.19.243])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17KouC-0006wQ-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2002 00:30:28 +0100
Subject: Re: Updating the root partition
From: Russ Dill <Russ.Dill@asu.edu>
To: Christopher Fowler <cfowler@outpostsentinel.com>
Cc: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>, Chris AtLee
	 <catlee@canada.com>, Linux MTD <linux-mtd@lists.infradead.org>
In-Reply-To: <1024528965.13219.12.camel@devel>
References: <1024499892.9366.31.camel@geb>
	<20020620002303.A21586@wohnheim.fh-wedel.de> <1024526655.441.5.camel@timmy>
	 <1024528965.13219.12.camel@devel>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 19 Jun 2002 16:29:52 -0700
Message-Id: <1024529392.1205.9.camel@timmy>
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

On Wed, 2002-06-19 at 16:22, Christopher Fowler wrote:
> Going into a pseudo single user mode to flash is not acceptable.  You
> need to be able to flash from any tty.  From any web interface.  From
> any command.  My unit will flash with a simple flash command while the
> system is running.

right, you have a program that accepts a flash image, authenicates it,
and copies it to a flash partition, once this is done, *then* you signal
init.
