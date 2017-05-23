Received: from mail-oi0-x22a.google.com ([2607:f8b0:4003:c06::22a])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dD5xm-0001iH-4y
 for linux-mtd@lists.infradead.org; Tue, 23 May 2017 09:18:47 +0000
Received: by mail-oi0-x22a.google.com with SMTP id l18so193308076oig.2
 for <linux-mtd@lists.infradead.org>; Tue, 23 May 2017 02:18:25 -0700 (PDT)
MIME-Version: 1.0
From: Andreas Fenkart <afenkart@gmail.com>
Date: Tue, 23 May 2017 11:18:23 +0200
Message-ID: <CALtMJEBb19Etkds1wVtBgOOzEC7g8NZOk2SMNXiVQORLoEH2CQ@mail.gmail.com>
Subject: howto mark blocks with correctable bitflip errors as bad blocks
 explicitly
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi list,

Is there a way to mark a block as bad explicitly with one of the
nandwrite/nandtest tools?

I had a device that reports bitflip errors, and I had the suspicion that
the u-boot is not correcting those errors, hence it fails to verify the CRC
checksum in the uimage header.

$ nanddump --bb=skipbad --omitoob -l ${FSIZE} ${PART} -f $TMPFILE
ECC failed: 0
ECC corrected: 5
Number of bad blocks: 0
Number of bbt blocks: 0
ECC: 1 corrected bitflip(s) at offset 0x003da000

The problem happened on a remote system and I don't have access to the
console. I made a custom tool to mark that single block as bad and now,
u-boot is booting the new kernel. Hence it seems u-boot has is not able to
recover the same errors as the kernel. Probably it uses a weaker ECC
algorithm. (need to verify check this)

Since there are other installations, I would like to automate marking
bitflips as errors too. Does this make sense?  I don't want to update u-boot
and using a stronger ECC still makes sense for the rootfs that u-boot is not
accessing.

Is there already a tool that can do that automatically?  What would be the best
place to add such a function?

I was looking into nandtest and wanted to add some '--zero-error' flag to mark
buffers with recovered ECC errors as bad forcefully. Unfortunately nandtest
does not report those bitflip errors at all.

Everytime nandump reports a bitflip error the 'ECC failed' counter increases on
the next run. But when running nandtest it never does. Maybe it's because
nanddump reads it min_io_size chunks while nandtest reads back the whole erase
block.

/Andi
