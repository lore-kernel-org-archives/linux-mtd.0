Received: from ppp68.spiderweb.com.au ([202.76.149.68] helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ZqzD-0006yM-00
	for <linux-mtd@lists.infradead.org>; Sun, 10 Feb 2002 10:13:34 +0000
Date: Sun, 10 Feb 2002 20:21:29 +1000 (EST)
From: David Woodhouse <dwmw2@infradead.org>
To: raja <mahadoc@rediffmail.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: GRUB and DOC
In-Reply-To: <20020210080219.17898.qmail@mailFA7.rediffmail.com>
Message-ID: <Pine.LNX.4.44.0202102015030.15542-100000@lapdancer.baythorne.internal>
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

On 10 Feb 2002, raja wrote:

> =0AHi,=0A=0A Thanks a lot for your explanation.=0AI've got a DOC which i am=
>  able to format using doc121.exb=0Aand am able to mount and read write on i=
> t.but unable to recognize it at the bootup.=0A =0A1. Is there any problem w=
> ith IPL ROM ?

Not with the IPL ROM - that's just the initial stub that your motherboard 
BIOS recognises as a BIOS extension, and which loads the actual int 13h 
emulation code from the flash.

It is possible that the M-Systems firmware isn't recognising the NFTL 
format on the DiskOnChip for some reason - it doesn't give any useful 
error messages when that happens, just silently fails to install itself.

>              =0A2. If I replace the firmware with GRUB will my DOC get reco=
> gnized at bootup ?=0A=0Ai am probing into these possibilities now and i wou=
> ld happy to get your suggestions on this issue.=0A=0A=0A=0A=0A

Yes, Grub should recognise the DoC at bootup if it's a DiskOnChip 2000 or 
you put in the relatively small amount of effort required to add 
Millennium support to Grub. And in the unlikely event that it _doesn't_ 
'just work' then you have the source and can hence find out why and fix 
it.


-- 
dwmw2
