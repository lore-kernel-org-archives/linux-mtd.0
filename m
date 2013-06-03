Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UjRC5-000222-Ez
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2013 09:36:50 +0000
Message-ID: <1370252378.21714.28.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: mtdchar: Exit write loop when hitting end of OTP
 memory
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Christian Riesch <christian.riesch@omicron.at>
Date: Mon, 03 Jun 2013 12:39:38 +0300
In-Reply-To: <51A6103B.7010201@omicron.at>
References: <29483dd6-387c-4b28-b689-88795e0bbbde@mary.at.omicron.at>
 <1369811298.5446.215.camel@sauron.fi.intel.com>
 <51A60071.2060005@omicron.at>
 <1369835798.24286.34.camel@sauron.fi.intel.com>
 <51A6103B.7010201@omicron.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: kyungmin.park@samsung.com, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-05-29 at 16:27 +0200, Christian Riesch wrote:
> [cc'ed the author of onenand otp support]
> 
> On 2013-05-29 15:56, Artem Bityutskiy wrote:
> > On Wed, 2013-05-29 at 15:19 +0200, Christian Riesch wrote:
> >> The OTP code for the AMD command set in my recent patchset is modeled
> >> after the existing code in drivers/mtd/chips/cfi_cmdset_0001.c.
> >> Therefore it has a ...walk() function that walks from chip to chip and
> >> tries to write as much data as possible into the OTP memories of these
> >> chips. Until the last iteration of this loop it does not know how much
> >> OTP memory is available. Therefore, a check for insufficient OTP memory
> >> and returning an error before writing any data is not possible.
> >>
> >> Of course I could change my code to obtain the available OTP memory
> >> before writing any data. But then the code in cfi_cmdset_0001.c would
> >> still suffer from this issue.
> >
> > Could you please check OneNAND and other drivers which implement OTP and
> > see whether they check for space availability?
> 
> mtd->_write_user_prot_reg is currently implemented by 
> drivers/mtd/chips/cfi_cmdset_0001.c, drivers/mtd/onenand/onenand_base.c, 
> and drivers/mtd/devices/mtd_dataflash.c.
> 
> mtd_dataflash checks if the offset is larger than 64 and returns -EINVAL 
> in this case. If offset <= 64, but offset + len > 64, len is decreased 
> to fit into the OTP memory, the number of actually written bytes is 
> returned. It therefore suffers from the same issue in mtdchar.c as the 
> Intel command set.
> 
> onenand seems to do some kind of length check (although I do not fully 
> understand why it does not include the offset in 'from' in this check if 
> the factory OTP is addressed), but if the data does not fit into the 
> memory it returns 0 instead of an error code, resulting in an infinite 
> loop as well.

Would you be able to harmonize the implementations and switch them all
to the interface which is consistent with normal read/write, i.e., has
the retlen parameter?
 
-- 
Best Regards,
Artem Bityutskiy
