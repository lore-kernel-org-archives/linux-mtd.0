Received: from relay00.pair.com ([209.68.5.9])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KTIj1-0008DY-5N
	for linux-mtd@lists.infradead.org; Wed, 13 Aug 2008 15:57:27 +0000
Date: Wed, 13 Aug 2008 08:57:00 -0700
Subject: Replicating One NAND Partition to Another
From: Grant Erickson <gerickson@nuovations.com>
To: "\"linux-mtd@lists.infradead.org\"" <linux-mtd@lists.infradead.org>
Message-ID: <C4C8525C.11068%gerickson@nuovations.com>
Mime-version: 1.0
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

What is the most effective or the recommended way to replicate one like NAND
partition to another?

Ideally, I would anticipate doing something to the effect of:

    flash_eraseall -q <device-out>
    nanddump -o -b -s <offset> -l <size> <device-in> | nandwrite -q -p -s
<offset> <device-out>

However, because nandwrite does not read from standard input, something akin
to the following might the practical solution:

    mktemp nanddump.XXXXXX
    nanddump -o -b -s <offset> -l <size> -f /tmp/nanddump.XXXXXXX
<device-in>
    flash_eraseall -q <device-out>
    nandwrite -q -p -s <offset> <device-out> /tmp/nanddump.XXXXXXX

However, this practical realization appears to have two downsides:

    1) The creation of a potentially large intermediate file in tmpfs.
    2) Digest of the original input image and dumps do not match.

Regarding (1), is there any practical reason that nandwrite could not be
modified to read from standard input or a new utility created (e.g. 'nandcp
[options] <device-in> <device-out>')?

Regarding (2), page padding bytes and a lack of deblocking said page padding
when the '-l' (length) option is used seems to be the case:

    # ls -la boot.itb
    -rw-r--r--    1 root     root      1297520 Aug  9  2008 boot.itb

    # md5sum boot.itb
    a8e2abd075f6e6f818452c89b7c87660  boot.itb

    # flash_eraseall -q /dev/mtd8
    # nandwrite -q -p -s 0 /dev/mtd8 boot.itb
    # nanddump -o -b -s 0 -l 1297520 /dev/mtd8 | md5sum
    ...
    615ba64c881eee61eb73ad1f7c79f673  -
    # nanddump -o -b -s 0 -l 1297520 -f /tmp/nanddump.vhCgSM /dev/mtd8
    ...
    # md5sum /tmp/nanddump.vhCgSM
    615ba64c881eee61eb73ad1f7c79f673  /tmp/nanddump.vhCgSM
    # flash_eraseall -q /dev/mtd10
    # nandwrite -q -p -s 0 /dev/mtd10 /tmp/nanddump.vhCgSM

    # nanddump -o -b -s 0 -l 1297520 /dev/mtd10 | md5sum
    ...
    615ba64c881eee61eb73ad1f7c79f673  -
    # mktemp -t nanddump.XXXXXX
    /tmp/nanddump.ir7EKh
    # nanddump -o -b -s 0 -l 1297520 /dev/mtd10 -f /tmp/nanddump.ir7EKh
    ...
    # md5sum /tmp/nanddump.ir7EKh
    615ba64c881eee61eb73ad1f7c79f673  /tmp/nanddump.ir7EKh
    # ls -la /tmp/nanddump.ir7EKh
    -rw-r--r--    1 root     root      1297920 Jan  1 00:08
/tmp/nanddump.ir7EKh

I would have expected usage of the '-l' (length) option to have deblocked
such page padding. Is this lack of deblocking when the '-l' option is
present intentional?

Regards,

Grant Erickson
