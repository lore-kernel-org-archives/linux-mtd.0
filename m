Received: from an-out-0708.google.com ([209.85.132.247])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J7kyD-0001f8-HF
	for linux-mtd@lists.infradead.org; Thu, 27 Dec 2007 05:07:56 +0000
Received: by an-out-0708.google.com with SMTP id c3so481693ana.99
	for <linux-mtd@lists.infradead.org>;
	Wed, 26 Dec 2007 21:07:46 -0800 (PST)
Date: Wed, 26 Dec 2007 23:07:42 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: Mount MTD device on host PC
Message-ID: <20071226230742.05817ad6@vader.jdub.homelinux.org>
In-Reply-To: <876668.82641.qm@web32801.mail.mud.yahoo.com>
References: <876668.82641.qm@web32801.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 26 Dec 2007 20:09:40 -0800 (PST)
Naveen Sattigeri <naveen_j_s@yahoo.com> wrote:

> Sir/Madam,
> 
> I'm facing some problem while trying to mount a
> compact flash as a MTD device on my host/development
> PC. I would be glad if anyone could help.
> 
> The setup which I'm using in the lab is as follows:
> [1]. Host PC with RedHat 9.0 and MontaVista 4.0.
> [2]. Target Compact Flash is Pretec make (128MB). 
> 
> What I want to achieve:
> [1]. When I connect the target flash to the host PC
> (to the IDE Slot), I want the target flash to be
> detected by the host PC as a MTD device, so that I can
> mount a JFFS2/EXT3 filesystem in it.
>  
> What I have done so far to achieve this:
> [1]. I have built/compiled a customised kernel in the
> Host PC.
> [2]. MTD support has been enabled in the Host PC
> (using command menuconfig).
> 
> My observations so far:
> [1]. When the target flash is connected to the Host
> PC, the Host PC detects it as a "hdd" device and not a
> "mtd" device.

That's because Compact flash doesn't export the raw flash chips.

> 
> My Query:
> [1]. What steps do I need to perform to ensure that
> the Host PC detects the target flash as a MTD device,
> when connected to it over IDE Slot (using FRC cable).

You can't.  Buy a different type of flash if you want to use MTD.
Otherwise, you have to use block2mtd or some other abstraction layer to
make the IDE device presented by CF appear as an MTD.

josh
