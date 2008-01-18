Received: from co203.xi-lite.net ([149.6.83.203] helo=toronto.xi-lite.net)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JFnnm-0007gX-Lf
	for linux-mtd@lists.infradead.org; Fri, 18 Jan 2008 09:46:26 +0000
Message-ID: <4790752C.60306@parrot.com>
Date: Fri, 18 Jan 2008 10:45:16 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
References: <478F7E6D.8010300@parrot.com>
	<20080117162601.GA6677@lazybastard.org>
In-Reply-To: <20080117162601.GA6677@lazybastard.org>
Content-Type: multipart/mixed; boundary="------------000207030308050002080703"
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------000207030308050002080703
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Jörn Engel wrote:
> On Thu, 17 January 2008 17:12:29 +0100, Matthieu CASTET wrote:
>> we have a 240 MB jffs2 partition with summary enabled and no 
>> compression. We use 2ad8ee713566671875216ebcec64f2eda47bd19d git jffs2 
>> version 
>> (http://git.infradead.org/?p=mtd-2.6.git;a=commit;h=2ad8ee713566671875216ebcec64f2eda47bd19d)
>> If we do a ls without waiting that jffs2_garbage_collect_pass finish, ls 
>> takes 12 minutes to complete.
> 
> Impressive!  JFFS2 may be slow, but it shouldn't be _that_ slow.  Not
> sure who cares enough to look at this.  My approach would be to 
> $ echo t > /proc/sysrq_trigger
> several times during those 12 minutes and take a close look at the code
> paths showing up.  Most likely it will spend 99% of the time in one
> place.
I have a jtag debugger that allow me to know where the code take time.
When I mount the partition, thanks to the summary the mount is very 
short (less than 10s).

Then the garbage collector start to check nodes [1]. It spend 12 minutes 
in jffs2_garbage_collect_pass.

Then the system goes idle.

Then if I try to access the file [2]. It take 12 minutes to finish 
jffs2_lookup.

I have attached the result of booting with 'profile=1'. (HZ=200)

The code spend lot's of time in the rbtree code (7 minutes) and 4 
minutes in jffs2_get_inode_nodes.


Matthieu

[1]
#0  rb_next (node=0xc1c76e80) at lib/rbtree.c:325
#1  0xc00c5568 in jffs2_get_inode_nodes (c=0xc0a5a800, f=0xc0a5a200,
     rii=0xc1c19dbc) at fs/jffs2/readinode.c:317
#2  0xc00c59d4 in jffs2_do_read_inode_internal (c=0xc0a5a800, f=0xc0a5a200,
     latest_node=0xc1c19e14) at fs/jffs2/readinode.c:1124
#3  0xc00c63a0 in jffs2_do_crccheck_inode (c=0xc0a5a800, ic=0xc03993c8)
     at fs/jffs2/readinode.c:1379
#4  0xc00c9afc in jffs2_garbage_collect_pass (c=0xc0a5a800)
     at fs/jffs2/gc.c:208
#5  0xc00cc56c in jffs2_garbage_collect_thread (_c=<value optimized out>)
     at fs/jffs2/background.c:138
#6  0xc003766c in sys_waitid (which=19019, pid=20115456, infop=0x4a0e,
     options=-1044275912, ru=0x0) at kernel/exit.c:1634

[2]
#0  0xc00e8c14 in rb_prev (node=<value optimized out>) at lib/rbtree.c:368
#1  0xc00c5624 in jffs2_get_inode_nodes (c=0xc0a5a800, f=0xc1c16ca0,
     rii=0xc0fadbf4) at fs/jffs2/readinode.c:355
#2  0xc00c59d4 in jffs2_do_read_inode_internal (c=0xc0a5a800, f=0xc1c16ca0,
     latest_node=0xc0fadca8) at fs/jffs2/readinode.c:1124
#3  0xc00c6604 in jffs2_do_read_inode (c=0xc0a5a800, f=0xc1c16ca0, ino=165,
     latest_node=0xc0fadca8) at fs/jffs2/readinode.c:1364
#4  0xc00cd5c8 in jffs2_read_inode (inode=0xc1c16cd0) at fs/jffs2/fs.c:247
#5  0xc00c0204 in jffs2_lookup (dir_i=0xc1c16310, target=0xc1c0d0d8,
     nd=<value optimized out>) at include/linux/fs.h:1670
#6  0xc0080100 in do_lookup (nd=0xc0fadf08, name=0xc0fadd8c, 
path=0xc0fadd98)
     at fs/namei.c:494
