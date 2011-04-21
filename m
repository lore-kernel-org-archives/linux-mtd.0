Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QCvhn-0002li-Ew
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2011 15:22:07 +0000
Message-ID: <4DB04B81.5070408@parrot.com>
Date: Thu, 21 Apr 2011 17:21:37 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: strange bad block code
References: <4DB039C0.5030209@parrot.com>
In-Reply-To: <4DB039C0.5030209@parrot.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Matthieu CASTET a écrit :
> Hi,
> 
> while looking at the bad block code, I saw that e0b58d0a introduced a
> "chip->badblockbits" for bad block detection in nand_block_bad[1].
> That's great because to we can use it to handle bit flip in bad block marker.
> 
> But few commit latter c7b28e25cb9 removed "chip->badblockbits = 8;" from common
> code.
> So now chip->badblockbits = 0.
> 
> How such code wan works ?
> 
> Adding NAND_SKIP_BBTSCAN in any driver, expose the problem.
> 
BTW nand_block_bad seems broken with the new NAND_BBT_SCAN2NDPAGE and
NAND_BBT_SCANBYTE1AND6.
