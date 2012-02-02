Received: from antispam02.maxim-ic.com ([205.153.101.183])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rswal-0006Ur-U3
 for linux-mtd@lists.infradead.org; Thu, 02 Feb 2012 13:20:48 +0000
From: Brian Foster <brian.foster@maxim-ic.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH 1/2] libmtd: add `mtd_dev_present()' library function
Date: Thu, 2 Feb 2012 14:20:17 +0100
References: <1327689046-1450-1-git-send-email-computersforpeace@gmail.com>
 <1328182404.28171.161.camel@sauron.fi.intel.com>
In-Reply-To: <1328182404.28171.161.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <201202021420.18252.brian.foster@maxim-ic.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 02 February 2012 12:33:24 Artem Bityutskiy wrote:
> On Fri, 2012-01-27 at 10:30 -0800, Brian Norris wrote:
> > +int mtd_dev_present(libmtd_t desc, int mtd_num) {  [ ... ]
> 
> This will only work for relatively newer kernels where MTD has sysfs
> support (2.6.30+). Older kernels have no MTD sysfs support and the sysfs
> file you are stat()'ing won't exist, so this function will always return
> an error.

 This is a very plausible concern:  Our older system
 is mostly deployed with 2.6.26(or even older) kernel,
 albeit a 2.6.30 option exists.  It has multiple MTD
 devices, albeit due to the usage/configuration (and
 maybe the use of older mtd-utils?) I suspect the bug
 has never been observed.

 Our latest system uses 2.6.36, and is where the original
 UBI-related bug was observed.

cheers!
	-blf-

-- 
Brian Foster
Principal MTS, Software        |  La Ciotat, France
Maxim Integrated Products      |  Web:  http://www.maxim-ic.com/
