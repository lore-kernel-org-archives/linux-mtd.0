Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 147zvZ-0003a2-00
	for mtd-list@infradead.org; Mon, 18 Dec 2000 13:02:05 +0000
Received: from mx0.i-way.net.uk ([212.49.192.2] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 147zvW-0003Zv-00
	for mtd@infradead.org; Mon, 18 Dec 2000 13:02:03 +0000
Received: from m4exch.m4data.co.uk (host2.m4data.co.uk [212.49.209.214] (may be forged))
	by mx0.i-way.net.uk (8.10.2/8.10.2) with ESMTP id eBIDAh820870
	for <mtd@infradead.org>; Mon, 18 Dec 2000 13:10:43 GMT
Message-ID: <52AF3CB987C7D41183CD0090271F67C3184C@m4eng.m4data.co.uk>
From: Simon Munton <Simon.Munton@m4data.co.uk>
To: mtd@infradead.org
Subject: RE: JFFS: deleted files still appear in directory
Date: Mon, 18 Dec 2000 13:01:53 -0000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

There's still a problem with the following sequence of commands:

# touch foo
# touch bar
# mv foo bar
# rm bar
rm: cannot unlink `bar': Input/output error

JFFS debug output:
jffs_create(): dir: 0xc0f20144, name: "foo"
jffs_write_node(): filename = "foo", ino = 2, total_size = 64
jffs_fmalloc(): fmc = 0xc0f873f0, size = 64, node = 0xc000b720
jffs_insert_node(): ino = 2, version = 1, name = "foo", deleted = 0
thread_should_wake(): free=8257472, dirty=0, blocksize=131072.
jffs_create(): dir: 0xc0f20144, name: "bar"
jffs_write_node(): filename = "bar", ino = 3, total_size = 64
jffs_fmalloc(): fmc = 0xc0f873f0, size = 64, node = 0xc000b630
jffs_insert_node(): ino = 3, version = 1, name = "bar", deleted = 0
thread_should_wake(): free=8257408, dirty=0, blocksize=131072.
***jffs_rename()
jffs_rename(): old_dir: 0xc0f20144, old name: 0xc0f1e760, new_dir:
0xc0f20144, new name: 0xc0f1e860
jffs_write_node(): filename = "bar", ino = 2, total_size = 68
jffs_fmalloc(): fmc = 0xc0f873f0, size = 68, node = 0xc000b770
jffs_write_node(): setting version of foo to 2
***jffs_remove(): file = "bar", ino = 3
jffs_write_node(): filename = "", ino = 3, total_size = 60
jffs_fmalloc(): fmc = 0xc0f873f0, size = 60, node = 0xc000b590
jffs_write_node(): setting version of bar to 2
jffs_insert_node(): ino = 3, version = 2, name = "", deleted = 1
thread_should_wake(): free=8257280, dirty=0, blocksize=131072.
jffs_insert_node(): ino = 2, version = 2, name = "bar", deleted = 0
jffs_remove_redundant_nodes(): Removing node: ino: 2, version: 1, mod_type:
3
jffs_fmfree(): node->ino = 2, node->version = 1
thread_should_wake(): free=8257280, dirty=64, blocksize=131072.
***jffs_remove(): file = "bar", ino = 2
jffs_remove(): wrong inodes


Simon

========================================================
Simon Munton	simonm@m4data.co.uk
M4 Data Ltd	Tel: 44-1749-683800
Mendip Court, Bath Rd, Wells	Fax: 44-1749-673928
Somerset, BA5 3DG, England


> -----Original Message-----
> From: David Vrabel [mailto:dvrabel@arcom.co.uk]
> Sent: 18 December 2000 12:08 pm
> To: David Woodhouse
> Cc: mtd@infradead.org
> Subject: Re: JFFS: deleted files still appear in directory
> 
> 
> Hi,
> 
> I think this problem is fixed by this patch.
> 
> David Vrabel.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
