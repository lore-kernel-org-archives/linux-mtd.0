Received: from dsl-64-129-131-125.telocity.com ([64.129.131.125] helo=cfowler.linuxiceberg.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17KpDS-0006yB-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2002 00:50:22 +0100
Subject: Re: Updating the root partition
From: Christopher Fowler <cfowler@outpostsentinel.com>
To: Russ Dill <Russ.Dill@asu.edu>
Cc: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>,
   Chris AtLee
	 <catlee@canada.com>,
   Linux MTD <linux-mtd@lists.infradead.org>
In-Reply-To: <1024529392.1205.9.camel@timmy>
References: <1024499892.9366.31.camel@geb>
	<20020620002303.A21586@wohnheim.fh-wedel.de> <1024526655.441.5.camel@timmy>
	<1024528965.13219.12.camel@devel>  <1024529392.1205.9.camel@timmy>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 19 Jun 2002 19:56:43 -0400
Message-Id: <1024531003.13219.15.camel@devel>
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

In a way.  On my system you have to restart to run on the new software. 
I have implemented a pseudo single user mode in init that will umount
the rootfs and then dump the new software into memory.  Ths keeps you
from having to do a restart.  However, this is not possible from remote
locations.  You must be on serial console to do this.  That is why
single user mode is not acceptable.

Chris

On Wed, 2002-06-19 at 19:29, Russ Dill wrote:
> On Wed, 2002-06-19 at 16:22, Christopher Fowler wrote:
> > Going into a pseudo single user mode to flash is not acceptable.  You
> > need to be able to flash from any tty.  From any web interface.  From
> > any command.  My unit will flash with a simple flash command while the
> > system is running.
> 
> right, you have a program that accepts a flash image, authenicates it,
> and copies it to a flash partition, once this is done, *then* you signal
> init.
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
