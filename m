Received: from tiger.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17f2PJ-0000bF-00
	for <linux-mtd@lists.infradead.org>; Wed, 14 Aug 2002 18:58:10 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: Tino Keitel <tino.keitel@innominate.com>,
	linux-mtd@lists.infradead.org
Subject: Re: Bad blocks on NOR flash
Date: Thu, 15 Aug 2002 05:50:58 +1200
References: <20020814070204.GA16910@tkeitel001.bln.gelonet.local>
In-Reply-To: <20020814070204.GA16910@tkeitel001.bln.gelonet.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020814175805.5EFDE45D1@tiger.actrix.co.nz>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, 14 Aug 2002 19:02, Tino Keitel wrote:
> Hi folks,
>
> if I got this right, JFFS2 has bad block handling only for NAND
> flashes. I have also read that NAND flashes could be shipped with bad
> blocks whereas NOR flashes don't. Does this mean that there nevver will
> be something like a bad block on a NOR flash?

NOR is shipped with all blocks good. However, NOR does start to fail with use 
- hence the endurance limit of 100k~1M erasure cycles. Thus, with extended 
erasure NOR does start to fail. Some file systems will retire these blocks. I 
don't recall whether JFFS does or not.

The reason behind this difference is that NOR is linearly memory mapped and 
is thus not very suited to having holes. NAND is page accessed and managed on 
a per block basis. This makes it far more suited to supporting bad blocks. 
Allowing bad blocks increases yield and thus lowers cost as well as allowing 
higher densities.

-- CHarles
