Date: Thu, 23 Dec 2004 17:20:54 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20041223145115.GA14940@synertronixx3>
Message-ID: <Pine.LNX.4.58.0412231717520.4006@phoenix.infradead.org>
References: <20041223145115.GA14940@synertronixx3>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: actual mtd snapshot and jffs3 questions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 23 Dec 2004, Konstantin Kletschke wrote:

> Hi People!
> 
> Today I tried out the actual mtd cvs including jffs2 and jffs3.
> Generally jffs2 works. 
> I switchied compiling of jffs3 on also to test it
> but in jffs3.h are #ifdefs in the lines 296 and
> 310 which I had to comment out.
> 
> #if defined CONFIG_JFFS3_FS_NAND || defined CONFIG_JFFS3_FS_NOR_ECC
> 
> Indeed I have no CONFIG_JFFS3_FS_NAND nor CONFIG_JFFS3_FS_NOR_ECC but
> the code required the members of the struct and compiled fine then.
That are bugs introduced by newly added summary patch. Hope Ferenc will 
fix (may be after holydays).

> 
> Another thing is:
> 
> make -C util
> make: Entering directory `/usr/src/mtd/util'
> gcc -I../include -O2 -Wall -g -c -o sumtool.o sumtool.c -g
> -Wp,-MD,.sumtool.c.dep
> sumtool.c:45:24: jffs3-user.h: No such file or directory
> 
> which is right, no such file :) Forgot cvs add?
Seems yes...

> 
> How do I use jffs3? With a normal jffs2 filesystem created by actual
> mkfs.jffs2?
> I found no mkfs.jffs3 so I tried setting rootfstype=jffs2 to
> rootfstype=jffs3 and booted:
> 
> [JFFS3] Magic bitmask 0x1985 not found at 0x000000: 0x00b0 instead
> [JFFS3] Magic bitmask 0x1985 not found at 0x000004: 0x00b0 instead
> [JFFS3] Magic bitmask 0x1985 not found at 0x000008: 0x00b0 instead
> [JFFS3] Magic bitmask 0x1985 not found at 0x00000c: 0x00b0 instead
> [JFFS3] Magic bitmask 0x1985 not found at 0x000010: 0x00b0 instead
> [JFFS3] Magic bitmask 0x1985 not found at 0x000014: 0x00b0 instead
> [JFFS3] Magic bitmask 0x1985 not found at 0x000018: 0x00b0 instead
> [JFFS3] Magic bitmask 0x1985 not found at 0x00001c: 0x00b0 instead
> [JFFS3] Magic bitmask 0x1985 not found at 0x000020: 0x00b0 instead
> [JFFS3] Magic bitmask 0x1985 not found at 0x000024: 0x00b0 instead
> [JFFS3] Further such events for this erase block will not be printed
> .
> .
> .
> [JFFS3] Cowardly refusing to erase blocks on filesystem with no valid
> JFFS3 nodes
> [JFFS3] Empty blocks 90, bad blocks 0, total blocks 118                          
Strange. Will see. JFFS3 should mount JFFS2 images perfectly.

> VFS: Cannot open root device "mtdblock3" or unknown-block(31,3)
> Please append a correct "root=" boot option                    
> Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(31,3)
> 
> 
> Regards, Konsti
> 
> -- 
> GPG KeyID EF62FCEF
> Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
