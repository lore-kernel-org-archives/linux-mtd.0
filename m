Received: from mailbox.radixs.com ([203.81.41.217])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DXqxj-0002me-2R
	for linux-mtd@lists.infradead.org; Mon, 16 May 2005 21:33:36 -0400
From: Munira Ahmed <munira.ahmed@radixs.com>
To: Ralph Siemsen <ralphs@netwinder.org>
In-Reply-To: <42889844.60007@netwinder.org>
References: <1116211596.31694.17.camel@server11> <42889844.60007@netwinder.org>
Content-Type: text/plain
Date: Tue, 17 May 2005 09:33:37 +0800
Message-Id: <1116293617.31694.54.camel@server11>
Mime-Version: 1.0
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


what's wrong in posting the same question to two different lists?

I just wanted to be able to reach more people.

Thanks for your guidance. I will keep that in mind now on.


On Mon, 2005-05-16 at 08:55 -0400, Ralph Siemsen wrote:
> Please don't post the same message to multiple mailing lists.
> 
> Munira Ahmed wrote:
> > do_map_probe requires name of a driver to probe.
> > Now how do I know the names of mtd drivers to see if I have them or not
> > How do I find out which driver is currently active
> > is there any list of all or some driver names. 
> 
> The answer can be found easily by searching for calls to do_map_probe in 
> the kernel/drivers/mtd subdirectories.  For example in physmap.c:
> 
> 	static const char *rom_probe_types[] = {
> 		"cfi_probe", "jedec_probe", "map_rom", NULL
> 	};
> 	const char **type = rom_probe_types;
> 
> 	for(; !mymtd && *type; type++) {
>                  mymtd = do_map_probe(*type, &physmap_map);
>          }
> 
> So you can ee it is called with names like "cfi_probe" etc.  These 
> functions are defined drivers/mtd/chips directory.  So take a look at 
> the files in that directory to discover the names you seek.
> 
> -R
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
-- 
Munira Ahmed
