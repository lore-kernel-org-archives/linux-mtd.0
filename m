Received: from rwcrmhc52.attbi.com ([216.148.227.88])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17zyg6-0005mL-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 Oct 2002 13:14:02 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: Robert Sprockeels <robert.sprockeels@boat.be>,
 linux-mtd@lists.infradead.org
Subject: Re: DoC trouble on wafer PC
Date: Fri, 11 Oct 2002 08:12:34 -0400
References: <1034333338.2619.81.camel@roadie.boat.be>
In-Reply-To: <1034333338.2619.81.camel@roadie.boat.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20021011121330.SMCL11063.rwcrmhc52.attbi.com@there>
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

Robert,

The /dev/nftla entries in Bering rc3 are not correct.  Try changing them to 
93, x:

brw-rw----    1 root     root      93,   0  Jan 24  2002 nftla
brw-rw----    1 root     root      93,   1  Jan 24  2002 nftla1
brw-rw----    1 root     root      93,   2  Jan 24  2002 nftla2
brw-rw----    1 root     root      93,   3  Jan 24  2002 nftla3
brw-rw----    1 root     root      93,   4  Jan 24  2002 nftla4

Mark

Robert Sprockeels wrote:
> I try this with LEAF Bering rc3 (leaf.sourceforge.net), an embedded
> Linux with kernel version 2.4.18. I use the modules approach, since this
> allows me to "play around until it works" ;-)
>
> # sfdisk -l /dev/nftla
> /dev/nftla: Device not configured
