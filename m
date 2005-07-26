Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DxNoI-0004xr-7F
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 07:41:28 -0400
Received: from localhost ([127.0.0.1] helo=eos.fwall.u-szeged.hu)
	by eos.fwall.u-szeged.hu with smtp (Exim 4.51) id 1DxNoG-0003XD-KW
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 13:41:20 +0200
Received: from eos.fwall.u-szeged.hu ([127.0.0.1])
	by eos.fwall.u-szeged.hu (SMSSMTP 4.0.0.59) with SMTP id
	M2005072613412014296
	for <linux-mtd@lists.infradead.org>; Tue, 26 Jul 2005 13:41:20 +0200
Received: from zsofi.inf.u-szeged.hu ([160.114.37.199]
	helo=mail.inf.u-szeged.hu)
	by eos.fwall.u-szeged.hu with esmtp (Exim 4.51) id 1DxNoG-0003XA-H5
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 13:41:20 +0200
Received: from [160.114.36.214] (kpax.inf.u-szeged.hu [160.114.36.214])
	by mail.inf.u-szeged.hu (Postfix) with ESMTP id 73C3B23969
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Jul 2005 13:41:20 +0200 (CEST)
Message-ID: <42E62254.9040806@inf.u-szeged.hu>
Date: Tue, 26 Jul 2005 13:45:24 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Subject: compressors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear All,

Artem's warned me about the compressors lzari and lzo, and he's right.

We adopted them for JFFS2 some years ago, but now they are unused
because have no good performance, have messy code and licence problems.
I think it's time to delete it from CVS. If nobody cares I remove it. I
think we should consider to remove compressor rubin, also.

Bye,
Ferenc
