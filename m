Date: Tue, 8 Feb 2005 19:23:26 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: anonymous <wanttoknowwhyandwhatfor@yahoo.com>
In-Reply-To: <20050208173925.96725.qmail@web90108.mail.scd.yahoo.com>
Message-ID: <Pine.LNX.4.58.0502081902060.20565@phoenix.infradead.org>
References: <20050208173925.96725.qmail@web90108.mail.scd.yahoo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: 2 Questions - with regards to  Linux 2.6
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 8 Feb 2005, anonymous wrote:
> 
> Hi Artem,
> 
> My mailer client  prevents me from posting to the list - could I ask you for a favor to answer few of my questions (I am new on Linux and its flash support) ? - I would highly appreciate your kindness to the person, who was born in the same beatiful city (St. Petersburg) you are living ...
I wonder what disaster doesn't allow you to post to the mailing list :-)
Well, I'll try to answer some questions. Hope others will 
supplement/correct me.

> 
> 1) NOR related question(s) 
> 
>  How commandline partition parsing is getting enabled (in .config ? ) on Linux 2.6 ?
I've never used NOR flashes. Just hints where to dig:

Documentation/kernel-parameters.txt - grep for mtdpart
drivers/mtd/cmdlinepart.c - here the cmdline is usually parsed
drivers/mtd/maps - the NOR registration/detecting etc stuff

>  How could I provide info for creating 3 partitions on single NOR flash on the commandline (is it possible in principle ?) 
> 
> What is the specific command line syntax to achieve the following effect:
> 
> Creating 3 MTD partitions on "phys_mapped_flash":
> 0x00000000-0x00080000 : "name 1"
> 0x00080000-0x00180000 : "name 2"
> 0x00180000-0x00380000 : "name 3"
drivers/mtd/cmdlinepart.c - see the header comment there, for example.

> 
>  2) NAND related question 
> 
>   Is there a generic driver on Linux 2.6 to support single partition on NAND flash ?

Well, the most generic driver is the default operations in nand_base.c.
Usually people write different drivers. Dig nand_base.c for most 
NAND-related stuff.

> 
>   What enabling of (each of)  the following Linux 2.6 .config options does ?
> 
> #
> # NAND Flash Device Drivers
> #
> CONFIG_MTD_NAND
Enable generic NAND support.

> CONFIG_MTD_NAND_VERIFY_WRITE 
Gets MTD layer to operate in write-check mode. this means that after each 
page write MTD will read this page agein and compare whether it was 
written correctly.
Usually useful on the development/debuggind stage, not in production.

> CONFIG_MTD_NAND_IDS=y
I assume this links the arrays of known NAND flash chips. Each NAND flash 
chip type has unique ID bytes, so MTD layer may auto-detect its 
geometry/etc automatically. I would suggest to use this. Dig the 
nand_ids.c.

> CONFIG_MTD_NAND_DISKONCHIP
Enable the DiskOnChip stuff. Don't use this if you have no.

> 
> Again - If you could kindly spend some of your pressures time and answer my questions and perhaps (optionally - on your discretion) post your answers on the list so other newbies could also benefit from your answers - I would appreciate it very much !
Not big help, but anyway...

> 
> Thanks,
> 
> Best Regards,
> 
> Alex (Sasha)

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
