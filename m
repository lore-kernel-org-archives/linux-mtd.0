Received: from pd953ab88.dip.t-dialin.net ([217.83.171.136] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16h4Qt-0003uS-00
	for <linux-mtd@lists.infradead.org>; Sat, 02 Mar 2002 07:59:55 +0000
Message-Id: <200203020814.g228EMl28086@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: manningc2@actrix.gen.nz, linux-mtd@lists.infradead.org
Subject: Re: Looking for NAND emulation driver
Date: Sat, 2 Mar 2002 09:14:21 +0100
References: <20020301035814.6942.qmail@web14708.mail.yahoo.com> <6527.1014976322@redhat.com> <20020302065949.622A7FF4@creative.actrix.co.nz>
In-Reply-To: <20020302065949.622A7FF4@creative.actrix.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Samstag, 2. März 2002 07:56 , Charles Manning wrote:
> Does a NAND emulation driver exist?
> ie. something that lives in RAM, but conforms to NAND access rules with a
> NAND interface.
> Such a beasty can be useful for various reasons:
> * Can easly run this up on an x86 without flash hardware.
> * Can be forced to fail (ECC) on demand for the pourposes of testing ECC
> recovery etc.
Good idea, but I don't about such a hack. 
-- 
Thomas

Thomas Gleixner <gleixner@autronix.de>
autronix automation http://www.autronix.de
