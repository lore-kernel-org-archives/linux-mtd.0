Received: from [200.80.204.2] (helo=mailserver.hasar.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AcTaj-00072d-LO
	for linux-mtd@lists.infradead.org; Fri, 02 Jan 2004 18:00:10 +0000
Received: from unknown (HELO hasar.com) ([192.0.2.190])
          (envelope-sender <esabaj@hasar.com>)
          by 0 (qmail-ldap-1.03) with SMTP
          for <linux-mtd@lists.infradead.org>; 2 Jan 2004 17:57:42 -0000
Message-ID: <3FF5B18D.EC80AA1D@hasar.com>
Date: Fri, 02 Jan 2004 14:59:41 -0300
From: Eduardo Sabaj <esabaj@hasar.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: [Fwd: Re: [ECOS] JFFS2]
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear sir,

I would be grateful if you could answer some of questions that are
indicated below ...
On top of that, could you please tell me what other file systems (and on
which media - flash, disk, etc) are supported by eCos?

Thanks for all,

Eduardo

-------- Original Message --------
Subject: Re: [ECOS] JFFS2
Date: 02 Jan 2004 09:17:31 -0700
From: Gary Thomas <gary@mlbassoc.com>
Organization: MLB Associates
To: Eduardo Sabaj <esabaj@hasar.com>
CC: ecos-discuss@sources.redhat.com
References: <3FF59306.6704AE5B@hasar.com>

On Fri, 2004-01-02 at 08:49, Eduardo Sabaj wrote:
> I am interested in building an embedded application using the eCos, but
> I have some questions about it.. I read that one of the file systems
> that is supported is JFFS2 but the question is, if it is a file system
> that runs only over a flash device (can I have a JFFS2 file system on
> DiskOnModule?)
> On the other hand, I wonder if  JFFS2 is well protected over power fails
> (I mean if the file system avoid losing information after the power
> fail) ?

This question would probably be better answered by the folks that
support JFFS2 - try linux-mtd@lists.infradead.org

JFFS2 should work with most any type of FLASH device, but AFAIK there
are no drivers currently available for DiskOnModule for eCos (but you
should be able to write them).  As for persistence, JFFS2 stands for
"Journaling Flash File System v2", which means that data is kept in
a journaled fashion and should be safe to recover, even after a
power failure.

Again, discuss this with the MTD/JFFS2 folks for the best advice.

-- 
Gary Thomas <gary@mlbassoc.com>
MLB Associates


-- 
Before posting, please read the FAQ: http://sources.redhat.com/fom/ecos
and search the list archive: http://sources.redhat.com/ml/ecos-discuss
