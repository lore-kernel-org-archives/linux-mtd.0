Received: from tomts20.bellnexxia.net ([209.226.175.74] helo=tomts20-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cq8y-0005uB-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2002 17:28:12 +0100
Date: Thu, 8 Aug 2002 12:28:08 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: nur <nurpinar@basari.net.tr>
cc: linux-mtd@lists.infradead.org
Subject: Re: docprobe for millennium
In-Reply-To: <000701c23df1$a20ae1b0$3064000a@nurpinar>
Message-ID: <Pine.LNX.4.44.0208081226560.18509-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 7 Aug 2002, nur wrote:

> is there such a parameter for docprobe related to memory address of doc?
> dinfo results doc millennium at 0xe8000 while docprobe says no diskonchip
> found

This configuration item can be found inside the advanced DiskOnChip option 
of the kernel configuration menu.

Quoting linux-2.4.29-rc1 Documentation/Configure.help,

Physical address of DiskOnChip
CONFIG_MTD_DOCPROBE_ADDRESS
  By default, the probe for DiskOnChip devices will look for a
  DiskOnChip at every multiple of 0x2000 between 0xC8000 and 0xEE000.
  This option allows you to specify a single address at which to probe
  for the device, which is useful if you have other devices in that
  range which get upset when they are probed.

  (Note that on PowerPC, the normal probe will only check at
  0xE4000000.)

  Normally, you should leave this set to zero, to allow the probe at
  the normal addresses.


Ilguiz
