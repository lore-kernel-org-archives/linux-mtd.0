Received: from [74.213.171.136] (helo=hi.ry.ca)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NnbRy-0006OI-Ay
	for linux-mtd@lists.infradead.org; Fri, 05 Mar 2010 17:36:39 +0000
Received: from mail-yw0-f184.google.com (mail-yw0-f184.google.com
	[209.85.211.184]) by hi.ry.ca (Postfix) with ESMTPSA id E7AAA170B9A
	for <linux-mtd@lists.infradead.org>;
	Fri,  5 Mar 2010 12:44:17 -0500 (EST)
Received: by ywh14 with SMTP id 14so1678765ywh.15
	for <linux-mtd@lists.infradead.org>;
	Fri, 05 Mar 2010 09:36:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <62cbdcd91003050156g404106a5pfdf10bb29d9ce837@mail.gmail.com>
References: <56a87efc1003041025n7d7f8d7ud740b259308fea7@mail.gmail.com>
	<D47DD163F8914C69B534C8AA8FF3258F@WINXP>
	<56a87efc1003041233o8c10a1fif541dc9efee6462c@mail.gmail.com>
	<56a87efc1003041401t4382d2i504b309a6c98d3d7@mail.gmail.com>
	<62cbdcd91003050156g404106a5pfdf10bb29d9ce837@mail.gmail.com>
Date: Fri, 5 Mar 2010 11:36:32 -0600
Message-ID: <56a87efc1003050936j57e8d879q70855a5724fa3be9@mail.gmail.com>
Subject: Re: JFFS2 errors on ppc-4xx with CFI NOR flash
From: Ryan Thompson <i@ry.ca>
To: massimo cirillo <maxcir@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Massimo.CIRILLO@numonyx.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 5, 2010 at 3:56 AM, massimo cirillo <maxcir@gmail.com> wrote:
> I suppose you don't have CONFIG_MTD_XIP enabled.
> So in order to completely disable the suspend,
> please in chip_ready() function just after "case FL_ERASING:"
> (line 775) put the line "goto sleep;" and repeat your test.
> Let me know.

By skipping the FL_ERASING case as you suggested, my test now
completes successfully without any INFO-or-higher kernel messages.

However, it still takes a very long time. The initial files are
written out quickly (subjectively, performance seems similar to raw
mtd speed). However, after 50% or so, performance begins to degrade
dramatically. At 65%, a 256KiB file takes 11 sec to write. At 75%, 20
sec. 90%, 38 sec. 95%, 77 sec. 99%, 121 sec. The entire test took 28.4
minutes to go from 3%-100% on the ~32MiB partition.

Performance seems somewhat consistent with my previous result:

> 2010/3/4 Ryan Thompson <i@ry.ca>:
>> The errors continued until the filesystem actually reported 100% full
>> and my script terminated. The entire 3%-100% operation took about 21
>> minutes for <32MiB, and was definitely much slower towards the end
>> with all the errors.

I've done a flash_eraseall -j followed by a reboot before each run.

I also benchmarked the mtdblock performance without JFFS2 (also
getting input from urandom):

# time dd if=/dev/urandom of=/dev/mtdblock16
dd: writing '/dev/mtdblock16': No space left on device
64257+0 records in
64256+0 records out
Command exited with non-zero status 1
real	5m 30.17s
user	0m 0.08s
sys	1m 2.66s
# perl -le 'printf("bytes written = 0x%08x\n", 64256 * 512);'
bytes written = 0x01f60000
# grep modules /proc/mtd
mtd16: 01f60000 00020000 "modules"

- R
