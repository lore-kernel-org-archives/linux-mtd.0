Received: from mgw-x3.nokia.com ([131.228.20.26])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CMNoz-0007EN-Sl
	for linux-mtd@lists.infradead.org; Tue, 26 Oct 2004 05:40:57 -0400
Date: Tue, 26 Oct 2004 12:29:28 +0300
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Message-ID: <20041026092928.GA23914@angel.research.nokia.com>
References: <41767593.9030004@inf.u-szeged.hu>
	<1098365059.13633.1257.camel@hades.cambridge.redhat.com>
	<41781683.3020602@inf.u-szeged.hu> <4179009D.8010409@oktetlabs.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
In-Reply-To: <4179009D.8010409@oktetlabs.ru>
Sender: <jlavi@angel.research.nokia.com>
Cc: ext Artem Bityuckiy <dedekind@oktetlabs.ru>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I tried to see with jffs2dump how much Inodes and Dirents I have on
root filesystem on Arm testbed. Quick and dirty Perl script attached.
This isn't accurate as the calculated total image size misses at least
the final padding on the last erase block.

The size of the plain JFFS2 image is 31.1 MiB. The root fs consists of
all applications and libraries and no user data.

  $ jffs2dump -c rootfs.jffs2 | perl jffs2stats.pl
  Number of dirents:   6144.
   Total dirent node space:  304911 (0.9%)
   Average dirent len: 49.6
   Total dirent name space:  76671
   Average name len:   12.5

  Number of Inodes:    21197
   Total Inode space:  32254866 (99.1%)
   Average Inode size: 1521.7

  Padding:        37326 0.1%
  Total image size: 32559777
  $ ls -l rootfs.jffs2
  -rw-r--r--  1 root root 32597104 Oct 20 15:11 rootfs.jffs2

With sumtool the image size grows to 31.8 MiB

  $ jffs2dump -c rootfs-sum.jffs2 | perl jffs2stats.pl
  Number of dirents:   6144.
   Total dirent node space:  304911 (0.9%)
   Average dirent len: 49.6
   Total dirent name space:  76671
   Average name len:   12.5

  Number of Inodes:    21197
   Total Inode space:  32254866 (97.2%)
   Average Inode size: 1521.7

  Number of Inode Summary nodes:  251
   Total Inode Sum space: 631524, (1.9%)
   Average Sum node size: 2516.0

  Padding:        153063 0.5%
  Total image size: 33191301
  $ ls -l rootfs-sum.jffs2
  -rw-r--r--  1 root root 33423360 Oct 20 15:23 rootfs-sum.jffs2


If dentries were stored just as they are (unstripped and uncompressed)
in the summary, the summary size would grow by 50% to about 3% of the
whole image size.

