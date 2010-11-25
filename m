Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PLeT6-0000Ii-1t
	for linux-mtd@lists.infradead.org; Thu, 25 Nov 2010 16:14:44 +0000
Message-ID: <4CEE8B70.4070500@suse.cz>
Date: Thu, 25 Nov 2010 17:14:40 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Unused config options in drivers/mtd (Re: running my kernel scanning
	scripts on your favourite part of the tree)
References: <alpine.DEB.2.00.1011090711410.5783@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.00.1011090711410.5783@localhost6.localdomain6>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

CC the mtd maintainer and mailinglist and adjusted subject. Robert, you
should report such bugs to the maintainer / author of the code in
question, otherwise your mail might end up unnoticed on LKML.

Michal

On 9.11.2010 13:16, Robert P. J. Day wrote:
> 
>   not sure when i'll get the time to do another pass over the kernel
> source tree with my kernel cleanup scripts but anyone who's
> interested is welcome to download the scripts from here:
> 
>   http://www.crashcourse.ca/wiki/index.php/Kernel_cleanup_scripts
> 
> to check out whatever part of the tree they want.
> 
>   as a simple example, i can run the script to find "badref" config
> variables on, say, the drivers/mtd part of the tree:
> 
> $ ../s/find_badref_configs.sh drivers/mtd
>>>>>> MTD_SUPERH_RESERVE
> drivers/mtd/maps/solutionengine.c:38:#ifdef CONFIG_MTD_SUPERH_RESERVE
> drivers/mtd/maps/solutionengine.c:44:		.size = CONFIG_MTD_SUPERH_RESERVE,
> drivers/mtd/maps/solutionengine.c:54:#endif /* CONFIG_MTD_SUPERH_RESERVE */
> drivers/mtd/maps/solutionengine.c:97:#ifdef CONFIG_MTD_SUPERH_RESERVE
> drivers/mtd/maps/solutionengine.c:100:		       CONFIG_MTD_SUPERH_RESERVE);
> drivers/mtd/maps/solutionengine.c:104:#endif /* CONFIG_MTD_SUPERH_RESERVE */
> $
> 
>   that tells me that, under drivers/mtd, there's some file that
> insists on testing CONFIG_MTD_SUPERH_RESERVE even though no Kconfig
> file defines such a variable.
> 
>   the other common check is to look for the exact opposite --
> variables defined in a Kconfig file that are never tested anywhere.
> once again, let's pick on drivers/mtd:
> 
> $ ../s/find_unused_configs.sh drivers/mtd
> ===== MTD_NAND_ATMEL_ECC_SOFT
> drivers/mtd/nand/Kconfig:375:config MTD_NAND_ATMEL_ECC_SOFT
> $
> 
>   that should be self-explanatory.  anyway, have at it if it interests
> you.
> 
> rday
> 
> 
