Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BhxRA-00010B-5M
	for linux-mtd@lists.infradead.org; Tue, 06 Jul 2004 17:25:13 -0400
Date: Tue, 6 Jul 2004 17:20:46 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: Marius Groeger <mgroeger@sysgo.com>
In-Reply-To: <Pine.LNX.4.56.0407051001290.1879@mag.sysgo.com>
Message-ID: <Pine.LNX.4.60.0407061710540.21848@localhost.localdomain>
References: <20040702160247.55F4BC109F@atlas.denx.de>
	<Pine.LNX.4.56.0407051001290.1879@mag.sysgo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: Re: adding cmd-line partitioning to rpxlite.c 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 5 Jul 2004, Marius Groeger wrote:

> On Fri, 2 Jul 2004, Wolfgang Denk wrote:
>
>> In message <Pine.LNX.4.56.0407021650140.8560@mag.sysgo.com> you wrote:
>>>
>>>>>>          lubbock_maps[flashboot^1].name = "Lubbock Application Flash";
>>>>>>          lubbock_maps[flashboot].name = "Lubbock Boot ROM";
>> ...
>>> spaced into it (YMMV). Still, I also like reusing things, and maybe it
>>> would be a good thing to add code that replaces the embedded spaces
>>> with underscores?
>>
>> Better use shorter names. Wast^H^H^H^H Using  41  characters  of  the
>> kernel command line for the MTD id's alone is IMHO not a good idea.
>
> Probably. Still, the current implementation is misleading and should
> be resolved. Things were easier if command line partitioning was
> default for all maps, and not something to add in later on demand.

   not that this needs to be beaten any more than i've already beaten 
it (well, ok, yes it does), but at the moment, some of the files in 
drivers/mtd/maps that allegedly have command-line partitioning support 
just seem, well, broken.  (although, with my track record, i probably 
just misunderstood something.)

   consider, for example, ceiva.c.  this file allegedly supports 
cmdline partitioning, but i don't see how it could possibly work.  in 
the routine clps_setup_mtd(), the required space for multiple map_info 
structs is allocated with kmalloc() and then each of them is given the 
value: map->name="clps flash".

   assuming that the map name is used later for the <mtd-id> value for 
the partitioning (boy, i hope i got that right), the name not only has 
an embedded space, but every map_info struct will have the identical 
name value, which makes the partitioning a bit difficult, no?

   OTOH, consider tqm8xxl.c, which also loops through the number of 
flash banks but assigns each bank a unique name with:

sprintf(map_banks[idx]->name, "TQM8xxL%d", idx);

so even though that file doesn't even try to do command-line 
partitioning, at least it's set up to be added easily in the future.

   thoughts?  what have i misread this time?

rday
