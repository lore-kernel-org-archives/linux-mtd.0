Received: from qw-out-1920.google.com ([74.125.92.146])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LExCr-0002Gz-0W
	for linux-mtd@lists.infradead.org; Tue, 23 Dec 2008 02:41:13 +0000
Received: by qw-out-1920.google.com with SMTP id 4so897759qwk.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Dec 2008 18:41:11 -0800 (PST)
Message-ID: <1c3f4270812221841r5e70e3an4b254e784bc1cdbc@mail.gmail.com>
Date: Mon, 22 Dec 2008 18:41:11 -0800
From: Manoj <manoj23@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: NAND access question
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Hi,

Is there a linux requirement that a NAND controller should support
16-bit access? Can a controller live with doing 32-bit accesses and
then let the software retrieve the necessary bits.

Thanks.
