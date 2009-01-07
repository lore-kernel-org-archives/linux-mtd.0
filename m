Received: from mail-bw0-f12.google.com ([209.85.218.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKUgh-00046j-Ha
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 09:26:56 +0000
Received: by bwz5 with SMTP id 5so18283790bwz.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Jan 2009 01:26:53 -0800 (PST)
Sender: Corentin Chary <corentin.chary@gmail.com>
From: Corentin Chary <corentincj@iksaif.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/3] Export UBI map/unmap/is_mapped in userspace v2
Date: Wed, 7 Jan 2009 10:22:46 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200901071022.46343.corentincj@iksaif.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,x
These are three patch to make a usespace program able to use map/unmap 
operation and to query if a LEB is mapped.
We are trying to do an UBI based userspace filesystem (using fuse) and we 
needed these, but it could also be used for testing purpose.
CONFIG_MTD_UBI_DEBUG_USERSPACE_IO is needed to enable theses functions.

The patch can also be download here:
http://xf.iksaif.net/dev/uffs/linux/ubi/


Thanks

--
Corentin Chary
http://xf.iksaif.net
