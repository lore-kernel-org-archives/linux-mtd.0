Received: from relay01.pair.com ([209.68.5.15])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K6aDU-00043i-Kb
	for linux-mtd@lists.infradead.org; Wed, 11 Jun 2008 23:59:02 +0000
Date: Wed, 11 Jun 2008 16:58:46 -0700
Subject: Re: Odd Results Using -d and -D Together with mkfs.jffs2
From: Grant Erickson <gerickson@nuovations.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Message-ID: <C475B4C6.FBAA%gerickson@nuovations.com>
In-Reply-To: <C46C1ADB.F95E%gerickson@nuovations.com>
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

On 6/4/08 10:11 AM, Grant Erickson wrote:
> I've run into what I can only imagine is user error regarding mkfs.jffs2 when
> creating a root file system image for a target system.
> 
> At present, I run mkfs.jffs2 with super-user credentials and point it at a
> temporary root file system tree (created with a tool that does gather/scatter
> of build tree results) and end up with the precisely desired image with all
> the right permissions, files, etc.:
> 
>     % sudo mkfs.jffs2 -v --big-endian --no-cleanmarkers --pad 512 \
>     --pagesize 512 --eraseblock 16384 -d /tmp/tmp.gtKxQ31829 -o root.img
> 
> at about 11 MiB in size.
> 
> However, clearly, I'd like to be able to run a build without requiring
> super-user credentials. So, I added an option to my gather/scatter tool to
> generate a device table so that it can skip setting permissions and creating
> device nodes and let mkfs.jffs2 do that:
> 
>     % mkfs.jffs2 -v --big-endian --no-cleanmarkers --pad 512 \
>     --pagesize 512 --eraseblock 16384 -d /tmp/tmp.EdxjV32751 \
>     -D devices.txt -o root.img
> 
> However, I end up with two problems, the first of which seems counter to what
> I had expected based on my interpretation of the manual reference page:
> 
>     1) I end up with an image that is 2x larger (22 MiB) than was
>        created in the super-user credentialed case without the device table.
> 
>     2) It does not seem to be able to set the permissions of any directories
>        at the top of the file tree:
> 
>         mkfs.jffs2: skipping device_table entry '/bin': no parent directory!
>         mkfs.jffs2: skipping device_table entry '/dev': no parent directory!
>         mkfs.jffs2: skipping device_table entry '/etc': no parent directory!
>         mkfs.jffs2: skipping device_table entry '/lib': no parent directory!
>         mkfs.jffs2: skipping device_table entry '/sys': no parent directory!
>         mkfs.jffs2: skipping device_table entry '/tmp': no parent directory!
>         mkfs.jffs2: skipping device_table entry '/usr': no parent directory!
>         mkfs.jffs2: skipping device_table entry '/var': no parent directory!
>         ...

For those tuning into this thread, the problem turns out to be the following
clause in find_filesystem_entry:

        /* Only bother to do the expensive strcmp on matching file types */
        if (type == (e->sb.st_mode & S_IFMT)) {
            ...
        }

Given the following directory entries at root (/):

    /bin
    /dev
    /etc
    /lib
    /proc
    /sbin
    /sys
    /tmp
    /usr
    /var

and the single file "/etc/fstab" with 664 permissions, the above clause
causes the file find to fail for two reasons:

    1) S_IFMT is only masked for 'e->sb.st_mode' but not the passed in
       'type'. In the case of  the file "/etc/fstab", type is passed in as
       100664.

       So, even if "/etc/fstab" had the opportunity to match against a file
       (it doesn't as the code stands), it'd attempt to match against 100000
       from 'e->sb.st_mode' and would, consequently, never match.

    2) As intimated in (1), the clause also prevents the check for the case
       in which the item currently being compared, 'e', matches some
       directory component of the file name passed in. In the example here,
       "/etc".

      This then prevents further recursion down into that directory (again,
      "/etc") where it might have a chance of matching a file in that
      directory (here "fstab").

Removing the 'if (type == (e->sb.st_mode & S_IFMT)) { ... }' clause
altogether resolves both issues (1) and (2) and allows the use of --root and
--devtable together without issue.

A patch is forthcoming.

Regards,

Grant Erickson
