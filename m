Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5w3K-0007GN-Pl
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 09:23:59 +0000
Message-ID: <1331285175.22872.36.camel@sauron.fi.intel.com>
Subject: Re: UBI: infinite error loop
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Foster <brian.foster@maxim-ic.com>
Date: Fri, 09 Mar 2012 11:26:15 +0200
In-Reply-To: <201202241717.04475.brian.foster@maxim-ic.com>
References: <201202241717.04475.brian.foster@maxim-ic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Mime-Version: 1.0
Cc: kpa_info@yahoo.fr, linux-mtd@lists.infradead.org,
 matthieu.castet@parrot.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2012-02-24 at 17:16 +0100, Brian Foster wrote:
>  Also, keep in mind read-after-write checks don't work with subpages,
>  http://www.linux-mtd.infradead.org/faq/ubi.html#L_subpage_verify_fail
> ───────────────────────────────────────────────────────────
> I get "ubi_io_write: error -5 while writing 512 bytes to PEB 5:512"
> 
> If you have a 2048 bytes per NAND page device, and have
> CONFIG_MTD_NAND_VERIFY_WRITE enabled in your kernel,
> you will need to turn it off.  The code does not currently
> (as of 2.6.26) perform verification of sub-page writes
> correctly.  As UBI is one of the few users of sub-page
> writes, not much else seems to be affected by this bug.
> ───────────────────────────────────────────────────────────
> 
>  YES, I realize that is not your error, but this was
>  something that badly tripped us up until an intense
>  search-engine session ....  ;-\  (I have no idea if
>  this has since been fixed or not?)

Well, no one cares enough to investigate this and fix the issue. I think
this article should be removed - may be this will inspire someone to
send a fix...

-- 
Best Regards,
Artem Bityutskiy
