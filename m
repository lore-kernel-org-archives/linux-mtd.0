Received: from ns2.suse.de ([195.135.220.15] helo=mx2.suse.de)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LNwXM-0000h9-Af
	for linux-mtd@lists.infradead.org; Fri, 16 Jan 2009 21:47:35 +0000
Received: from Relay1.suse.de (relay-ext.suse.de [195.135.221.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id CBFCA48579
	for <linux-mtd@lists.infradead.org>;
	Fri, 16 Jan 2009 22:47:29 +0100 (CET)
Message-ID: <49710071.3000504@suse.de>
Date: Fri, 16 Jan 2009 22:47:29 +0100
From: Stefan Seyfried <seife@suse.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: mkfs.jffs2 aborts with MALLOC_CHECK_=2 on x86_64
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

current mtd-utils' mkfs.jffs2 aborts on me:
seife@stoetzler:~> /dev/shm/mtd-utils/mkfs.jffs2 -L
mkfs.jffs2:
       lzo priority:80 disabled
      zlib priority:60 enabled
     rtime priority:50 enabled

seife@stoetzler:~> MALLOC_CHECK_=2 /dev/shm/mtd-utils/mkfs.jffs2 -U -b -e
131072 -p -r . -o /tmp/img.jffs2
Aborted

seife@stoetzler:~> MALLOC_CHECK_=1 /dev/shm/mtd-utils/mkfs.jffs2 -U -b -e
131072 -p -r . -o /tmp/img.jffs2
*** glibc detected *** /dev/shm/mtd-utils/mkfs.jffs2: free(): invalid pointer:
0x0000000000613870 ***

gdb shows:
Program received signal SIGABRT, Aborted.
0x00007ffff7681645 in raise () from /lib64/libc.so.6
(gdb) bt
#0  0x00007ffff7681645 in raise () from /lib64/libc.so.6
#1  0x00007ffff7682c33 in abort () from /lib64/libc.so.6
#2  0x00007ffff76c3140 in ?? () from /lib64/libc.so.6
#3  0x0000000000406a7b in jffs2_compress (
    data_in=0x61a298
"\n=0\n.s3e.de//var/tuxbox/config/zapit/$i\ndone\nd=\"0001\"
frequency=\"12721750\" inversion=\"2\" symbol_rate=\"22000000\"
fec_inner=\"5\" polarization=\"0\">\n\t\t</transponder>\n\t\t<transponder
id=\"0006\" onid=\"0085\" fr"..., cpage_out=0x7fffffffd780,
    datalen=0x7fffffffd78c, cdatalen=0x7fffffffd788) at compr.c:258
#4  0x00000000004040e7 in recursive_populate_directory (dir=0x617020) at
mkfs.jffs2.c:884
#5  0x00000000004038f9 in recursive_populate_directory (dir=0x613660) at
mkfs.jffs2.c:1410
#6  0x00000000004038f9 in recursive_populate_directory (dir=0x60c1d0) at
mkfs.jffs2.c:1410
#7  0x0000000000405151 in main (argc=10, argv=<value optimized out>) at
mkfs.jffs2.c:1430

I looked around and found out that it happens, when both enabled compressors
return -1 in compr.c line 246, and then the free in line 258 aborts.

doing

#define STREAM_END_SPACE 20

instead of the default of 12 in compr_zlib.c fixes it for me. However, I'm
neither shure if this has any bad side effects, nor _why_ it fixes it.
My host is 64bits (x86_64), maybe this is affecting the buffer sizes or
something like that.
Hope this is helpful.

Stefan

-- 
Stefan Seyfried
R&D Team Mobile Devices            |              "Any ideas, John?"
SUSE LINUX Products GmbH, Nürnberg | "Well, surrounding them's out."

This footer brought to you by insane German lawmakers:
SUSE Linux Products GmbH, GF: Markus Rex, HRB 16746 (AG Nürnberg)
