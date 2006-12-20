Received: from nf-out-0910.google.com ([64.233.182.186])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Gx3Vc-0003Bm-Uy
	for linux-mtd@lists.infradead.org; Wed, 20 Dec 2006 10:37:35 -0500
Received: by nf-out-0910.google.com with SMTP id i2so1317510nfe
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Dec 2006 07:37:29 -0800 (PST)
Message-ID: <777da1740612200737w42e9f1f0w3d6be624ef72b256@mail.gmail.com>
Date: Wed, 20 Dec 2006 15:37:24 +0000
From: "Tom Rathbone" <tom.rathbone@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Physmap, exposing a master partition/device.
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

Using physmap partitions I'd like to be able to write to my flash
device as a whole and also access it as partitions.  This way under
usual operation I can use the partitions and when doing a full
re-flash I can write the whole device including the partition table
and can also write across partition boundaries.

In comments in mtdpart.c I have seen this:

--

/*
  * This function, given a master MTD object and a partition table, creates
  * and registers slave MTD objects which are bound to the master according to
 * the partition definitions.
  * (Q: should we register the master MTD object as well?)
 */

int add_mtd_partitions(struct mtd_info *master,

--

What changes would be required to include a master partition? Can I do
this separately using add_mtd_device? Alternatively is there a way to
unpartition the flash from userspace?

Thanks,

Tom.
