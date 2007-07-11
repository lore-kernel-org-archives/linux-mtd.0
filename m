Received: from mga01.intel.com ([192.55.52.88])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I8f0T-0001qf-Rn
	for linux-mtd@lists.infradead.org; Wed, 11 Jul 2007 12:25:39 -0400
Message-ID: <46950472.7000103@intel.com>
Date: Wed, 11 Jul 2007 20:25:22 +0400
From: akorolev <alexey.korolev@intel.com>
MIME-Version: 1.0
To: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Why the alignemt to 4 bytes is necessary in jffs2_commit_write
	function
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All

I'm currently working on JFFS2 improving. I faced some issues with 
understanding why we need to align start offset to 4 bytes in 
jffs2_commit_write function?
Here is the part of this code:
=========================

    unsigned aligned_start = start & ~3;
    .........................................
    /* Adjust writtenlen for the padding we did, so we don't confuse our 
caller */
    if (writtenlen < (start&3))
        writtenlen = 0;
    else
        writtenlen -= (start&3);

===========================
What does the padding mean here?
If I properly understand the aligned_start is not related to offset of 
the fragment it is just offset within the file.  (Frag offset is aligned)
File offset is not necessary to keep aligned - so why not to kick off 
it. (I tried and didn't find anything wrong in tests).

Thanks,
Alexey
