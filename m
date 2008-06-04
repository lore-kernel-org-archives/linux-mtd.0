Received: from relay00.pair.com ([209.68.5.9])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K3wWa-0006pq-7L
	for linux-mtd@lists.infradead.org; Wed, 04 Jun 2008 17:11:48 +0000
Date: Wed, 04 Jun 2008 10:11:39 -0700
Subject: Odd Results Using -d and -D Together with mkfs.jffs2
From: Grant Erickson <gerickson@nuovations.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Message-ID: <C46C1ADB.F95E%gerickson@nuovations.com>
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

I've run into what I can only imagine is user error regarding mkfs.jffs2
when creating a root file system image for a target system.

At present, I run mkfs.jffs2 with super-user credentials and point it at a
temporary root file system tree (created with a tool that does
gather/scatter of build tree results) and end up with the precisely desired
image with all the right permissions, files, etc.:

    % sudo mkfs.jffs2 -v --big-endian --no-cleanmarkers --pad 512 \
    --pagesize 512 --eraseblock 16384 -d /tmp/tmp.gtKxQ31829 -o root.img

at about 11 MiB in size.

However, clearly, I'd like to be able to run a build without requiring
super-user credentials. So, I added an option to my gather/scatter tool to
generate a device table so that it can skip setting permissions and creating
device nodes and let mkfs.jffs2 do that:

    % mkfs.jffs2 -v --big-endian --no-cleanmarkers --pad 512 \
    --pagesize 512 --eraseblock 16384 -d /tmp/tmp.EdxjV32751 \
    -D devices.txt -o root.img

However, I end up with two problems, the first of which seems counter to
what I had expected based on my interpretation of the manual reference page:

    1) I end up with an image that is 2x larger (22 MiB) than was
       created in the super-user credentialed case without the device table.

       Based on the output with '-v' enabled, mkfs.jffs2 seems to create
       every regular file and directory twice, once with the permissions
       (the current build user) from the source file from '-d' and again
       with the permissions specified (privileged users) in '-D'. For
       example:

        ...
        /usr
            d 0775         0              1000:1000 bin
            d 0775         0              1000:1000 lib
            d 0775         0              1000:1000 libexec
            d 0775         0              1000:1000 sbin
            d 0775         0              1000:1000 share
            d 0775         0                 0:4   bin
            d 0775         0                 0:4   lib
            d 0775         0                 0:4   libexec
            d 0775         0                 0:4   sbin
            d 0775         0                 0:4   share
        ...

    2) It does not seem to be able to set the permissions of any directories
       at the top of the file tree:

        mkfs.jffs2: skipping device_table entry '/bin': no parent directory!
        mkfs.jffs2: skipping device_table entry '/dev': no parent directory!
        mkfs.jffs2: skipping device_table entry '/etc': no parent directory!
        mkfs.jffs2: skipping device_table entry '/lib': no parent directory!
        mkfs.jffs2: skipping device_table entry '/sys': no parent directory!
        mkfs.jffs2: skipping device_table entry '/tmp': no parent directory!
        mkfs.jffs2: skipping device_table entry '/usr': no parent directory!
        mkfs.jffs2: skipping device_table entry '/var': no parent directory!
        ...

Given the two example bits of output above, my device table looks like:

/bin    d   0775    0   4   0   0   -   -   -
/dev    d   0775    0   4   0   0   -   -   -
/etc    d   0775    0   4   0   0   -   -   -
/lib    d   0775    0   4   0   0   -   -   -
/sys    d   0775    0   4   0   0   -   -   -
/tmp    d   0775    0   4   0   0   -   -   -
/usr    d   0775    0   4   0   0   -   -   -
/usr/bin    d   0775    0   4   0   0   -   -   -
/usr/lib    d   0775    0   4   0   0   -   -   -
/usr/libexec    d   0775    0   4   0   0   -   -   -
/usr/sbin   d   0775    0   4   0   0   -   -   -
/usr/share  d   0775    0   4   0   0   -   -   -
/var    d   0775    0   4   0   0   -   -   -

Any insight on what user error I am tripping over here?

Regards,

Grant Erickson
