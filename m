Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SLMf-0003l2-00
	for mtd-list@infradead.org; Mon, 12 Feb 2001 15:58:09 +0000
Message-ID: <3A880E37.E5D3DFC8@danielind.com>
Date: Mon, 12 Feb 2001 10:24:23 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mendel@mobach.nl, "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: Errors with M-Systems' DOC v MD2200 D16 and ext2
References: <3A86F72B.A1971413@mobach.nl> <19636.981968145@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David,

I got something similar. I'm (I think) using the latest versions from CVS
(nftl.c is ver. 1.66 and
nftlmount.c is ver. 1.12). I just did a cvs update and no new versions came
down.

Here is my situation:

 I have a DOC2000 32MB w/ 0x4000 (16k) erase size.
   This causes nftl_format to bail out as it explicitely checks for an erase
size of 0x2000 (8k) before it does anything.
Since not having much to loose, I removed that check and went ahead and
formatted the disk anyway. It did not complain.
I could then modprobe in docprobe (After removing the module after the
format). This time, it detected AND installed the NFTL device under
/dev/nftla.
   I could then fdisk it and create a partition on it, create a fs on (ext2
with mke2fs) and mount it.

   My question is: Why was the explicit check being done? Are there any traps
"lurking" for me now that I have removed the check and formatted my disk with
nftl_format?

   While copying data to the disk (cp -a /bin /mnt/doc2000 etc.) I would get
the data to copy, but after a few seconds (I guess when the cache is flushed
to disk) I would get a bunch of ext2-fs errors like:

end_request: I/O error, dev 5d:01 (unknown) sector 28
EXT2-fs error (device nftl(93,1)): ext2_write_inode: unable to read inode
block - inode=73, block=14
....
...
repeat above for inodes 74...80 rest of error same (same sector (28), block
=14).

I then unmounted the fs and did an e2fsck on /dev/nftl1

I then got error messages regarding short reads reading block 14 (on sector
28). Same problem as above.

Is this related to the format kludge that I did or something else?

Thanks

Vipin

Vipin Malik
Sr. Design Engr.
Daniel Industries
Houston, TX






David Woodhouse wrote:

> mendel@mobach.nl said:
> >  With the 2800 I've got no problems but with the  2200 I've got
> > problems and get some very strange kernel messages
>
> Running out of free blocks to write to - again. This has happened to a few
> people. I'm confused. I put a change into the CVS tree to attempt to fix
> this - can you try it? Just drop nftl.c and nftlmount.c from CVS on top of
> the versions in your kernel tree.
>
> --
> dwmw2
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
