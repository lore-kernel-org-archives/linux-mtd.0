Received: from fed1mtao01.cox.net ([68.6.19.244])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nEsv-0006CX-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 09:54:37 +0100
Subject: Re: DOC 2000 and GRUB
From: Russ Dill <Russ.Dill@asu.edu>
To: mateo@posta.star.si
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20020906060115.6A1663946@sitemail.everyone.net>
References: <20020906060115.6A1663946@sitemail.everyone.net>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 06 Sep 2002 01:54:36 -0700
Message-Id: <1031302476.763.2.camel@russ>
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

> I booted the system from the HD, loaded the GRUB firmware into
> the DOC and rebooted the system.
> 
> It found the DOC2000 and I got the grub> prompt (The HD was
> not connected!!!).
> 
> But when I connected the HD, I got (something like):
> DOC 2000 at ....
> Jumping to Grub
> 
> and then hangs.
> If I disconect the HD, I get the grub> prompt.
> 
> Questions:
> 1) How to boot Linux from HD?
>    - DO I remove the DOC, boot Linux and then insert DOC?
>    - Can I boot the LInux to grub> prompt, and then connect
>      the disk? (Dangerous!!)
> 2) I said I already copied everything on DOC. How can
>    I boot that kernel? I tried with 
>    grub> kernel (dc0,0)/myKernel root=/dev/nftla1
>    GRUB display message something about invalid disk (or something
>    like that).
> 3) Anything else I could try?
> 

k, the grub firmware takes up a specific amount of space, if you just
load the grub firmware without thinking about this, you'll likely
overwrite important parts of your nftl partition. So you need to figure
out how many sectors your firmware takes up, nftl_format just past that,
erase the now unused sectors, and then load your firmware
