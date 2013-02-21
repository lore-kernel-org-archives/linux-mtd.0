Received: from xes-mad.com ([216.165.139.218])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U8d4v-0002uZ-N9
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2013 20:49:18 +0000
Date: Thu, 21 Feb 2013 14:49:02 -0600 (CST)
From: Aaron Sierra <asierra@xes-inc.com>
To: Kumar Gala <galak@kernel.crashing.org>
Subject: [PATCH 0/3] mtd: fsl_upm: allow multiple UPM NAND devices
Message-ID: <39f34d3f-7984-475c-85ca-01156797a479@zimbra>
In-Reply-To: <b76465b7-f4bc-40ec-b9ae-1abe9bd01f0c@zimbra>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, Nate Case <ncase@xes-inc.com>,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These patches resolve issues discovered when using more than one
UPM NAND device on SMP systems:

[PATCH 1/3] powerpc/fsl_lbc: Synchronize MAR/MxMR writes
[PATCH 2/3] powerpc/fsl_lbc: Disable UPM interrupt
[PATCH 3/3] powerpc/fsl_lbc: Lock shared UPM resources
