Received: from creative.actrix.co.nz ([203.96.26.135])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16h3L4-0003pN-00
	for <linux-mtd@lists.infradead.org>; Sat, 02 Mar 2002 06:49:50 +0000
Received: from there (203-96-48-157-tollfree.actrix.co.nz [203.96.48.157])
	by creative.actrix.co.nz (Postfix) with SMTP id 622A7FF4
	for <linux-mtd@lists.infradead.org>; Sat,  2 Mar 2002 19:59:49 +1300 (NZDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: linux-mtd@lists.infradead.org
Subject: Looking for NAND emulation driver
Date: Sat, 2 Mar 2002 19:56:22 +1300
References: <20020301035814.6942.qmail@web14708.mail.yahoo.com> <6527.1014976322@redhat.com>
In-Reply-To: <6527.1014976322@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020302065949.622A7FF4@creative.actrix.co.nz>
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

Does a NAND emulation driver exist?

ie. something that lives in RAM, but conforms to NAND access rules with a 
NAND interface.

Such a beasty can be useful for various reasons:
* Can easly run this up on an x86 without flash hardware.
* Can be forced to fail (ECC) on demand for the pourposes of testing ECC 
recovery etc.

Thanx

-- CHarles
