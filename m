Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FWkuc-0004Ww-H3
	for linux-mtd@lists.infradead.org; Thu, 20 Apr 2006 21:58:27 -0400
Message-ID: <44483C34.9020003@inf.u-szeged.hu>
Date: Fri, 21 Apr 2006 03:58:12 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Alexander Belyakov <alexander.belyakov@intel.com>
References: <20060406135055.BE6FA43AA1@ws5-1.us4.outblaze.com>	<200604070828.33546.h.schurig@mn-solutions.de>	<20060407081220.GE10831@localhost.localdomain>
	<4436211B.7020004@intel.com> <443638A3.1020807@inf.u-szeged.hu>
	<44449DFE.6040905@intel.com>
In-Reply-To: <44449DFE.6040905@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Holger Schurig <h.schurig@mn-solutions.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org
Subject: Re: Problem of "JFFS2 summary"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexander,

> Ferenc, I have just looked at Centralized summary patch. It seems it 
> is good idea to add check c->mtd->block_isbad against NULL before call 
> in jffs2_cs_build_filesystem_jeb() function. I understand that your 
> patch at the moment is for NAND only but someone, for example, may 
> have rootfs on NOR where block_isbad() method is not provided. Adding 
> that check you will just get message "...cs_block is not valid..." for 
> JFFS2 at NOR, otherwise Kernel panic.

We've updated the centralized summary patch. Now if it does not find 
block_isbad() (NOR), centralized summary will be disabled for that 
filesystem.

Thank for your feedback.

Ferenc
