From: splee@plexio.com (Stephen Lee)
Date: 31 Mar 2003 07:24:54 -0800
Subject: mtd devices inaccessible
In-Reply-To: <3E885040.41874936@thales-e-transactions.com>
References: <3E885040.41874936@thales-e-transactions.com>
Message-ID: <1049124294.15393.190.camel@ralph.plexio.private>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, 2003-03-31 at 06:27, Eric DEJONC wrote:
> I'm sorry to ask so many question but,
> I hadn't made a clean, that's why I got a stange error, but now, I can't
> compile the new kernel:
> missing mtdlink.o
>         I had to modify the makefile of the drivers/mtd and remove the
> ifeq($below25),y) but I have a 2.5.6.2 kernel.
> 
If you haven't done so, copy .config somewhere safe, run "make
mrproper", copy .config back and then rerun "make menuconfig" and the
rest of the steps to compile the kernel.

Stephen
