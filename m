Date: Wed, 31 Dec 2008 17:14:58 +0000 (GMT)
From: Artem Bityutskiy <dedekind@infradead.org>
To: Cal Page <pagcal@runbox.com>
Subject: Re: ubifs: partition won't mount: duplicate sqnum in replay ???
In-Reply-To: <495A6931.9030108@runbox.com>
Message-ID: <alpine.LFD.2.00.0812311700020.5058@casper.infradead.org>
References: <495A6931.9030108@runbox.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: ubifs <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Tue, 30 Dec 2008, Cal Page wrote:

> If /var/log is on the nand, and I do a (cd /var/log; tar -cvf 
> /someotherdevice.tar .) I notice ubifs_shrinker get called. nr is 128, and 
> clean_zn_cnt starts out at 1500 or so. But after tar has run a bit, 
> clean_zn_cnt bobbles around 400 or so. If I then kill the tar, and wait about 
> a minuite, clean_zn_cnt makes it back up to the 1500.

Do you have debugging checks disabled? Disable them, because otherwise
they will pull whole UBIFS index into RAM all the time. This is because
they check whole index for consistency all the time.

> Where is the code that recycles the memory?

Err, in shrinker.c.

There are several things related to UBIFS which take memory and may be
shrunk: TNC cache, dentry cache, inode cache, and page cache. Only the
TNC cache eviction is implemented by UBIFS. UBIFS just registers the
shrinker, and then the MM (memory management) kernel subsystem calls it
whenever it thinks some memory should be freed. The other stuff is
fully implemented in VFS/MM subsystems.

Sd, TNC was my guess. Most of the ram is usually taken by page cache 
(which caches file's data). But it have to be freed on memory pressure, 
and this mechanism should work well.

Note, each znode takes 256 bytes. You do not seem to have too many of 
them.

> Is it the per file system daemons 
> that get created on mount?

Usually what happens is that someone (anyone) allocates memory using
kmalloc/page_alloc/etc, and if the core MM system sees that there is no 
free memory, it starts producing it by freeing the page cache and other 
caches, calling registered shrinkers, etc.

> How can I change the memory hold timers in UBIFS 
> so it'll let go a lot earlier?

AFAIK, there are no timers. Things are freed when free ram is about to
end. All decisions are made by kernel memory management (mm) subsystem.
I do not much details about mm.

Artem.
