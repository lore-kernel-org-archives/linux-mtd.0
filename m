Received: from mail1.danielind.com ([12.19.96.6])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 159ovG-00016J-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 15:13:35 +0100
Message-ID: <3B262557.6B9EF53@daniel.com>
Date: Tue, 12 Jun 2001 09:21:11 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: Abraham vd Merwe <abraham@2d3d.co.za>
CC: Erik Mouw <J.A.K.Mouw@ITS.TUDelft.NL>,
 	MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: partitioning bug
References: <20010611142913.A30396@crystal.2d3d.co.za>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Abraham vd Merwe wrote:

> That's the problem, the addresses that do show up is useless:
>
> Same for System.map
>
> I can't get any references to calls in my module or the mtdpart module
> which
> is obviously where things go wrong ):

Compile the modules with EXTRA_CFLAGS =-g

Then recompile the kernel and reinstall the new modules.
Get another Oops, reboot (if your machine locked up), then reinstall
the modules in *exactly the same order* as the last time (but don't do the
oops step this time ;), then
run your saved ooops file through ksymoops, pointing it to /proc/ksyms, your
new module locations and
new System.map and new vmlinux files.


>
>
> I've even removed the static declarations in my module so that the
> functions
> can show up in /proc/ksyms but nothing. I don't think there's a bug in
> my
> module anyhow since it works perfectly without partiti

If it still does not work, then compile your MTD stuff into the kernel (not
as modules)
and get your oops that way.

System.map does not contain any info re. module symbols as modules are loaded
at run time and
System.map is created during compile.

Vipin
