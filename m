Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 140Mza-0006hi-00
	for mtd-list@infradead.org; Mon, 27 Nov 2000 12:02:42 +0000
Received: from mx0.i-way.net.uk ([212.49.192.2] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 140MzZ-0006hc-00
	for mtd@infradead.org; Mon, 27 Nov 2000 12:02:41 +0000
Received: from m4exch.m4data.co.uk (host2.m4data.co.uk [212.49.209.214] (may be forged))
	by mx0.i-way.net.uk (8.10.2/8.10.2) with ESMTP id eARC6fN10806
	for <mtd@infradead.org>; Mon, 27 Nov 2000 12:06:43 GMT
Message-ID: <00B4D286538DD311BC6E005004E9EFC73B0ED9@M4EXCH>
From: Simon Munton <Simon.Munton@m4data.co.uk>
To: mtd@infradead.org
Subject: Oops in JFFS
Date: Mon, 27 Nov 2000 12:02:27 -0000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

The following program which runs fine on ext2 causes an oops on JFFS:

#include <stdio.h>

int main (int argc, char *argv[])
{
  FILE *fp1;
  char buf[100];
  
  fp1 = fopen ("foo", "w");
  fputs ("hello", fp1);
  fclose (fp1);

  fp1 = fopen ("foo", "r");
  
  unlink ("foo");
  
  fgets (buf, 100, fp1);
  printf("read: %s\n", buf);
  fclose (fp1);
}

What seems to be happening is that after the unlink, the u.generic_ip field
of the inode is set to 0; and then when the file is read, this value is
dereferenced and causes the oops. I believe that JFFS is getting rid of the
file too soon, ie not waiting until all file descriptors referring to the
file are closed.

Suggestions, anyone?

Here is the debug output:

jffs_create(): dir: 0xc0358440, name: "foo"
jffs_write_node(): filename = "foo", ino = 28, total_size = 64
jffs_fmalloc(): fmc = 0xc0090a30, size = 64, node = 0xc0093590
jffs_insert_node(): ino = 28, version = 1, name = "foo", deleted = 0
thread_should_wake(): free=8251696, dirty=5776, blocksize=131072.
***jffs_file_write(): inode: 0xc0f6add0 (ino: 28), filp: 0xc01d9b00, buf:
0x4001
4000, count: 5
jffs_write_node(): filename = "foo", ino = 28, total_size = 72
jffs_fmalloc(): fmc = 0xc0090a30, size = 72, node = 0xc00935e0
jffs_write_node(): setting version of foo to 2
jffs_insert_node(): ino = 28, version = 2, name = "", deleted = 0
jffs_remove_redundant_nodes(): Removing node: ino: 28, version: 1, mod_type:
3
jffs_fmfree(): node->ino = 28, node->version = 1
thread_should_wake(): free=8251624, dirty=5840, blocksize=131072.
***jffs_remove(): file = "foo", ino = 28
jffs_write_node(): filename = "", ino = 28, total_size = 60
jffs_fmalloc(): fmc = 0xc0090a30, size = 60, node = 0xc0093590
jffs_write_node(): setting version of foo to 3
jffs_insert_node(): ino = 28, version = 3, name = "", deleted = 1
jffs_fmfree(): node->ino = 28, node->version = 2
jffs_fmfree(): node->ino = 28, node->version = 3
Unable to handle kernel NULL pointer dereference at virtual address 00000020
current->tss.cr3 = 00ffd000, %cr3 = 00ffd000
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<c0152256>]
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010292
eax: 00000000   ebx: c0220db8   ecx: c01d9b00   edx: c01fa000
esi: c0f6add0   edi: c0f6add0   ebp: fffffffb   esp: c0f37f10
ds: 0018   es: 0018   ss: 0018
Process jffstest (pid: 70, process nr: 14, stackpage=c0f37000)
Stack: c0f6add0 c0220db8 00000000 00000000 c00909a0 00000000 c011989c
c01d9b00
       c0220db8 00001000 40014000 00000000 00001000 c009ab74 00000000
00000000
       40015000 c00382e0 c0036de0 00000000 00000001 00000000 c0f6add0
c0119a23
Call Trace: [<c011989c>] [<c0119a23>] [<c0119970>] [<c0121d36>] [<c0107be8>]
Code: 8b 50 20 85 d2 75 05 ba a0 5d 1b c0 52 68 c0 5d 1b c0 e8 73

>>EIP; c0152256 <jffs_readpage+36/190>   <=====
Trace; c011989c <do_generic_file_read+56c/640>
Trace; c0119a23 <generic_file_read+63/80>
Trace; c0119970 <file_read_actor+0/50>
Trace; c0121d36 <sys_read+b6/d0>
Trace; c0107be8 <system_call+34/38>
Code;  c0152256 <jffs_readpage+36/190>
00000000 <_EIP>:
Code;  c0152256 <jffs_readpage+36/190>   <=====
   0:   8b 50 20                  movl   0x20(%eax),%edx   <=====
Code;  c0152259 <jffs_readpage+39/190>
   3:   85 d2                     testl  %edx,%edx
Code;  c015225b <jffs_readpage+3b/190>
   5:   75 05                     jne    c <_EIP+0xc> c0152262
<jffs_readpage+42/190>
Code;  c015225d <jffs_readpage+3d/190>
   7:   ba a0 5d 1b c0            movl   $0xc01b5da0,%edx
Code;  c0152262 <jffs_readpage+42/190>
   c:   52                        pushl  %edx
Code;  c0152263 <jffs_readpage+43/190>
   d:   68 c0 5d 1b c0            pushl  $0xc01b5dc0
Code;  c0152268 <jffs_readpage+48/190>
  12:   e8 73 00 00 00            call   8a <_EIP+0x8a> c01522e0
<jffs_readpage+c0/190>

========================================================
Simon Munton	simonm@m4data.co.uk
M4 Data Ltd	Tel: 44-1749-683800
Mendip Court, Bath Rd, Wells	Fax: 44-1749-673928
Somerset, BA5 3DG, England




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