#7  0xc0081e24 in __link_path_walk (name=0xc085300f "", nd=0xc0fadf08)
     at fs/namei.c:940
#8  0xc008245c in link_path_walk (name=0xc0853000 "/mnt/toto/media",
     nd=0xc0fadf08) at fs/namei.c:1011
#9  0xc00829b0 in do_path_lookup (dfd=<value optimized out>,
     name=0xc0853000 "/mnt/toto/media", flags=<value optimized out>,
     nd=0xc0fadf08) at fs/namei.c:1157

--------------000207030308050002080703
Content-Type: text/plain;
 name="profile.txt"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="profile.txt"

IDU0MzY2IHJiX3ByZXYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgNTQzLDY2
MDAKIDI4MzQ1IHJiX25leHQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMjgz
LDQ1MDAKICA4NjAyIGRlZmF1bHRfaWRsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDcxLDY4MzMKIDEwMjUxIF9fcmF3X3JlYWRzbCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDQwLDA0MzAKIDQ5NjQ4IGpmZnMyX2dldF9pbm9kZV9ub2RlcyAgICAgICAgICAgICAg
ICAgICAgIDExLDgwOTcKICAgMjUxIHMzYzI0MTJfbmFuZF9kZXZyZWFkeSAgICAgICAgICAg
ICAgICAgICAgICA3LDg0MzgKICAxMjIyIGNyYzMyX2xlICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA0LDg0OTIKICAgIDU4IF9fZGVsYXkgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA0LDgzMzMKICAgMTY0IHRvdWNoX3NvZnRsb2NrdXBfd2F0Y2hk
b2cgICAgICAgICAgICAgICAgICA0LDEwMDAKICAgMjQ1IG5hbmRfd2FpdF9yZWFkeSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAyLDc4NDEKICAgIDc4IHMzYzI0NDBfbmFuZF9od2Nv
bnRyb2wgICAgICAgICAgICAgICAgICAgICAxLDYyNTAKICAgIDM3IHMzYzI0MTJfbmFuZF9l
bmFibGVfaHdlY2MgICAgICAgICAgICAgICAgICAxLDAyNzgKICAgIDQ0IHMzYzI0MTJfbmFu
ZF9jYWxjdWxhdGVfZWNjICAgICAgICAgICAgICAgICAwLDg0NjIKICAgIDMwIG11dGV4X2xv
Y2sgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwLDc1MDAKICAgIDY1IGttZW1f
Y2FjaGVfYWxsb2MgICAgICAgICAgICAgICAgICAgICAgICAgICAwLDYyNTAKICAgIDEyIGRv
d25fcmVhZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwLDYwMDAKICAgIDEz
IF9fYWVhYmlfdWlkaXZtb2QgICAgICAgICAgICAgICAgICAgICAgICAgICAwLDU0MTcKICAg
MTYzIG5hbmRfcmVhZF9wYWdlX2h3ZWNjICAgICAgICAgICAgICAgICAgICAgICAwLDQ5NzAK
ICAgIDUzIHMzYzI0MTJfbmFuZF9yZWFkX2J1ZiAgICAgICAgICAgICAgICAgICAgICAwLDQ5
MDcKICAgIDQ2IGpmZnMyX2xvb2t1cF9ub2RlX2ZyYWcgICAgICAgICAgICAgICAgICAgICAw
LDQ0MjMKICAgIDI0IHMzYzI0MTJfY2xrY29uX2VuYWJsZSAgICAgICAgICAgICAgICAgICAg
ICAwLDQyODYKICAgIDM5IGNsa19kaXNhYmxlICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAwLDM3NTAKICAgIDEwIF9fY29uc3RfdWRlbGF5ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAwLDM1NzEKICAgIDM5IGNsa19lbmFibGUgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAwLDMzNjIKICAgIDE4IHN0cmNtcCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAwLDMyMTQKICAgIDMyIHN5c2ZzX2RpcmVudF9leGlzdCAgICAgICAg
ICAgICAgICAgICAgICAgICAwLDI3NTkKICAgIDMzIF9fd2FrZV91cCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAwLDI3NTAKICAgICA5IG11dGV4X3VubG9jayAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAwLDI1MDAKICAgIDM3IGttZW1fY2FjaGVfZnJlZSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAwLDIyMDIKICAgMTc3IG1lbWNweSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwLDIxNjkK
--------------000207030308050002080703--
