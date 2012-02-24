Received: from antispam01.maxim-ic.com ([205.153.101.182])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S0xa8-0007Az-6W
 for linux-mtd@lists.infradead.org; Fri, 24 Feb 2012 16:01:17 +0000
From: Brian Foster <brian.foster@maxim-ic.com>
To: <linux-mtd@lists.infradead.org>
Subject: Re: UBIFS kernel oops
Date: Fri, 24 Feb 2012 16:58:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <201202241658.52516.brian.foster@maxim-ic.com>
Cc: nigel.hathaway@node-h.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nigel.hathaway wrote:
> We are seeing the following:
> 
> Oops[#1]:
>[ ... ]
> PrId  : 59019381 (MIPS 24Kc)

 Nice to see another MIPS user....!  ;-)

>[ ... ]
> The kernel version is 3.6.31.12 with real-time extensions [ ... ]

 This is a *guess*, and quite possibly not a very
 good one (Sorry!).  Do you have commits?:

   cd1510cb5 random: Remove unused inode variable
   a996996dd random: drop weird m_time/a_time manipulation

 We had a devil of a time on our 2.6.30 MIPS system
 with a very(!) *vaguely* similar-ish issue until I
 back-ported those commits.  They may already be in
 your 2.6.31, I'm not sure.

 I also back-ported two other commits, albeit these
 are not known to be related to any problems we had:

   b86a2c56e UBI: do not switch to R/O mode on read errors
   90bf0265e UBI: introduce new constants

 Very probably a Red Herring, Sorry!
cheers,
	-blf-

-- 
Brian Foster
Principal MTS, Software        |  La Ciotat, France
Maxim Integrated Products      |  Web:  http://www.maxim-ic.com/
