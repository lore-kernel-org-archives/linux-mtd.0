Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 181LiA-0006h9-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2002 08:01:50 +0100
Date: Tue, 15 Oct 2002 09:01:37 +0200 (MEST)
From: Robert Kaiser <rob@sysgo.de>
To: Frank Neuber <neuber@convergence.de>
cc: linux-mtd@lists.infradead.org
Subject: Re: Virtual MTD-Device
In-Reply-To: <20021014152819.GA2482@jupiter>
Message-ID: <Pine.LNX.4.21.0210150858430.28027-100000@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Mon, 14 Oct 2002, Frank Neuber wrote:
> Additionally I will add the exact flash configuration to the kernel
> command line, so that I can use the same kernel for different flash
> placements on the target platform.

You probably have noticed this already, but just to to be sure: there is
support in MTD for specifying partitions via the commandline (cmdline.c).

Rob

----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO AG
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
