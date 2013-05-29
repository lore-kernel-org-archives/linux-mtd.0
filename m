Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhgpI-0006sf-UT
 for linux-mtd@lists.infradead.org; Wed, 29 May 2013 13:54:05 +0000
Message-ID: <1369835798.24286.34.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: mtdchar: Exit write loop when hitting end of OTP
 memory
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Christian Riesch <christian.riesch@omicron.at>
Date: Wed, 29 May 2013 16:56:38 +0300
In-Reply-To: <51A60071.2060005@omicron.at>
References: <29483dd6-387c-4b28-b689-88795e0bbbde@mary.at.omicron.at>
 <1369811298.5446.215.camel@sauron.fi.intel.com>
 <51A60071.2060005@omicron.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-05-29 at 15:19 +0200, Christian Riesch wrote:
> The OTP code for the AMD command set in my recent patchset is modeled 
> after the existing code in drivers/mtd/chips/cfi_cmdset_0001.c. 
> Therefore it has a ...walk() function that walks from chip to chip and 
> tries to write as much data as possible into the OTP memories of these 
> chips. Until the last iteration of this loop it does not know how much 
> OTP memory is available. Therefore, a check for insufficient OTP memory 
> and returning an error before writing any data is not possible.
> 
> Of course I could change my code to obtain the available OTP memory 
> before writing any data. But then the code in cfi_cmdset_0001.c would 
> still suffer from this issue.

Could you please check OneNAND and other drivers which implement OTP and
see whether they check for space availability?

On the first glance, I'd say that 0001 should be amended as well. But if
all OTP writers behave this way, then may be we can document this
clearly at least somewhere in a commentary.

-- 
Best Regards,
Artem Bityutskiy
