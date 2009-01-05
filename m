Received: from mail-bw0-f12.google.com ([209.85.218.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LJq3Z-0004uH-7H
	for linux-mtd@lists.infradead.org; Mon, 05 Jan 2009 14:03:49 +0000
Received: by bwz5 with SMTP id 5so16339680bwz.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 05 Jan 2009 06:03:47 -0800 (PST)
From: Corentin Chary <corentin.chary@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/3] Export UBI map/unmap/is_mapped in userspace
Date: Mon, 5 Jan 2009 14:58:16 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200901051458.17322.corentin.chary@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
These are three patch to make a usespace program able to use map/unmap 
operation and to query if a LEB is mapped.
We are trying to do an UBI based userspace filesystem (using fuse) and we 
needed these, but it could also be used for testing purpose.
CONFIG_MTD_UBI_DEBUG_USERSPACE_IO is needed to enable theses functions.

Thanks
