Received: from fed1mtao01.cox.net ([68.6.19.244])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Si0m-0001n0-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 18:45:52 +0100
Subject: Re: Mounting JFFS2, Bootloader
From: Russ Dill <Russ.Dill@asu.edu>
To: Daniel Belz <danielb@cyclades.com.br>
Cc: Marius Groeger <mag@sysgo.de>, MTD <linux-mtd@lists.infradead.org>
In-Reply-To: <3D2DC576.7B87E64C@cyclades.com.br>
References: <Pine.LNX.4.40.0207121738590.7172-100000@mag.devdep.sysgo.de>
	<3D2DC576.7B87E64C@cyclades.com.br>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 11 Jul 2002 10:45:33 -0700
Message-Id: <1026409534.806.15.camel@russ>
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

On Thu, 2002-07-11 at 10:50, Daniel Belz wrote:
> Hi,
> Marius Groeger wrote:
> > 
> > On Thu, 11 Jul 2002, Daniel Belz wrote:
> > 
> > > PS.: I don't like to use the PPCBoot!!!
> > 
> > May I ask why? It sure would save you a lot of work... Anyway, if you don't
> > want to use PPCboot, you can always rip out and use it's JFFS support
> > routines.
> 
> I need somthing more simple, and I like to use the existent code for
> board init.
> I think to use the JFFS2 support from PPCB, but i can't separate the
> JFFS2 code
> from the boards support. And have the kernel parameters...

a number of bootloaders (including blob) already do this, assuming you
are using GPL, just grab that code, if you aren't using GPL? too bad
