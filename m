Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EMoZ6-0001uB-Dn
	for linux-mtd@lists.infradead.org; Tue, 04 Oct 2005 11:18:53 -0400
Message-ID: <43429D54.5010103@mw-itcon.de>
Date: Tue, 04 Oct 2005 17:18:44 +0200
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: size of ebs enabled image much bigger than original
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I wanted to test EBS for faster boot of my embedded system. I created a 
new rootfs with mkfs.jffs2 (mkfs.jffs2+sumtool from cvs today)

The image before sumtool has a size of about 3.7Mb. After sumtool it has 
5,9 Mb

Submitted commands:
mkfs.jffs2 -e 8448 -n -l -r act -o image1
sumtool -e 8448 -n -l -i image1 -o image2

Is this "normal"?

Best regards
Peter


-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
