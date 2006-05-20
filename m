Received: from lilzmailso01.liwest.at ([212.33.55.23])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FhNHp-00061P-1K
	for linux-mtd@lists.infradead.org; Sat, 20 May 2006 04:58:27 -0400
Message-ID: <446ED4ED.80704@soft.uni-linz.ac.at>
Date: Sat, 20 May 2006 10:35:57 +0200
From: Simon Vogl <vogl@soft.uni-linz.ac.at>
MIME-Version: 1.0
To: Dan Merillat <harik.attar@gmail.com>
References: <E76D631A87C2874E895D1639A1CEDB962AF95B@aae-exchange.aaesys.com>	<1147822363.30771.10.camel@shinybook.infradead.org>
	<c0c067900605171450u3bbd5292sf61341527d5040e3@mail.gmail.com>
In-Reply-To: <c0c067900605171450u3bbd5292sf61341527d5040e3@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Jayasri Sangu <JayasriS@aaesys.com>
Subject: Re: Intel P30 flash support MTD 2.4.16 kernel
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dan,
Dan Merillat wrote:

>> > We are planning to change to P30 flash. Does 2.4.16 kernel supports
>> > this flash?
>> >
>> > If not what are my choices?
>>
>> 2.6.16.
>
>
> If it fails, turn on DEBUG_CFI_FEATURES in
> drivers/mtd/chips/cfi_cmdset_0001.c and check
> for Simultaneous Operations.  Some P30 versions erroniously set that
> bit and fail horribly as a result.   I spent a week trying to figure
> that out.


I found out this minute that this could apply to my pxa271 core (with 
on-chip p30 flash!)
as well - it reports the sim.op. bit, while the data sheet says no. 
Could you tell me what your
symptoms were, and your cure (a code snippet, preferrably)?

My jffs2  partition reports crc errors when mounting:
"
Node at 0x0001f9ec with length 0x0000093a would run over the end of the 
erase block
Perhaps the file system was created with the wrong erase 
size?                                                                
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001f9f0: 
0x093a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001f9f4: 
0x173d instead                                         
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001f9f8: 
0x0013 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001f9fc: 
0x0031 instead                                         
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001fa00: 
0x81ed instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001fa08: 
0x4dc4 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001fa1c: 
0x08f6 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001fa20: 
0x1000 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001fa24: 
0x0006 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001fa28: 
0x9190 instead
Further such events for this erase block will not be printed
jjffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020000: 
0xb80e instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020004: 
0x87f4 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020008: 
0x67d7 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002000c: 
0xb9d8 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020010: 
0xee1f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020014: 
0xf3a0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020018: 
0xbf12 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002001c: 
0x6f85 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020020: 
0xc933 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020024: 
0x6b75 instead
Further such events for this erase block will not be printed
Node at 0x0005fe90 with length 0x00000892 would run over the end of the 
erase block
Perhaps the file system was created with the wrong erase size?
"
.... up to the end of the partition,  followed by 
jffs2_build_inode_pass1 failures and tons of
crc errors (
JFFS2 error: (290) jffs2_do_read_inode_internal: Argh. Special inode #86 
with mode 0xa1ff had more than one node
Returned error for crccheck of ino #86. Expect badness...
JFFS2 error: (290) jffs2_do_read_inode_internal: Argh. Special inode 
#186 with mode 0xa1ff had more than one node
Returned error for crccheck of ino #186. Expect badness...
...)

The same image is booting on other (pxa270) boards, of course...
Simon
