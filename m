Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AP6iy-000084-3D
	for <linux-mtd@lists.infradead.org>; Wed, 26 Nov 2003 20:57:24 +0000
Received: from mvista.com (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id MAA06851
	for <linux-mtd@lists.infradead.org>; Wed, 26 Nov 2003 12:55:47 -0800
Sender: ahennessy@mvista.com
Message-ID: <3FC51255.B02474BF@mvista.com>
Date: Wed, 26 Nov 2003 12:51:33 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: Oops in fault.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm getting an Oops with the latest code when I try to erase or mount
jffs2
on a MIPS board with NOR flash.  The mapping file  is using the generic
simple_map_init code.  Anyone else seeing this problem?

Alice
