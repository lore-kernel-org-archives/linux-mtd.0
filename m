Received: from linuxgrrls.org ([212.18.228.66] helo=mail.linuxgrrls.org)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CGxEQ-0001uk-9Z
	for linux-mtd@lists.infradead.org; Mon, 11 Oct 2004 06:16:43 -0400
Date: Mon, 11 Oct 2004 11:16:11 +0100 (BST)
From: jasmine@linuxgrrls.org
To: Esben Nielsen <ESN@vestas.com>
In-Reply-To: <98223556A08BA64E8C969246704EEE3B17FE85@aarexch01.vws.vestas.dom>
Message-ID: <Pine.LNX.4.60.0410111114030.13309@hex.linuxgrrls.org>
References: <98223556A08BA64E8C969246704EEE3B17FE85@aarexch01.vws.vestas.dom>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: Re: Booting from DOC Millenium
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Mon, 11 Oct 2004, Esben Nielsen wrote:

> 1)  Have a small bootsector and used a compressed kernel in the 1Mb NOR.

This is a common strategy.

> 2) Get a bootsector which can read the kernel from the filesystem on the 
>    DOC.  Is there any such bootsector anywhere?

GRUB can do this.  If you're on a non-Intel platform, there are other
bootloaders that could be persuaded to do this.

> 3) Go for a 3 stage boot: Have a small bootsector which boots a small, 
>    never changed Linux kernel from the 1Mb NOR. That small kernel does 
>    one thing: read out the real kernel from the DOC. Do anyone have 
>    experience with such a strategy?

LinuxBIOS does this.

> 4) Use a small Linux as a bootsector. Compile the initial hardware setup 
>    in before decompression and instead of starting initrd make something 
>    like "kexec" to start the real, runtime kernel. Has anyone been 
>    playing with this?

...that's functionally the same as (3) above.

> Having to have a seperate bootsector for Linux is not very good. We 
> otherwise use VxWorks here.

Grub et al. can boot VxWorks.

-J.
