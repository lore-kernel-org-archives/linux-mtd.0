Received: from gate.aminocom.com
	([193.132.141.181] helo=aminocom.com ident=0)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Tk4Y-0001f6-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jan 2002 13:37:46 +0000
Message-ID: <3C501070.F9A2043E@aminocom.com>
Date: Thu, 24 Jan 2002 13:47:28 +0000
From: Elizabeth Clarke <eclarke@aminocom.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: Nand flash: hang after erase
References: <3C4FFA62.505BD064@aminocom.com> <9294.1011878619@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

David Woodhouse wrote:
> What is erase->state? If the erase attempt has completed, either
> successfully or otherwise, it should be one of the two values which
> prevents the call to schedule().

erase->state is zero... nand_erase is not setting it appropriately. I
bunged in a line  instr->state = MTD_ERASE_DONE; on the way out and now
getting further. 

Beth
