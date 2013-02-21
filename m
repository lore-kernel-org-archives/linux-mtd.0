Received: from xes-mad.com ([216.165.139.218])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U8dpK-0007mE-8v
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2013 21:37:14 +0000
Date: Thu, 21 Feb 2013 15:37:07 -0600 (CST)
From: Aaron Sierra <asierra@xes-inc.com>
To: Kumar Gala <galak@kernel.crashing.org>
Subject: [PATCH v2 0/3] mtd: fsl_upm: allow multiple UPM NAND devices
Message-ID: <845c17e0-715e-4c5d-b5ab-33658409c392@zimbra>
In-Reply-To: <b7a58ddf-050e-42ce-8490-85ee1d98f2a7@zimbra>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, Nate Case <ncase@xes-inc.com>,
 David Woodhouse <david.woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

v2: corrected authorship headings

These patches resolve issues discovered when using more than one
UPM NAND device on SMP systems:

[PATCH v2 1/3] powerpc/fsl_lbc: Synchronize MAR/MxMR writes
[PATCH v2 2/3] powerpc/fsl_lbc: Disable UPM interrupt
[PATCH v2 3/3] powerpc/fsl_lbc: Lock shared UPM resources
