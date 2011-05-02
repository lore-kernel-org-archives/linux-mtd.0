Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QGm4j-0003te-44
	for linux-mtd@lists.infradead.org; Mon, 02 May 2011 05:53:42 +0000
Received: by pvh11 with SMTP id 11so3570165pvh.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 01 May 2011 22:53:38 -0700 (PDT)
Message-ID: <4DBE46DD.60406@gmail.com>
Date: Mon, 02 May 2011 11:23:33 +0530
From: Niraj Kulkarni <kulkarniniraj14@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Get NFTLrecord reference from mtd_blktrans_dev argument
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
         I've observed that in kernel 2.6.38 (and maybe in previous 
versions), in mtd_blktrans_ops callbacks provided by NFTL (nftlcore.c), 
reference to NFTLrecord struct is obtained by just typecasting given 
mtd_blktrans_dev. Though it works well, it highly position dependent 
method and may break for mtd_blktrans_dev struct change. Given that 
blktrans_dev struct already have a private field (void *priv) and it is 
uninitialized in nftl, is it ok to write a trivial patch to assign 
NFTLrecord pointer to mtd_blktrans_dev->priv?

Niraj
