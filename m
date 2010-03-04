Received: from [74.213.171.136] (helo=hi.ry.ca)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NnJ7F-0008KL-5c
	for linux-mtd@lists.infradead.org; Thu, 04 Mar 2010 22:02:01 +0000
Received: from mail-yw0-f184.google.com (mail-yw0-f184.google.com
	[209.85.211.184]) by hi.ry.ca (Postfix) with ESMTPSA id 2718E170DC8
	for <linux-mtd@lists.infradead.org>;
	Thu,  4 Mar 2010 17:09:39 -0500 (EST)
Received: by ywh14 with SMTP id 14so1218054ywh.15
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 Mar 2010 14:01:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56a87efc1003041233o8c10a1fif541dc9efee6462c@mail.gmail.com>
References: <56a87efc1003041025n7d7f8d7ud740b259308fea7@mail.gmail.com>
	<D47DD163F8914C69B534C8AA8FF3258F@WINXP>
	<56a87efc1003041233o8c10a1fif541dc9efee6462c@mail.gmail.com>
Date: Thu, 4 Mar 2010 16:01:54 -0600
Message-ID: <56a87efc1003041401t4382d2i504b309a6c98d3d7@mail.gmail.com>
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

> On Thu, Mar 4, 2010 at 1:03 PM, massimo cirillo <maxcir@gmail.com> wrote:
>> As first attempt try to disable erase suspend feature in the flash
>> driver.

I have tried this against my 2.6.31 tree by uncommenting the following
in drivers/mtd/chips/cfi_cmdset_0001.c:40:

    #define CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE

