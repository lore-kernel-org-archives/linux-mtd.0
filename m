Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1812pC-00052t-00
	for <linux-mtd@lists.infradead.org>; Mon, 14 Oct 2002 11:51:50 +0100
Message-Id: <200210141051.g9EApbs20276@dagobert.svc.sysgo.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rkaiser@sysgo.de
To: Frank Neuber <neuber@convergence.de>
Subject: Re: Virtual MTD-Device
Date: Mon, 14 Oct 2002 12:57:48 +0200
References: <20021014092738.GA21251@jupiter>
In-Reply-To: <20021014092738.GA21251@jupiter>
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Tach auch,

Am Montag, 14. Oktober 2002 11:27 schrieben Sie:
> So it is possible that one board has a 4MB flash and a 8MB flash bank
> with different size of sectors. Also the flash is not linear mapped. I
> will say there are holes between the 4MB and the 8MB chips.
> What I wish to do is to use this flash as one virtual MTD so that I can
> place a filesystem on both chips.
> I'm looking for things like LVM or Softraid what only support striping
> in the MTD-Driver. Also it should be simple enough that the bootloader
> can handle this.
> Has anyone thought about this problem, maybe there is a ready to run
> solution :-))

Yep. Have a look at the MTD concat layer (mtdconcat.c). See the map drivers 
for the DIL/NetPC (dilnetpc.c) and the SC520 CDP (sc520cdp.c) for examples on 
how to use this layer. On these two reference platforms, the chips that are 
being concatenated happen to have uniform sector sizes, but I did test this 
stuff in at least one configuration with varying sector sizes. So, this 
_should_ work out ot the box.

Rob


----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO AG
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
