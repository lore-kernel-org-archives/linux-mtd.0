Received: from wa-out-1112.google.com ([209.85.146.181])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1If8DC-0001hF-W4
	for linux-mtd@lists.infradead.org; Tue, 09 Oct 2007 07:05:03 +0100
Received: by wa-out-1112.google.com with SMTP id v33so1806845wah
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Oct 2007 23:04:37 -0700 (PDT)
Message-ID: <8bf247760710082304t5e70e46cn33545eb0447104b@mail.gmail.com>
Date: Tue, 9 Oct 2007 11:34:37 +0530
From: Ram <vshrirama@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: different partitions using different ECC
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
   How do we support a sceneario where different mtd partitions use
different ECC algorithms?.

   Say /dev/mtd1 - uses hardware ecc
         /dev/mtd2 - uses software ecc.

 I know this is a  nand drivers function. has anyone tried this before?.

 Regards,
sriram
