Received: from mga01.intel.com ([192.55.52.88])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HOl6b-0007Gd-F8
	for linux-mtd@lists.infradead.org; Tue, 06 Mar 2007 20:39:30 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: JFFS2 Support for Large Flash Designs
Date: Tue, 6 Mar 2007 17:38:04 -0800
Message-ID: <B1EDF20A6EAAD74EA65E46F774F17845FD6247@orsmsx413.amr.corp.intel.com>
In-Reply-To: <625fc13d0703061736t1a2fbddel7a80d04314136c1d@mail.gmail.com>
From: "Johnson, Charles F" <charles.f.johnson@intel.com>
To: "Josh Boyer" <jwboyer@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

What is this list's opinion of YAFFS ?=20


Charles Johnson
Ultra-Mobility Group
Platform Software Engineering
Intel Corporation
charles.f.johnson@intel.com
503-712-5181

-----Original Message-----
From: Josh Boyer [mailto:jwboyer@gmail.com]=20
Sent: Tuesday, March 06, 2007 5:37 PM
To: Johnson, Charles F
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Support for Large Flash Designs

On 3/6/07, Johnson, Charles F <charles.f.johnson@intel.com> wrote:
> My understanding is that JFFS2 does not support flash file systems
> larger than 4GB.  What would be the issues with supporting more than
4GB
> of NAND flash.

Creating JFFS3.  Or LogFS.  Seriously.  And support in MTD for devices >
4GiB.

To support more than 4GiB, you need to change the internal variables
used to track sizes and offsets.  But as I said before, the log
structured nature of JFFS2 will present practical limits long before
4GiB because JFFS2 scales linearly.  Scanning a 1GiB JFFS2 filesystem
can already take minutes depending on various factors such as CPU
speed and filesystem utilization.

LogFS is under work to avoid these scaling issues as it doesn't
require a full scan of flash.  JFFS3, when it comes about, will do
something similar from what I understand.

josh
