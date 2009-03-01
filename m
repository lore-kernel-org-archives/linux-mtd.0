Received: from yx-out-1718.google.com ([74.125.44.157])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LdmvG-0001ZT-TP
	for linux-mtd@lists.infradead.org; Sun, 01 Mar 2009 14:45:45 +0000
Received: by yx-out-1718.google.com with SMTP id 3so1130079yxi.72
	for <linux-mtd@lists.infradead.org>;
	Sun, 01 Mar 2009 06:45:41 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 1 Mar 2009 15:45:41 +0100
Message-ID: <52e42efe0903010645t7de56621t59de14626953e0fe@mail.gmail.com>
Subject: libubiio : userspace UBI input output library
From: Sidney Amani <seed95@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi list,

UBIIO library is an user-space library which exports same functions in
UBI Linux kernel module.
It provides exactly the same API as the kernel does, that way kernel
code can be used in user-space without any change.
The code is widely inspired with libubi source code.

Documentation can be found at http://uffs.org/api/libubiio.html
It is obviously the same as UBI kernel API, but there is actually few
differences in return values.

The code can be found at http://git.uffs.org/

We would like to know if you are interested in it and want to include
it in mtdutils.

Regards.

-- 
Sidney Amani
