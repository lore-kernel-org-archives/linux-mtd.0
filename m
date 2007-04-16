Received: from pop.scorch.co.nz ([203.167.210.162] helo=firstline.co.nz)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HdXZl-0004GJ-R0
	for linux-mtd@lists.infradead.org; Mon, 16 Apr 2007 16:13:27 -0400
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: Re: NAND device ID 0xd5 appears twice in nand_ids.c table
Date: Tue, 17 Apr 2007 08:20:11 +1200
References: <6334E09627481B4AA5C8DE1E69E19D3B06BF96E0@SSLEXCHANGE.solomonsystech.com>
In-Reply-To: <6334E09627481B4AA5C8DE1E69E19D3B06BF96E0@SSLEXCHANGE.solomonsystech.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200704170820.11068.manningc2@actrix.gen.nz>
Cc: sasin@solomon-systech.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 16 April 2007 21:41, sasin@solomon-systech.com wrote:
> NAND device ID 0xd5 appears for a 4MiB device as well as for a 2GiB
> device.  So when the new 2GiB device is used, it is detected as the
> older 4MiB device.  Should other ID bytes perhaps be used to
> differentiate between the two?  This problem will continue as older
> device IDs are reused in newer devices.

Can't the devices be differentiated by reading the part's geometry info?
