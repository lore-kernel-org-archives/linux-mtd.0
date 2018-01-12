Received: from faraday.heklatech.com ([89.221.255.157])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZnEX-0008SG-3h
 for linux-mtd@lists.infradead.org; Fri, 12 Jan 2018 00:30:11 +0000
Received: from [127.0.0.1] (helo=fessender.localnet)
 by faraday.heklatech.com with esmtp (Exim 4.89)
 (envelope-from <gudjon@gudjon.org>) id 1eZnEK-00083X-Ad
 for linux-mtd@lists.infradead.org; Fri, 12 Jan 2018 00:29:56 +0000
From: "Gudjon I. Gudjonsson" <gudjon@gudjon.org>
To: linux-mtd@lists.infradead.org
Reply-To: gudjon@gudjon.org
Subject: ECC configuration of NAND from Linux  (MEMSETOOBSEL)
Date: Fri, 12 Jan 2018 01:29:55 +0100
Message-ID: <2132429.fBNFCxDbQz@fessender>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi list

I am trying to upgrade a few embedded Linux systems remotely 
and increasing the number of ECC bits at the same time.

I read your FAQ and found the reference to ioctl (MEMSETOOBSEL) [1]
but it seems to be removed from the kernel.
/*
 * Note, the following ioctl existed in the past and was removed:
 * #define MEMSETOOBSEL           _IOW('M', 9, struct nand_oobinfo)
 * Try to avoid adding a new ioctl with the same ioctl number.
 */
I assume this is an error in the documentation but I wonder if you
know any solution to my problem?

Regards
Gudjon

[1] http://www.linux-mtd.infradead.org/faq/nand.html
