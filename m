Received: from tiger.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17tem1-0008FF-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 02:46:02 +0100
Received: from there (203-96-48-213-tollfree.actrix.co.nz [203.96.48.213])
	by tiger.actrix.co.nz (Postfix) with SMTP id 6EC8B43F2
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 13:45:56 +1200 (NZST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: linux-mtd@lists.infradead.org
Subject: Interest in DOC and YAFFS?
Date: Tue, 24 Sep 2002 12:03:45 +1200
References: <200209231220.12682.ayalon@tadlys.com>
In-Reply-To: <200209231220.12682.ayalon@tadlys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020924014556.6EC8B43F2@tiger.actrix.co.nz>
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

Hi

I'm considering getting YAFFS working on DOC. I'm trying to gauge interest to 
prioritise vs other things.

If you don't know what YAFFS is, it's a NAND-specific  journalling file 
system. Ask Google for more info.

Currently YAFFS works with raw NAND (using software ecc), though some people 
have patched it to use hardware ecc, so I figure DOC support should be 
relatively simple. 

-- CHarles
