Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JN9bd-0003Vn-Qo
	for linux-mtd@lists.infradead.org; Thu, 07 Feb 2008 16:28:17 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JN9bZ-00032g-ND
	for linux-mtd@lists.infradead.org; Thu, 07 Feb 2008 16:28:06 +0000
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Feb 2008 16:28:05 +0000
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Feb 2008 16:28:05 +0000
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Subject: Re: mtdblock mount issue
Date: Thu, 7 Feb 2008 16:28:00 +0000 (UTC)
Message-ID: <loom.20080207T155530-907@post.gmane.org>
References: <47A71EF4.2090202@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> I am trying to mount a cramfs partition from flash. 

A word of warning. CRAMFS is broken in kernels < 2.6.18. As far as I can tell,
under heavy load (e.g. reading multiple files in parallel that are not cached)
it may fail with decompression errors. I think the issue is not exactly with
cramfs but with some interaction with page cache. Backporting just cramfs files
to 2.6.15 did not help. If you have drop_caches interface (kernel > 2.6.16 or
just backport it) it is easy to reproduce. Otherwise it happens _very_
infrequently because most of the time files are already cached. However the
consequences are severe - corrupted executables, etc.
Here is a script to reproduce the problem:

===============================================
# Copy large file from cramfs to tmpfs
cp /bin/smbd /tmp/

# First concurrent access to files/directories 
while [ 1 ]; do cat /bin/* > /dev/null; done &

# Second concurrent access to test file and cache flush
for((i=0;i<99999;i++)) do echo -n "cycle=$i "; 
  cmp /bin/smbd /tmp/smbd ; 
  echo 3 > /proc/sys/vm/drop_caches ; 
done
===============================================

Note that /bin is in cramfs. smbd can be any large file.
I've also seen statements that drop_caches interface is not 100% reliable.
Nevertheless I have experienced decompression errors even without forcing 
cache purge.
Above script has caused failures on PowerPC/2.6.16 and ARM9/2.6.15.
2.6.18 and 2.6.23 seem ok.

Regards,

Sergei 

P.S. Yes, cramfs has little to do with MTD but since ppl here use it with flash
I felt it was a good idea to post this warning.
