From: tweedledum@openbrain.co.kr (=?ks_c_5601-1987?B?vcm8usC2?=)
Date: Fri, 28 Mar 2003 12:03:56 +0900
Subject: Required memory size for jffs2.
Message-ID: <00da01c2f4d6$ac6b3140$7d0323d3@tweedledum>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

I have tested jffs2 in user memory space, which gave me many advantages to
understand the inner works of jffs2 and save time; disk i/o request was
redirected to file i/o and kmalloc() was modified to malloc().

I checked the size of all allocated memory using malloc_stats() function to
meet our memory requirement in embedded environment.

Nand flash size 32MB with blocks of 16KB and pages of 512B, whose total
number of blocks is 2048.

When there is no file, malloc_stats() prints the follow results after mount

Arena 0:
system bytes     =     148128
in use bytes     =     140208
Total (incl. mmap):
system bytes     =     148128
in use bytes     =     140208
max mmap regions =          0
max mmap bytes   =          0

After Creation of a ~10MB file under same situation. the number of total
nodes on flash including clean markers is 3297

system bytes     =     209568
in use bytes     =     203056
Total (incl. mmap):
system bytes     =     209568
in use bytes     =     203056
max mmap regions =          0
max mmap bytes   =          0

When I tried to read the file, it went worse. It temporarily needs 400KB
maximally; I wish this number is under 200KB.

Arena 0:
system bytes     =     463520
in use bytes     =     415728
Total (incl. mmap):
system bytes     =     463520
in use bytes     =     415728
max mmap regions =          0
max mmap bytes   =          0

I could hardly believe the results. jffs2 requires too much memory!!

Actually I used the version ported to ecos(the date I downloaded ecos is
2003-02-07 07:17). Because I thought that's easily be done.

Could someone help me to understand the situation? any suggestion and
help will be appreciated. thanks very much.
