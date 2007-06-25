Received: from e35.co.us.ibm.com ([32.97.110.153])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I2uRZ-0006rS-Qw
	for linux-mtd@lists.infradead.org; Mon, 25 Jun 2007 20:41:50 +0100
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e35.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l5PJfcnc019809
	for <linux-mtd@lists.infradead.org>; Mon, 25 Jun 2007 15:41:38 -0400
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l5PJfcXT154190
	for <linux-mtd@lists.infradead.org>; Mon, 25 Jun 2007 13:41:38 -0600
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l5PJfcv1015967
	for <linux-mtd@lists.infradead.org>; Mon, 25 Jun 2007 13:41:38 -0600
Subject: Re: CRAMFS and checksum.
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Janesh Ramakrishnan <jramakrishnan@neuropace.com>
In-Reply-To: <895730900BBE6943B639D089EC50B1140416D1@bodega.neuropace.com>
References: <895730900BBE6943B639D089EC50B1140416D1@bodega.neuropace.com>
Content-Type: text/plain
Date: Mon, 25 Jun 2007 14:41:37 -0500
Message-Id: <1182800497.20939.0.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-06-25 at 11:20 -0700, Janesh Ramakrishnan wrote:
> Is there a cramfs based checksum on the data that is being stored on the MTD where the cramfs mounts ? Say, there is some data on MTD device 2 and the kernel mounts the cramfs image on MTD device 2 and is there any mechanism to verify that the data on the cramfs image hasn't been compromised?

No.

josh
