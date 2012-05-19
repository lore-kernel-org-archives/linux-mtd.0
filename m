Received: from plane.gmane.org ([80.91.229.3])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SVhrT-0005y7-HX
 for linux-mtd@lists.infradead.org; Sat, 19 May 2012 11:30:16 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1SVhrI-0006Zx-JA
 for linux-mtd@lists.infradead.org; Sat, 19 May 2012 13:30:04 +0200
Received: from rain.gmane.org ([80.91.229.7])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Sat, 19 May 2012 13:30:04 +0200
Received: from eternaleye+usenet by rain.gmane.org with local (Gmexim 0.1
 (Debian)) id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Sat, 19 May 2012 13:30:04 +0200
To: linux-mtd@lists.infradead.org
From: Alex Elsayed <eternaleye+usenet@gmail.com>
Subject: Re: [PATCH] mtd: sm_ftl: fix typo in major number.
Date: Sat, 19 May 2012 04:28:20 -0700
Message-ID: <jp804k$r4o$3@dough.gmane.org>
References: <20120317175827.GB12111@agk-dp.fab.redhat.com>
 <1332008213-3940-1-git-send-email-maximlevitsky@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7Bit
Cc: linux-lvm@redhat.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Maxim Levitsky wrote:

> major == 0 allocates dynamic major, not major == -1

I would appreciate if this could be submitted for -stable, since the 
negative major number breaks LVM (regardless of whether any such devices are 
present). I found this out the hard way when my system failed to boot. 

-stable note: This is in Linus' tree as 
452380efbd72d8d41f53ea64c8a6ea1fedc4394d

For those who don't know (and potentially as a preface for -stable) the 
reason lies in LVM's filtering; in lib/filter/filter.c, lines 230-233:

        if ((line_maj <= 0) || (line_maj >= NUMBER_OF_MAJORS)) {
            blocksection = (line[i] == 'B') ? 1 : 0;
            continue;
        }

Basically, it scans through /proc/devices until it hits a line starting with 
'B', at which point it starts processing block major numbers and 
whitelisting them to be used as PVs. However, the negative number causes a 
problem because it a.) sorts to the top of the list and b.) short-circuits 
the if(). This causes blocksection to flip back to zero immediately, 
terminating the enumeration of permitted devices before any actually get 
whitelisted. As a result, *all* block devices are ignored, with messages 
such as

Skipping: Unrecognised LVM device type 259

259 being blkext, which LVM explicitly allows.
