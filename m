Received: from rproxy.gmail.com ([64.233.170.205])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CePiV-00083P-3D
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2004 22:20:44 -0500
Received: by rproxy.gmail.com with SMTP id j1so834878rnf
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Dec 2004 19:20:41 -0800 (PST)
Message-ID: <c3d0340b041214192038f70c2e@mail.gmail.com>
Date: Tue, 14 Dec 2004 19:20:40 -0800
From: Shawn Jin <shawnxjin@gmail.com>
To: linuxmtd <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: 2.6.x cannot mount the root fs on a jffs2 image?
Reply-To: Shawn Jin <shawnxjin@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Can 2.6.x mount the root fs on a jffs2 image? After a while of
research by googling, I found that do_mounts.c was re-written quite a
lot compared with 2.4.x. In 2.4.x there is root_dev_names specifying
all devices can be mounted as the root fs. But there isn't such a
struct any more. Probably root_device_name is the sibling?

How to add jffs2 support in do_mounts.c?

Thanks,
-Shawn.
