Received: from imo-d23.mx.aol.com ([205.188.139.137])
	by pentafluge.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DZ0l2-0008BV-1x
	for linux-mtd@lists.infradead.org; Fri, 20 May 2005 07:13:17 +0100
Received: from JobHunts02@aol.com
	by imo-d23.mx.aol.com (mail_out_v38_r1.7.) id 3.197.3f3af727 (1320)
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 May 2005 02:13:04 -0400 (EDT)
From: JobHunts02@aol.com
Message-ID: <197.3f3af727.2fbed9f0@aol.com>
Date: Fri, 20 May 2005 02:13:04 EDT
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Subject: Flash with boot blocks in kernel 2.4
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am working with kernel 2.4 on a board with two flash chips that have boot 
blocks, Intel Advanced Boot Block Flash Memory (28F320C3).  I just read that 
"the 2.4 CFI code handles only devices with uniform eraseblock size -- not the 
devices with 'boot blocks'. Current CVS fixes that for AMD chips, and it's 
trivial to do the same for Intel chips, now it's been done once," according to the 
MTD project leader. 

Does anyone know where on the web I can find these "trivial" changes for 
Intel chips? 

Thank you. 
