Received: from mail-qe0-x22d.google.com ([2607:f8b0:400d:c02::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRmAd-0001rR-55
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2013 16:54:35 +0000
Received: by mail-qe0-f45.google.com with SMTP id 6so1960113qea.4
 for <linux-mtd@lists.infradead.org>; Thu, 03 Oct 2013 09:54:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHXsAqy=5fyKNYcNwOm1tiEeBnXvGbkfk67wxuqai_0K4Azv7w@mail.gmail.com>
References: <CAHXsAqxQJqjbCfsgjkd58FdCPNf7Du1+ET6ehsm83x5HHvXuzA@mail.gmail.com>
 <CAHXsAqyRsGorCoMF4LwmBdV4j_gtJhaHMMuq=Sogrig6wSeF3w@mail.gmail.com>
 <CAHXsAqy=5fyKNYcNwOm1tiEeBnXvGbkfk67wxuqai_0K4Azv7w@mail.gmail.com>
From: Yousuf Sait <yousufsait@gmail.com>
Message-ID: <CAHXsAqy-RV=reqvS0Rd93RHA9-wa=BV=3w1Lhd9wjWyT7OhnYw@mail.gmail.com>
Subject: Fwd: ubifs error
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Thu, 03 Oct 2013 16:54:36 -0000

Y

Hi All,

 I am working with ubifs partition of size 380MB on a nand of 512MB.
The volume is on a mtd device of size 400MB.
It was just working great but recently I noticed the following error,

UBIFS error (pid 508): ubifs_leb_read: reading -1578055608 bytes from
LEB 953:-1578055608 failed, error -22
UBIFS error (pid 508): try_read_node: cannot read node type 1 from LEB
953:-1578055608, error -22
UBIFS error (pid 508): ubifs_leb_read: reading -1578055608 bytes from
LEB 953:-1578055608 failed, error -22
UBIFS error (pid 508): do_readpage: cannot read page 1 of inode 2158, error -22
UBIFS error (pid 508): ubifs_leb_read: reading -1578055608 bytes from
LEB 953:-1578055608 failed, error -22
UBIFS error (pid 508): try_read_node: cannot read node type 1 from LEB
953:-1578055608, error -22
UBIFS error (pid 508): ubifs_leb_read: reading -1578055608 bytes from
LEB 953:-1578055608 failed, error -22
UBIFS error (pid 508): do_readpage: cannot read page 1 of inode 2158, error -22

1.The strange thing is that the error vanished when I rebooted the
system. Thus I ruled out any nand corruption

2.Also there were no nand I/O errors in the log and this is a readonly
partition.

3.The library file was loaded with mmap() and the do_readpage() of ubi
code was exercised for page wise loading.

4.The sequence of the page aceeses from nand was pages 0, 21, 4, 5, 2
and 1, in which all of those reads succeded expect for page1.

5.While trying to read page1, it tried to read some -ve size with -ve
offset. There was a sanity check in ubi io code which failed and
didn't go till the nand driver.

6.Surprisingly both the offset and length values that ubi was trying
to read was the same value, -1578055608 (unsigned:  0xA1F0C848). The
actual value was found (from another instance of flashing) to be as
LEB 953:124408, key (2158, data, 1). That means LEB number was intact
while the offset and length got corrupted.

7. We have seen multiple instances of this issue but ubi giving error
for different files. In a different repro, I tried printing all the
zbr nodes with the one which had bad values. The other ones looks fine
expect for the corrupted one (zbr[5] in this case)

[   10.399113] UBIFS: zbr[0] lnum:353 off:26784 len:1641
[   10.399123] UBIFS: zbr[1] lnum:353 off:28432 len:1639
[   10.399133] UBIFS: zbr[2] lnum:353 off:30072 len:1738
[   10.399143] UBIFS: zbr[3] lnum:353 off:31816 len:1621
[   10.399152] UBIFS: zbr[4] lnum:353 off:33440 len:1594
[   10.399163] UBIFS: zbr[5] lnum:353 off:-1445529080 len:-1445529080
[   10.399173] UBIFS: zbr[6] lnum:353 off:36760 len:1788
[   10.399191] UBIFS: zbr[7] lnum:353 off:38552 len:1866
[   10.399209] UBIFS error (pid 87): ubifs_leb_read: reading
-1445529080 bytes from LEB 353:-1445529080 failed, error -22
[   10.399227] UBIFS: ubifs_tnc_locate: ubifs_tnc_read_node failed
key:200004f000000c3f err:-22 safely:1 lnum:off 353:-1445529080



The code I was using is based on K3.1 and I had no luck on reproducing
the issue with latest kernel (3.11). The repro of the issue is very
rare so i am not sure if the newer code fixed it is there still an
issue.

Tree head, with which I reproed the issue,


commit 016f1c54408b1e92e2e8087bfc05ca0a9c258513
Author: Michal Marek <mmarek@suse.cz>
Date:   Thu Aug 11 12:29:46 2011 +0200

UBIFS: not build debug messages with CONFIG_UBIFS_FS_DEBUG disabled
....


1) What could be wrong here ?
2) Any fix that had solved the issue in the newer kernel ?
3) I can try adding some debug information, any relevant info would be good

Y