Now my test output looks like the following. Note that it ran
successfully from 3% - 53%, which is right in the range where problems
tend to appear.

Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/mtd/modules         32128      1032     31096   3% /mnt
[... snip 3 - 52%, no errors ...]
/dev/mtd/modules         32128     16668     15460  52% /mnt
/dev/mtd/modules         32128     16912     15216  53% /mnt
Jan  1 00:17:27 rjt kernel: Newly-erased block contained word 0x0 at
offset 0x0022a030
/dev/mtd/modules         32128     17308     14820  54% /mnt
/dev/mtd/modules         32128     17572     14556  55% /mnt
/dev/mtd/modules         32128     17836     14292  56% /mnt
/dev/mtd/modules         32128     18100     14028  56% /mnt
/dev/mtd/modules         32128     18368     13760  57% /mnt
/dev/mtd/modules         32128     18604     13524  58% /mnt
Jan  1 00:18:40 rjt kernel: Newly-erased block contained word 0x0 at
offset 0x01b2a010
/dev/mtd/modules         32128     18992     13136  59% /mnt
/dev/mtd/modules         32128     19260     12868  60% /mnt
/dev/mtd/modules         32128     19524     12604  61% /mnt
/dev/mtd/modules         32128     19788     12340  62% /mnt
/dev/mtd/modules         32128     20052     12076  62% /mnt
/dev/mtd/modules         32128     20316     11812  63% /mnt
/dev/mtd/modules         32128     20552     11576  64% /mnt
Jan  1 00:20:04 rjt kernel: Newly-erased block contained word 0x0 at
offset 0x013ca034
/dev/mtd/modules         32128     20944     11184  65% /mnt
/dev/mtd/modules         32128     21208     10920  66% /mnt
/dev/mtd/modules         32128     21476     10652  67% /mnt
/dev/mtd/modules         32128     21740     10388  68% /mnt
/dev/mtd/modules         32128     22004     10124  68% /mnt
/dev/mtd/modules         32128     22244      9884  69% /mnt
/dev/mtd/modules         32128     22504      9624  70% /mnt
/dev/mtd/modules         32128     22764      9364  71% /mnt
/dev/mtd/modules         32128     23032      9096  72% /mnt
/dev/mtd/modules         32128     23296      8832  73% /mnt
/dev/mtd/modules         32128     23564      8564  73% /mnt
/dev/mtd/modules         32128     23828      8300  74% /mnt
/dev/mtd/modules         32128     24092      8036  75% /mnt
/dev/mtd/modules         32128     24328      7800  76% /mnt
Jan  1 00:22:48 rjt kernel: Newly-erased block contained word 0x0 at
offset 0x0052a004
/dev/mtd/modules         32128     24716      7412  77% /mnt
Jan  1 00:23:02 rjt kernel: Newly-erased block contained word 0x0 at
offset 0x003ea034
/dev/mtd/modules         32128     25116      7012  78% /mnt
Jan  1 00:23:42 rjt kernel: Newly-erased block contained word 0x0 at
offset 0x0006a028
/dev/mtd/modules         32128     25492      6636  79% /mnt
Jan  1 00:24:03 rjt kernel: Newly-erased block contained word 0x0 at
offset 0x01dc9fb8
Jan  1 00:24:12 rjt kernel: f0000000.flash: block erase error: (status timeout)
Jan  1 00:24:12 rjt kernel: Erase at 0x01da0000 failed immediately: errno -62
Jan  1 00:24:27 rjt kernel: Newly-erased block contained word 0x0 at
offset 0x01c6a004
Jan  1 00:24:36 rjt kernel: f0000000.flash: block erase error: (status timeout)
Jan  1 00:24:36 rjt kernel: Erase at 0x01c40000 failed immediately: errno -62
/dev/mtd/modules         32128     26268      5860  82% /mnt
/dev/mtd/modules         32128     26528      5600  83% /mnt
Jan  1 00:25:33 rjt kernel: Newly-erased block contained word 0x0 at
offset 0x017aa034
Jan  1 00:25:41 rjt kernel: f0000000.flash: block erase error: (status timeout)
Jan  1 00:25:41 rjt kernel: Erase at 0x01780000 failed immediately: errno -62
Jan  1 00:25:45 rjt kernel: Newly-erased block contained word 0x0 at
offset 0x0176a024
Jan  1 00:25:54 rjt kernel: f0000000.flash: block erase error: (status timeout)
Jan  1 00:25:54 rjt kernel: Erase at 0x01740000 failed immediately: errno -62
Jan  1 00:26:14 rjt kernel: Newly-erased block contained word 0x0 at
offset 0x0154a048
Jan  1 00:26:23 rjt kernel: f0000000.flash: block erase error: (status timeout)
Jan  1 00:26:23 rjt kernel: Erase at 0x01520000 failed immediately: errno -62
Jan  1 00:26:44 rjt kernel: Newly-erased block contained word 0x0 at
offset 0x0150a024
Jan  1 00:26:53 rjt kernel: f0000000.flash: block erase error: (status timeout)
Jan  1 00:26:53 rjt kernel: Erase at 0x014e0000 failed immediately: errno -62
Jan  1 00:27:18 rjt kernel: Newly-erased block contained word 0x0 at
offset 0x0140738c
Jan  1 00:27:27 rjt kernel: f0000000.flash: block erase error: (status timeout)
Jan  1 00:27:27 rjt kernel: Erase at 0x013e0000 failed immediately: errno -62
/dev/mtd/modules         32128     28076      4052  87% /mnt
Jan  1 00:28:10 rjt kernel: Newly-erased block contained word 0x0 at
offset 0x00f6a048
Jan  1 00:28:18 rjt kernel: f0000000.flash: block erase error: (status timeout)
Jan  1 00:28:18 rjt kernel: Erase at 0x00f40000 failed immediately: errno -62
/dev/mtd/modules         32128     28584      3544  89% /mnt
Jan  1 00:28:42 rjt kernel: Newly-erased block contained word 0x0 at
offset 0x00d2a040
Jan  1 00:28:51 rjt kernel: f0000000.flash: block erase error: (status timeout)
Jan  1 00:28:51 rjt kernel: Erase at 0x00d00000 failed immediately: errno -62
Jan  1 00:29:04 rjt kernel: Newly-erased block contained word 0x0 at
offset 0x00cca02c
Jan  1 00:29:12 rjt kernel: f0000000.flash: block erase error: (status timeout)
Jan  1 00:29:12 rjt kernel: Erase at 0x00ce0000 failed immediately: errno -62
Jan  1 00:29:42 rjt kernel: Newly-erased block contained word 0x0 at
offset 0x00aca038
Jan  1 00:29:51 rjt kernel: f0000000.flash: block erase error: (status timeout)
Jan  1 00:29:51 rjt kernel: Erase at 0x00aa0000 failed immediately: errno -62
Jan  1 00:30:02 rjt kernel: Newly-erased block contained word 0x0 at
offset 0x0096a010
Jan  1 00:30:11 rjt kernel: f0000000.flash: block erase error: (status timeout)
Jan  1 00:30:11 rjt kernel: Erase at 0x00940000 failed immediately: errno -62
/dev/mtd/modules         32128     29872      2256  93% /mnt

The errors continued until the filesystem actually reported 100% full
and my script terminated. The entire 3%-100% operation took about 21
minutes for <32MiB, and was definitely much slower towards the end
with all the errors.

- R
