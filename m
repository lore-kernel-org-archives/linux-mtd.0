Received: from [64.170.22.142] (helo=mail.spewey.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Hn5m-0003NZ-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Jul 2001 14:53:22 +0100
Message-Id: <5.1.0.14.0.20010704082022.00a67538@mail.spewey.com>
Date: Wed, 04 Jul 2001 09:10:22 -0500
To: Bjorn Wesen <bjorn.wesen@axis.com>,
 MTD for Linux <linux-mtd@lists.infradead.org>
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: Re: On the "safe filesystem" and write() topic
Cc: Kyle Harris <kharris@nexus-tech.net>
In-Reply-To: <Pine.LNX.4.21.0107040109450.16799-100000@godzilla.axis.se>
References: <3B32645D.BF65C965@nexus-tech.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

Hi,

At 01:53 AM 7/4/2001 +0200, Bjorn Wesen wrote:

>I designed the JFFS specifications, log layout and GC method in the first
>place and me and Finn put a lot of thought into it while implementing so
>please consider some of these late night ramblings:

Definitely! Thoughts, discussions, suggestions most welcome and thank you 
for reading my ramblings!

>The initial requirement was that a small partition of configuration files
>(the /etc directory to be more specific) should be able to reside in flash
>and be completely safe from inconvenient power-outs or crashes.
>
>It is my opinion (of course) that JFFS solves this in a manner as good as
>possible given the standard Linux VFS API. This means that when you
>rewrite a configuration file, you write the new one to another file and do
>a rename over the old once you're ready.

Agreed. Of course as long as the config files are small and relatively few and
not changing that often. Your example of config files in /etc fits the
bill perfectly.


>  Technically JFFS is based on a
>log structure consisting of VFS operations, and this is the best you can
>do while not involving the application more than what standard VFS gives
>you. VFS operations are not "transactions" in the high-level sense though.

Agreed again.

>In our embedded products this is handled by a configuration handling
>daemon similar to linuxconf, which caches parameters and knows how to
>rewrite configuration files atomically (just like any other sane Unix
>program does it). There is no need for any transactional semantics for
>small configuration files.

This is surely the preferred way to do it for such files. As a matter of 
fact it is most preferred for small config files. I think that I need to 
explicitly mention it in one of my ramblings on my site ;)


>  We sell a lot of these products and I certainly
>disagree with Vipin's comment on his website that it's impossible to use
>JFFS in embedded products :)

Wait a minute! Where did I say that in context of config files. And if I 
did I need to go and correct it (so please send me an email).

I think I surely said it in context of JFFS (not JFFS2) loosing integrity 
(including files at random) during power fail tests and I stand behind 
those results till proven otherwise. Have you guys tested the JFFS fs under 
power fail? What version are you using and what were your results?


>  Log-files are not usually kept in flash and
>if they are they don't need anything more advanced than normal rotation
>and if a crash occurs, it's no big deal if the last line gets cut off
>completely or in the middle...

Again agreed. Log files being of the course the "append" type, and a simple 
scan of the log file on startup will enable one to detect and remove this 
last half written offending line.



>It is difficult (if not impossible) in any consistant way to handle the
>case with random write()'s inside an already existing file. The filesystem
>needs to "roll back" to any pre-existing state but it then needs to
>know what the desired state would be. What we do now is make sure the
>filsystem itself is never corrupt even if a file was under writing.


JFFS2 does that (not getting corrupt) under random power fail. JFFS 
attempts to do that, but there is a bug in the latest version in CVS that 
causes files to disappear at random in power fail testing. This happened 
anywhere after 600+ to 1300+ power fails. I've mentioned this specifically 
in my "JFFS: A Practical guide" on my site.
It's quite possible that *I* introduced this bug myself when I was mucking 
around with JFFS trying to fix other problems. But considering the fact 
that when I started testing JFFS, it would never last more than 10 power 
cycles without a failed mount on power up, and other issues like leaking 
memory to the point that the kernel panicked (again on mount after a power 
fail)- to the point when I left it with my patches, that I get at least 
600+ (and once 1300+) async power fails without any problem, which version 
would you rather go with? With the maturing of JFFS2, IMHO folks should be 
encouraged to migrate to JFFS2 if possible (I am). Is there anything that 
JFFS gives you that you don't get with JFFS2?


