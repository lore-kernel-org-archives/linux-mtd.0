Message-ID: <42889844.60007@netwinder.org>
Date: Mon, 16 May 2005 08:55:32 -0400
From: Ralph Siemsen <ralphs@netwinder.org>
MIME-Version: 1.0
To: Munira Ahmed <munira.ahmed@radixs.com>
References: <1116211596.31694.17.camel@server11>
In-Reply-To: <1116211596.31694.17.camel@server11>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: do_map_probe and driver name
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please don't post the same message to multiple mailing lists.

Munira Ahmed wrote:
> do_map_probe requires name of a driver to probe.
> Now how do I know the names of mtd drivers to see if I have them or not
> How do I find out which driver is currently active
> is there any list of all or some driver names. 

The answer can be found easily by searching for calls to do_map_probe in 
the kernel/drivers/mtd subdirectories.  For example in physmap.c:

	static const char *rom_probe_types[] = {
		"cfi_probe", "jedec_probe", "map_rom", NULL
	};
	const char **type = rom_probe_types;

	for(; !mymtd && *type; type++) {
                 mymtd = do_map_probe(*type, &physmap_map);
         }

So you can ee it is called with names like "cfi_probe" etc.  These 
functions are defined drivers/mtd/chips directory.  So take a look at 
the files in that directory to discover the names you seek.

-R
