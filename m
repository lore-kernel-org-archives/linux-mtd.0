Received: from mail-lf0-x236.google.com ([2a00:1450:4010:c07::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmEj0-0005uq-Vv
 for linux-mtd@lists.infradead.org; Wed, 14 Oct 2015 05:35:43 +0000
Received: by lfaz124 with SMTP id z124so5982262lfa.1
 for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2015 22:35:20 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 14 Oct 2015 08:35:20 +0300
Message-ID: <CAAAVVLTY2UnU0ps6MZr2jL9MUXLDP2tGSr5gp2fJ7kzkhfuCUg@mail.gmail.com>
Subject: Freeing space on JFFS2 after removing file
From: =?UTF-8?B?0J3QuNC60L7Qu9Cw0Lkg0JjRgdCw0LXQsg==?= <stvdedal@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

We have JFFS2 partition with files: X1, X2, X3, ...., Xn. All those
files have the same size and content.
When we tried to create new file, the error ENOSPC has occurred, which
means that the file system is full and all space is used.
With this file system state, we delete a single file (X1, for example)
in order to free space that the file used.
After that, we try to recreate the same file (X1), but the error
ENOSPC occurs again.
So, even after deleting a file, the file system does not free space to
store the same file.
The same behaviour occurs when we remount file system in order to
garbage collector does his job.

Questions:
1. Is it a JFFS2 bug?
2. Is it possible to determine when removing and subsequent creation
of a file will be successful?
3. How can we determine that the free space, shown by JFFS2, fits with
real free space on the system?

The bash script shows that:

-------------------- cut here -------------------------------------
mkdir /tmp/jffstest
cd /tmp/jffstest

#
# create empty directory and
# mount point directory
#
mkdir mnt emptydir

#
# create jffs2 image
# eraseblock size = 128 Kb
# total size      = 20 Mb
#
mkfs.jffs2 -r emptydir -o image.jffs2 --pad=20971520 -e 128

#
# mount image file
#
modprobe mtdram total_size=20480 erase_size=128
modprobe mtdblock
dd if=image.jffs2 of=/dev/mtdblock0
mount -t jffs2 /dev/mtdblock0 mnt

#
# create 15Mb and 512Kb files
# with random data
#
head -c 15m /dev/urandom >big
head -c 512k /dev/urandom >small

#
# Fill the jffs2 partition
#  firstly add big file
#  then add small files until ENOSPC occurred
#
cp big mnt/.
N=1; while cp small mnt/small_$N; do N=$(( N + 1)); done

echo
echo 'The filesystem is filled completely'
echo

echo
echo Test:
echo

rm -f mnt/small_1     # Remove file
cp small mnt/small_1  # Try recreate the same.
                      # But result will be "No space left on device"

-------------------- cut here -------------------------------------

The last command will be finished with error: "No space left on device"
I ran this script on openSUSE 12.3 (Dartmouth) (i586) with kernel 3.7.10

Thanks