On Fri, Oct 22, 2004 at 04:44:13PM +0400, ext Artem Bityuckiy wrote:
> I believe that if we have directory references in summaries, this will 
> increase the mount speed.
> 
> 1. At first, we will store fewer data! We don't need to keep the common 
> headers, CRCs and mctimes.
> 2. At the second, we may compress summary (direntries aren't compressed)!
> 3. And the third, on NAND there is difference between reading lots of 
> different pages or few pages.


I tried Ferenc's earlier mount time patch in August and the 52s mount
time dropped then to 14s. If I understand right, inodes and dentries
were then mixed in the erase block and the summary was for inodes
only.  This shows reading dentries from semirandom places is
expensive.

Ferenc's latest patch put dentries on their own erase block in
consecutive order.  Considering only the read efficiency from the
media, reading consecutive, uncompressed, and unstripped dentries from
a summary should cost no more than reading them from dedicated erase
block.

Jarkko Lavinen

--8t9RHnE3ZwKMSgU+
Content-Type: text/x-perl; charset=us-ascii
Content-Disposition: attachment; filename="jffs2stats.pl"

#! /usr/bin/perl

$EBLOCKSIZE=131072;

$dirents = $totdirentlen = $totnamelen = 0;
$inodes = $totinodelen = 0;
$sumnodes = $totsumnodelen = 0;
$totpadlen = 0;
$gaps = $totgaplen = 0;
$nextaddr = 0;

sub checkpadding {
    my ($addr, $totlen) = @_;

    my $len = hex($addr) - $nextaddr;

    if ($len > 0) {
	if (hex($addr) % $EBLOCKSIZE == 0 || $len <= 3) {
	    $totalpadlen += $len;
	} else {
	    print sprintf "Gap seen at %08x .. $addr, length $len\n", $nextaddr;

	    $gaps++;
	    $totgaplen += hex($addr) - $nextaddr;
	}
    }

    $nextaddr = hex($addr) + hex($totlen);
}

while(<>) {
    chop;
    if (/^\s+Dirent/) {
	die "Cannot parse $_" if (! /^ \s+ 
				  Dirent     \s+ 
				  node \s at \s+ (\w+), \s+ 
				  totlen     \s+ (\w+), \s+ 
				  \#pino     \s+ (\w+), \s+ 
				  version    \s+ (\w+), \s+ 
				  \#ino      \s+ (\w+), \s+ 
				  nsize      \s+ (\w+), \s+
				  name       \s+ (.*) 
				  $/x);

	my ($addr, $totlen, $pino, $version, $ino, $nsize, $name) = ($1, $2, $3, $4, $5, $6, $7);
	&checkpadding($addr, $totlen);

	$dirents++;
	$totdirentlen += hex($totlen);
	$totnamelen += hex($nsize);
    } elsif (/^\s+Inode Sum/) { 
	die "Cannot parse $_" if (! /^ \s+ 
				  Inode \s Sum \s+
				  node \s at          \s+ (\w+), \s+
				  totlen              \s+ (\w+), \s+
				  sum_num             \s+ (\w+), \s+
				  cleanmarker \s size \s+ (\w+)  \s*
				  $/x);

	my ($addr, $totlen, $sum_num, $cleanmarksize) = ($1, $2, $3, $4);
	&checkpadding($addr, $totlen);
	
	$sumnodes++;
	$totsumnodelen += hex($totlen);
    } elsif (/^\s+Inode/) {
	die "Cannot parse $_" if (! /^ \s+ 
				  Inode \s+
				  node \s at \s+ (\w+), \s+
				  totlen     \s+ (\w+), \s+
				  \#ino      \s+ (\w+), \s+
				  version    \s+ (\w+), \s+
				  isize      \s+ (\w+), \s+
				  csize      \s+ (\w+), \s+ 
				  dsize      \s+ (\w+), \s+
				  offset     \s+ (\w+)  \s*
				  $/x);

	my ($addr, $totlen, $ino, $version, $isize, $csize, $dsize, $offset) = ($1, $2, $3, $4, $5, $6, $7, $8);
	&checkpadding($addr, $totlen);

	$inodes++;
	$totinodelen += hex($totlen);
    } else {
	die "Cannot parse $_";
    }
}

$totalsize = $totdirentlen + $totinodelen + $totsumnodelen + $totpadlen + $totgaplen;

print "Number of dirents:\t$dirents.\n";
print sprintf " Total dirent node space:\t$totdirentlen (%.1f%%)\n", 100.0*$totdirentlen/$totalsize;
print " Average dirent len:\t", sprintf("%.1f", $totdirentlen/$dirents), "\n" if ($dirents > 0);
print " Total dirent name space:\t$totnamelen\n";
print sprintf(" Average name len:\t%.1f\n", $totnamelen/$dirents) if ($dirents > 0);
print "\n";
print "Number of Inodes:\t$inodes\n";
print sprintf " Total Inode space:\t$totinodelen (%.1f%%)\n", 100.0*$totinodelen/$totalsize;
print " Average Inode size:\t", sprintf("%.1f", $totinodelen/$inodes), "\n" if ($inodes > 0);

if ($sumnodes) {
    print "\n";
    print "Number of Inode Summary nodes:\t$sumnodes\n";
    print sprintf " Total Inode Sum space:\t$totsumnodelen, (%.1f%%)\n", 100.0*$totsumnodelen/$totalsize;
    print " Average Sum node size:\t", sprintf("%.1f", $totsumnodelen/$sumnodes), "\n";
}

print sprintf "\nPadding:\t$totalpadlen %.1f%%\n", 100.0*$totalpadlen/$totalsize;

print "Total image size: $totalsize\n";

--8t9RHnE3ZwKMSgU+--
