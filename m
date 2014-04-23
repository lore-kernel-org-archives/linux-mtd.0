Received: from mail-lb0-x236.google.com ([2a00:1450:4010:c04::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wcsl9-00035g-5C
 for linux-mtd@lists.infradead.org; Wed, 23 Apr 2014 08:42:31 +0000
Received: by mail-lb0-f182.google.com with SMTP id l4so501694lbv.13
 for <linux-mtd@lists.infradead.org>; Wed, 23 Apr 2014 01:42:02 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 23 Apr 2014 10:42:02 +0200
Message-ID: <CAAQYJAt9OSU6jeW4C81YqgsJiu1+-yYgmtEJmzpnjQmx0KW-Wg@mail.gmail.com>
Subject: Detection of pre-CFI Sharp NOR chips
From: Andrea Adami <andrea.adami@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm trying to debug the detection of some hostic chips that exactly
ten years ago could be detected by cfi_probe...

http://lists.infradead.org/pipermail/linux-mtd/2004-April/009647.html

My findings are contradicting that possibility...I am testing on a
real consumer device, not a prototype,  and the setup is 2x16 on 32
bit bus (sa1100).

The readings are as follow:

Status Register is:80808080
JEDEC map_read IDentify 1:b000b0
JEDEC map_read IDentify 2:b000b0
CFI map_read at offset 0: b000b0
CFI map_read at offset 1: b000b0
CFI map_read at offset 2: 10001
CFI map_read at offset 3: 0
CFI map_read at offset 4: 0
CFI map_read at offset 5: ffffffff
CFI map_read at offset 6: 4000400
CFI map_read at offset 7: 0
CFI map_read at offset 8: b000b0
CFI map_read at offset 9: b000b0
CFI map_read at offset a: 0
CFI map_read at offset b: 0
CFI map_read at offset c: 0
CFI map_read at offset d: ffffffff
CFI map_read at offset e: 4000400
CFI map_read at offset f: 0
CFI map_read at offset 10: ffff0051
CFI map_read at offset 11: ffff0052
CFI map_read at offset 12: ffff0059
CFI map_read at offset 13: ffff0003
CFI map_read at offset 14: ffff0000
CFI map_read at offset 15: ffff0039
CFI map_read at offset 16: ffff0000
...

map_read() does correctly return the values of both chips for the
first offsets then the answer of one chip is 0xffff as if that part of
the table were programmed on a single chip of the pair.

So I can read the cfi->mfr and cfi->id in both jedec and cfi mode.

CFI map_read at offset 0: b000b0
CFI map_read at offset 1: b000b0

For those chips then I have to discard the readings of one chip to
match the values in cfi_query_present().

So, before sending to the ML my set of patches for the support of this
chip family  [1] I'd like to refine the CFI detection [2].

How would you best add the fixup for all the four ID's in case of
interleave? Are more checks in cfi_qry_present() acceptable?

Thanks for your suggestions

Andrea


[1] http://cgit.openembedded.org/meta-handheld/tree/recipes-kernel/linux/linux-yocto-3.14/collie/collie-LH28F640BF.patch
[2] http://cgit.openembedded.org/meta-handheld/tree/recipes-kernel/linux/linux-yocto-3.14/collie/collie-match-cfi-qry.patch
