Received: from wproxy.gmail.com ([64.233.184.198])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1ChCzu-0004sp-QH
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2004 15:22:15 -0500
Received: by wproxy.gmail.com with SMTP id 37so10803wra
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Dec 2004 12:22:12 -0800 (PST)
Message-ID: <1f9886eb041222122244c01216@mail.gmail.com>
Date: Wed, 22 Dec 2004 14:22:11 -0600
From: xemc <xemcnet@gmail.com>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0412221522400.30689@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <JPEALJAFNGDDLOPNDIEEIEHDCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412171119290.8020@phoenix.infradead.org>
	<Pine.LNX.4.58.0412221328430.23254@phoenix.infradead.org>
	<20041222140331.GG31282@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412221442510.30556@phoenix.infradead.org>
	<20041222151403.GA8943@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412221522400.30689@phoenix.infradead.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
Reply-To: xemc <xemcnet@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> engel32r added, newer test is:
...

I added the adler32r test mentioned in a later post.
Now, I tried this on my ARM-based machine.  First, it crashed on me
(NULL pointer deref.).  Then I commented out the line "memcmp(&mem[0],
'\0', MEM_CHUNKS * sizeof(char *));",  and it worked.

Here's some of my results:
# insmod /lib/modules/2.6.8.1-oscar/kernel/lib/crc-ccitt.ko
# insmod /lib/modules/2.6.8.1-oscar/kernel/lib/libcrc32c.ko
# insmod ./crc_test.ko
[crctst] 16-bit CRC CCITT 32 bytes: ts1 0, ts2 0, delta 0
[crctst] 16-bit CRC CCITT 4096 bytes: ts1 0, ts2 0, delta 0
[crctst] 16-bit CRC CCITT 65536 bytes: ts1 0, ts2 0, delta 0
[crctst] crc32 32 bytes: ts1 0, ts2 0, delta 0
[crctst] crc32 4096 bytes: ts1 0, ts2 0, delta 0
...

Here's the get_cycles definition for arm: (include/asm-arm/timex.h)
static inline cycles_t get_cycles (void)  {
        return 0;
}
Well, _that_ helps.   =]

Mike
