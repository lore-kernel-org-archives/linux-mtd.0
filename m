Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1InIua-0001yz-NL
	for linux-mtd@lists.infradead.org; Wed, 31 Oct 2007 15:07:39 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: MTD Size Limit
Date: Wed, 31 Oct 2007 12:03:48 -0700
Message-ID: <B1EDF20A6EAAD74EA65E46F774F1784502C6D585@orsmsx413.amr.corp.intel.com>
From: "Johnson, Charles F" <charles.f.johnson@intel.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I hear about a size limit for the MTD layer due to a 32 bit size
variable. So is the limitation 4GBytes ??=20

If you partition a device using UBI, is this limiation then per
partition or is it still over the entire device??

Is there any effort to increase the limit.  Particularlly give the large
NAND flashes that are coming.

Charles Johnson
Ultra-Mobility Group
Platform Software Engineering
Intel Corporation
charles.f.johnson@intel.com
