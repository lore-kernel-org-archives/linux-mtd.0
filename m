Received: from [210.12.154.247] (helo=gyex1-server.htwchina.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18K9BY-0003Qm-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Dec 2002 03:29:52 +0000
Subject: do five spare blocks need by jffs2 to write?
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 6 Dec 2002 12:00:58 +0800
Message-ID: <5FC65747E2D1354793F78EAC8A38A38837190A@szex1-server.sz.htwchina.com>
content-class: urn:content-classes:message
From: =?gb2312?B?eXV4aWFvZmVuZyjsts/+t+Up?= <yuxiaofeng@htwchina.com>
To: <linux-mtd@lists.infradead.org>
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

hello,all
	I have seen that jffs2 need five spare blocks to write and do such,is =
it still now?
	I mount my jffs2 filesystem ok,and lookup that ok,but  any operations =
such as rm,mkdir,write(create new file) it tell that "No space left on =
device".My device is 2M,and the jffs2 image is 1.9M,if such question =
exist,what should I do?
	thanks!
foehn
