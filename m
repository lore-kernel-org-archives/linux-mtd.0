Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQtwJ-0002m0-81
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 07:32:28 +0000
Message-ID: <1395387117.5163.79.camel@sauron.fi.intel.com>
Subject: Re: Corrupt empty space
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Date: Fri, 21 Mar 2014 09:31:57 +0200
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAB4DAF@DBDE04.ent.ti.com>
References: <D2D3E4C4A672E847B422D1E5F695E1A402E61608@sreublc136.eu.labinal.snecma>
 <aadf057c868c47128845c19d69933c46@BLUPR08MB103.namprd08.prod.outlook.com>
 <1394524000.6302.217.camel@sauron.fi.intel.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB4DAF@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: HOUR =?ISO-8859-1?Q?Fr=E9deric?= <frederic.hour@safran-engineering.com>,
 Kent Li <Kent.Li@radisys.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-03-21 at 07:18 +0000, Gupta, Pekon wrote:
> It's still getting discussed in [a] and [b]. But there are multiple issues to it.
> 
>  (1) Many hardware controllers cannot parse ECC errors in blank-pages.
>    So, checking number of 0-bits in a page is done in software by comparing
>    each byte with 0xff.

OK.

> (2) Counting number of 0-bits in a page in software, brings down your read-performance.

UBIFS _only_ needs this when doing recovery, which is _only_ done after
unclean reboots, and this kind of reads would be done _only_ for a
couple of max I/O units and _only_ if there is a corrupted node in the
journal.

IOW, this would be done rarely, and for just few pages on mount.

-- 
Best Regards,
Artem Bityutskiy
