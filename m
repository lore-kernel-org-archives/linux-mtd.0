Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvRJP-0002HH-FN
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 10:00:56 +0000
Received: by gyh20 with SMTP id 20so4233900gyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 03:00:53 -0700 (PDT)
Subject: Re: [RFC 0/5] fix data+OOB writes, add ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 22 Aug 2011 13:02:40 +0300
In-Reply-To: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314007366.2644.101.camel@sauron>
Mime-Version: 1.0
Cc: Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
	b35362@freescale.com, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, 2011-08-17 at 16:50 -0700, Brian Norris wrote:
> First off, these fixes are motivated by a number of things:
> 
> 1) Broken "noecc" writes; `nandwrite -n -o' does not work on my
>    hardware, at least, without these patches

I think Ivan complained about this at some point - he said he has images
with crafted ECC codes to test his BCH library, but he could not flash
them properly. So yes, this is worth fixing.

> Perhaps something should be done about the MTDFILEMODE ioctl, since it
> seems to cause some confusing overlap, at least to me. I see two
> different RAW modes:
> 
> * MTD_MODE_RAW, which belongs to the mode field in `struct
>   mtd_file_info'. It can be set by the ioctl MTDFILEMODE
> * MTD_OOB_RAW, which belongs to the mode field in `struct
>   mtd_oob_ops'. It is set indirectly by other operations.
> 
> Does MTD_MODE_RAW imply MTD_OOB_RAW when OOB operations are involved?

I would make sure these 2 set of macros have different prefixes.
Probably re-naming the internal ones is easier, but I'd anyway re-named
the external ones - indeed they are about access mode for a specific
file descriptor, so I'd use the "MTD_FILE_MODE_" prefix. But not sure,
you can invent something else. In any case, it is cleaner to have
different prefixes for different name-spaces.

> Does MTD_MODE_RAW imply that no ECC is applied to data?

Not sure, but judging from how it is used - no.

> Is the MTD file mode persistent?

It is stored in the file descriptor (file->private_data), so the
life-time of the mode is equivalent to the life-time for the file
descriptor, AFAICS.

>  If so, then it may conflict with a
> "per-operation" mode in our new MEMWRITEDATAOOB

Good point. Frankly, I find this stateful model with modes horrible. But
we have what we have. I guess we will need to carefully document which
ioctl's are affected by the MTD mode, and which are not (in the header
file which we expose to the user-space).

I think MEMWRITEDATAOOB should ignore the mode.

My quick look at the code suggests me that the RAW/NORMAL file modes is
about read/write operations - in normal mode we read/write from/to only
the main area, in raw mode we consider the main area and OOB as one
continuous region and read/write from/to this region.

And MEMWRITEDATAOOB is about accession only OOB, so the modes should not
affect it.

> Maybe the "something" to be done would just be some better
> documentation. Or something more drastic if there's an actual conflict.

To me it looks like (a) re-naming and (be) some more comments in the
header files is enough.

> Speaking of documentation, what is this supposed to mean (from struct
> nand_chip, in include/linux/mtd/nand.h)?

Sorry, do not know off the top of my head.

-- 
Best Regards,
Artem Bityutskiy
