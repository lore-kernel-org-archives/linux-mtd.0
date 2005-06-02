Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Ddz9l-00079u-4U
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2005 19:31:24 -0400
Message-ID: <429F96C0.3080508@mvista.com>
Date: Thu, 02 Jun 2005 16:31:12 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: lists@ku-gbr.de
References: <20050601134130.GA19482@synertronixx3>
In-Reply-To: <20050601134130.GA19482@synertronixx3>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Intel flash that powers up locked
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Konstantin Kletschke wrote:
...
> However, this code Oopses in cfi_intelext_unlockall():
...
> Creating 5 MTD partitions on "scb9328_flash":             
> 0x00000000-0x00020000 : "U-boot"             
> 0x00020000-0x00040000 : "U-boot_env"
> mtd->numeraseregions 0              
> rumms                 
> Unable to handle kernel NULL pointer dereference at virtual address 00000008

I'll hazard a guess that you're calling the function passing the 
partition "slave" mtd structure instead of the "master" mtd structure 
created at chip probe time (since you're passing the partition creation 
stage instead of doing this at chip probe time).  See the mtdpart.c code 
for the mapping between the two kinds of structures, such as 
part_unlock(), which passes the master structure.  Only the master 
structure has various fields properly filled out, especially things 
determined by the chip driver, and numeraseregions doesn't seem to be 
copied from master to slave after a quick glance.

If that's a bad guess then sorry for the misdirection. ;)  Let us know 
how you are calling the unlock function to take some of the guesswork 
out of it.

-- 
Todd
