Received: from dragon.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GZrL-00022t-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2002 07:10:16 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: shadow <saturn@structure.biochem.nchu.edu.tw>,
	linux-mtd@lists.infradead.org
Subject: Re: SmartMedia Card need to create fs before mounting it ?
Date: Tue, 26 Nov 2002 20:36:02 +1300
References: <Pine.LNX.4.44.0211260227090.20149-100000@structure.biochem.nchu.edu.tw>
In-Reply-To: <Pine.LNX.4.44.0211260227090.20149-100000@structure.biochem.nchu.edu.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20021126074041.D763F14C8B@dragon.actrix.co.nz>
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

On Tue, 26 Nov 2002 08:34, shadow wrote:
> Hi.
> When I mount a partition on the SmartMedia card, if I must need to put a
> jffs2's image on it before mounting it ? Or existed a tool that can
> directly make jffs2 on the nand flash ?

I believe you will need to run mkfs.jffs2 to format the nand first.

You will find this in mtd/util in the mtd cvs.

-- CHarles
