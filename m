Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EnBbw-0001RM-Ck
	for linux-mtd@lists.infradead.org; Fri, 16 Dec 2005 04:10:51 -0500
Message-ID: <43A2849E.8000907@mw-itcon.de>
Date: Fri, 16 Dec 2005 10:10:54 +0100
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: alfred hitch <alfred.hitch@gmail.com>
References: <43A1418F.3060701@imc-berlin.de>	<20051215102607.GA20431@angel.research.nokia.com>	<43A1609C.80705@imc-berlin.de>
	<43A166C6.5060803@mw-itcon.de>
	<29f916510512151816v59b1f584h346a415b3888728@mail.gmail.com>
In-Reply-To: <29f916510512151816v59b1f584h346a415b3888728@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Steven Scholz <steven.scholz@imc-berlin.de>, linux-mtd@lists.infradead.org
Subject: Re: Do I have to umount JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

alfred hitch wrote:
> Hi Steven, Peter,
> 
> I would like to put in some problems we are also facing. I had
> reported it sometime back here also.
> 
> On our system, we are observing that files on flash (jffs2 intel cfi nand)
> are getting corrupted, after  a number of resets and say 3 months of usage)
> 
> Anyone seen anything like this ? any clues on how one can look into this.
> 

Hi Alfred,
I have had no non recoverable error here up to now, but I am not 
representative, since I do not need many permanent writes: I have all 
permanently changeable informations like configuration files in one rw 
partition, and all temporary information like log, lock, pidfiles... in 
the ramdisk. My rootfs stays ro. In my case, I can simply erase the 
"config-partition", and the board definitely is clean.

I have 2 ideas to your problems:
1. Single files can be still corrupted, when you write them and press reset.
2. Your jffs2 version is from a let's say "not so good time"

What I do not understand (from one of your previous posts): You said, a 
command file was damaged. Was this file written at generation time of 
the fs, and then not written any more?

Best regards
Peter

-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
