Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17T21l-0003g1-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Jul 2002 16:08:13 +0100
Date: Fri, 12 Jul 2002 17:08:13 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Frederic Gobry <frederic.gobry@smartdata.ch>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mmap question
Message-ID: <20020712150813.GA19718@wohnheim.fh-wedel.de>
References: <20020604132254.GA4911@rhin.smartdata.ch> <20020701131443.GA10227@rhin> <20020711161909.GA8143@rhin> <20020711191540.GA16466@wohnheim.fh-wedel.de> <20020712075715.GA9952@rhin>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20020712075715.GA9952@rhin>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Fri, 12 July 2002 09:57:16 +0200, Frederic Gobry wrote:
> The base code uses cfi_probe: it seemed to me the command set is
> determined and provided automatically, isn't it ?

Nyes, kind of. You configure the kernel to use one or more command
sets and the flash probing code picks the correct one out of those, if
present.

> I think it's more because I interfere with the "canonical" way MTD
> handles the flash: I access directly the memory after the erase or
> write operation (via mmap, *not* via a read system call), but from the
> code in do_read_onechip (cfi_cmdset_0001.c), it seems the flash is set
> to read mode not when the erase or write operation is finished, but
> before an actual read must be performed (which makes sense).

This helps performance a little, somewhere in the range of 5% for
large writes on the flashes I know. I have seen other code though,
that writes a sequence of 0xff 0x50 0xff into the flash before and
after every write operation, just to be sure the flash is in a sane
state. Slow, but effective.

> I can work around this for my program (I just tested, performing a
> simple read just after the write restores what is seen in the mmapped
> memory), but I still would like to know if the MTD API could be
> augmented in order to handle read-only memory mapped areas (when
> available) in a cleaner way as what I currently do?  I don't think
> this would imply lots of changes:
> 
>       - a flag indicating if the flash can be mmapped
> 
>       - the implementation  of mmap (which probably would  need a call
>         similar  to  'point'  but  with an  explicit  semantic  toward
>         mmapping.
> 
>       - possibly another  flag to indicate  that an area  is currently
>         mmapped, so that the erase / write operations set the flash in
>         read mode once they have finished their duty

BTW: Did you already try to mmap /dev/mtd* or /dev/mtdblock* ?

> PS : where can I send the beer and pizza ? :-)

>From Thursday on, I will be in Wedel, writing exams:
Joern Engel
Tinsdaler Weg 125
22880 Wedel
Germany

One possibility to order the pizza is Joeys:
http://www.joeys.de/joeys/65/index.htm

And if you actually do it, remember to cc David Woodhouse.

Jörn

-- 
"Translations are and will always be problematic. They inflict violence 
upon two languages." (translation from German)
