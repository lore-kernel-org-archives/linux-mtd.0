Received: from web37901.mail.mud.yahoo.com ([209.191.124.96])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fg1DY-0007kj-3Y
	for linux-mtd@lists.infradead.org; Tue, 16 May 2006 11:12:28 -0400
Message-ID: <20060516150154.89887.qmail@web37901.mail.mud.yahoo.com>
Date: Tue, 16 May 2006 08:01:54 -0700 (PDT)
From: syed khader <sk.syed@yahoo.com>
To: "J�rn" Engel <joern@wohnheim.fh-wedel.de>,
  syed khader <sk.syed@yahoo.com>
In-Reply-To: <20060516142618.GB11656@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: CRC errors when continuous fseek/fputs on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi
  unfortunately I cannot run strace on my uclinux
console. It does not support strace. Anyways after
enabling debugging I got the following messages:

Reading 139264-139600 from node at 0x0017c66c (3)
Node read from 0017c66c: node_crc fa34d69f, calculated
CRC fa34d69f. dsize 151, csize cb, offset 22000, buf
00c97000
Read 203 bytes to 00c2aa60
Data CRC matches calculated CRC 4aab08a5
Decompress 203 bytes from 00c2aa60 to 337 bytes at
00cb4000
inflate skipping adler32
node read done
node read was OK. Looping
jffs2_read_inode_range: offset 139600, end 143360
Reading 139600-139768 from node at 0x0017c77c (3)
Node read from 0017c77c: node_crc 78842b6e, calculated
CRC 78842b6e. dsize ac, csize 90, offset 22150, buf
00c97150
Read 144 bytes to 00c2aa60
Data CRC matches calculated CRC b6cefe00
Decompress 144 bytes from 00c2aa60 to 172 bytes at
00c2ab60
inflate skipping adler32
node read done
node read was OK. Looping
jffs2_read_inode_range: offset 139768, end 143360
Reading 139768-139892 from node at 0x0017c850 (3)
Node read from 0017c850: node_crc dce8e33f, calculated
CRC dce8e33f. dsize 7e, csize 7e, offset 221f8, buf
00c971f8
Read 126 bytes to 00c915e0
Data CRC matches calculated CRC 0b89026a
node read done
node read was OK. Looping
jffs2_read_inode_range: offset 139892, end 143360
Reading 139892-139896 from node at 0x0017c914 (3)
Node read from 0017c914: node_crc 66fb0a5a, calculated
CRC 66fb0a5a. dsize 8, csize 8, offset 22274, buf
00c97274
Read 8 bytes to 00c09b60
Data CRC matches calculated CRC 6067465a
node read done
node read was OK. Looping
jffs2_read_inode_range: offset 139896, end 143360
Reading 139896-139961 from node at 0x0017c960 (3)
Node read from 0017c960: node_crc f1c73f10, calculated
CRC f1c73f10. dsize 41, csize 3f, offset 22278, buf
00c97278
Read 63 bytes to 00c0b720
Data CRC matches calculated CRC 3e33dceb
Decompress 63 bytes from 00c0b720 to 65 bytes at
00c97278
inflate skipping adler32
node read done
node read was OK. Looping
jffs2_read_inode_range: offset 139961, end 143360
Reading 139961-139964 from node at 0x0017c9e4 (3)
Node read from 0017c9e4: node_crc 57239698, calculated
CRC 57239698. dsize 4, csize 4, offset 222b9, buf
00c972b9
Read 4 bytes to 00c09b60
Data CRC 675ef222 != calculated CRC 83b8ee96 for node
at 0017c9e4
node read done
jffs2_read_inode_range error -5
readpage finished
end prepare_write(). pg->flags 10020047
jffs2_commit_write(): ino #4, page at 0x22000, range
2067-2092, flags 10020047
jffs2_write_inode_range(): Ino #4, ofs 0x22810, len
0x1c
jffs2_commit_write() loop: 0x1c to write to 0x22810
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x29d8 bytes at
0x17d628
calling deflate with avail_in 16, avail_out 16
deflate returned with avail_in 0, avail_out 0,
total_in 16, total_out 16
zlib compressed 16 bytes into 26; failing
jffs2_add_physical_node_ref(): Node at 0x17d628(3),
size 0x60
jffs2_write_dnode wrote node at 0x0017d628(3) with
dsize 0x1c, csize 0x1c, node_crc 0xe42c67a5, data_crc
0xca22a1bd, totlen 0x00000060
jffs2_add_full_dnode_to_inode(ino #4, f 00c481a8, fn
00cb0df0)
adding node 22810-2282c @0x0017d628 on flash, newfrag
*00cb64a4
jffs2_lookup_node_frag(00c481c0, 141328)
j_a_f_d_t_f: Lookup gave frag 0x227fc-0x22814; phys
0x0017d5cc (*00cb6488)
j_a_f_d_t_f: dealing with frag 0x227fc-0x22814; phys
0x0017d5cc (*00cb6488)
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 57,
nr_erasing_blocks 0, dirty_size 0x2dda4: no
increasing writtenlen by 28
jffs2_commit_write() returning 25
jffs2_dirty_inode() not calling setattr() for ino #4
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #4, page at offset
0x22000
jffs2_read_inode_range: ino #4, range
0x00022000-0x00023000
jffs2_lookup_node_frag(00c481c0, 139264)
jffs2_read_inode_range: offset 139264, end 143360
Reading 139264-139600 from node at 0x0017c66c (3)
Node read from 0017c66c: node_crc fa34d69f, calculated
CRC fa34d69f. dsize 151, csize cb, offset 22000, buf
00c97000
Read 203 bytes to 00c2aa60
Data CRC matches calculated CRC 4aab08a5
Decompress 203 bytes from 00c2aa60 to 337 bytes at
00cb4000
inflate skipping adler32
node read done
node read was OK. Looping
jffs2_read_inode_range: offset 139600, end 143360


--- J�rn Engel <joern@wohnheim.fh-wedel.de> wrote:

> On Tue, 16 May 2006 05:40:46 -0700, syed khader
> wrote:
> > 
> >   when I removed fseek/fwrite in the test case I
> am
> > not seeing any CRC errors. The modified code goes
> like
> > this :
> > 
> > int main()
> > {
> >    int fd;
> >    int i;
> >    char buf[SIZE];
> > 
> >    strcpy(buf, "abcdefg\r\n");
> >    printf("%s", buf);
> >    fd = open("testfile",O_RDWR|O_CREAT);
> >    for(i =0 ; i < 10 ; i++)
> >    {
> >       write(fd, buf, sizeof(buf));
> >       lseek(fd, -4, SEEK_CUR);
> >   }
> > }
> >    Why does CRC errors occur when I use
> fseek/fwrite
> > and not when I use plain system calls
> write/lseek??
> 
> Because it doesn't do the same thing.  But what did
> the fseek/fwrite
> version do?
> 
> Can you run the old testcase with strace?  Something
> like
> 
> $ strace -v 1>1 2>2 your_testcase
> 
> Then send us the contents of 2.
> 
> J�rn
> 
> -- 
> When in doubt, punt.  When somebody actually
> complains, go back and fix it...
> The 90% solution is a good thing.
> -- Rob Landley
> 
>
______________________________________________________
> Linux MTD discussion mailing list
>
http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