>The problems arise from the vague definition of what the desired state
>would be - is it the data before the last write(), and what happens if you
>receive a signal ?

Isn't it the same case as what happens when you get a power fail? (please 
pardon my lack of understanding of signals in kernels. Can the execution 
that was interrupted with a signal ever resume at the interrupted point?)

>  Writes to mmap'ed pages can't use that mechanism, and
>you'll be stuck with using write()'s when you really probably want to use
>libc wrappers like fwrite and fprintf.

That's true, but it's a tradeoff: If the task wants reliable writes to the 
fs, it must not use any lib calls. As a matter of fact, that's the last 
thing you want to use anyway as these wrappers buffer the programs writes, 
defeating the purpose of the default mechanism of O_SYNC of the JFFS(2) fs.


>I agree that if you need a binary database which is big so that you cannot
>rewrite it when you update something, you'll need to rethink. Either just
>split the database in smaller files, or you'll need a transaction marker
>API down to the filesystem (an ioctl pair was suggested somewhere I
>think). I don't think trying to tweak write() would lead to anything
>generally useful though.

See, we agree on all the same points :)

The main issue here is not only a BIG database, but also one with a lot of 
points in it that are being updated frequently. Each file has an overhead 
(as well a max # of files limit on the fs). How reasonable is it to put 
5000, 8 byte files on a 1MB JFFS(2) fs? (this file would only occupy <50KB 
in a single (db) file) vs at least 5000*64(file overhead)+5000*8 = 360KB as 
separate files, assuming that you can even fit 5000 files on your partition.


>The kernel-level transactional extension would probably be quite difficult
>to get consistent also, because Linux VFS does not know about it yet (this
>is eventually changing with the integration of the general journalling
>layer I guess). I get a headache thinking about it, perhaps it's possible
>perhaps it's not; perhaps this code already exist in the other journalling
>filesystems, perhaps it does not.

I cannot speak intelligently about this so I'll keep my mouth shut :)


>With regards to Kyle's question below though, the answer is certainly that
>he can do as he says but use the rename() operation and keep them on a
>single partition. There is no need for anything more advanced..


For a lot of solutions, this is certainly true. OTOH, the current blocking 
times of JFFS2
(I didn't do this test on JFFS, but no reason to be different methinks) 
makes putting
any config or db directly on the fs unreasonable. (if you've been following 
my jitter tests recently, JFFS2 can block for 10's of seconds when it 
getting quite full).



>(All this assumes other more technical problems are solved of course like
>the nasty surprises we've had with some flashes getting bits halfway
>erased...)

This "filpping bits" syndrome (TM Vipin Malik :) is solved reliably for 
JFFS2. JFFS2 has passed 15K+ power fails without any failures that I could 
detect or was looking for. IMHO it cannot be solved reliably for JFFS 
because JFFS does not handle (or know about) erase sectors. I've solved it 
be re-reading the same sector 4 times. See big note above 
scan_for_partially_erased_sectors() (or something like that) in jffs/intrep.c


To a large extent, we've (I) have allowed the thought of having 
transactions in JFFS(2) lapse. Maybe this is not such a bad thing after all 
and with each discussion I better appreciate the cons of having 
transactions in the fs. Anyway, there is a new project that is being 
started on developing (or modifying an existing embedded db (mird)) to 
provide for this transaction level processing for embedded systems on 
JFFS(2). In addition to providing transactions it will also provide a 
caching layer that will allow the transaction log to be put on *another* 
non-volatile medium if such is available in your system. The big advantage 
of this will be 0 latency, transaction protected, power fail safe writes 
available to programs that use this interface. As a freebe it will also 
provide for key/value type store/retrieve from a (small) hash database.

Read more about it at:
http://www.embeddedlinuxworks.com/articles/db_project.html

To sign up for the development mailing list, go to:
http://www.embeddedlinuxworks.com/cgi-bin/signup/signup-dev.cgi

Thanks for reading and your thoughts.

Regards,

Vipin

http://www.EmbeddedLinuxWorks.com
