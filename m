Received: from xes-mad.com ([216.165.139.218])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U8df3-0007I9-MJ
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2013 21:26:38 +0000
Date: Thu, 21 Feb 2013 15:26:23 -0600 (CST)
From: Aaron Sierra <asierra@xes-inc.com>
To: Nate Case <ncase@xes-inc.com>
Subject: Re: [PATCH 0/3] mtd: fsl_upm: allow multiple UPM NAND devices
Message-ID: <ecc7a0f6-5180-4b2f-98c0-46ebe18d03a9@zimbra>
In-Reply-To: <39f34d3f-7984-475c-85ca-01156797a479@zimbra>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, Kumar Gala <galak@kernel.crashing.org>,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> These patches resolve issues discovered when using more than one
> UPM NAND device on SMP systems:
> 
> [PATCH 1/3] powerpc/fsl_lbc: Synchronize MAR/MxMR writes
> [PATCH 2/3] powerpc/fsl_lbc: Disable UPM interrupt
> [PATCH 3/3] powerpc/fsl_lbc: Lock shared UPM resources

I messed up the git attribution at the head of each of these
three patches; "Author:" should be "From:". I will resubmit.

-Aaron S.
