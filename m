Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DmygY-0003Mz-DP
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2005 14:50:25 -0400
Message-ID: <42C04A65.5040804@ieee.org>
Date: Mon, 27 Jun 2005 14:50:13 -0400
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: Brian O'Dell <brian@clarionsensing.com>
References: <42C03FFB.3080208@clarionsensing.com>
In-Reply-To: <42C03FFB.3080208@clarionsensing.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOCBoot doesn't compile
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian O'Dell wrote:
> I get the following error when compiling DOCBoot :
> 
> doc_bootstub.o(.text+0x131): In function `doc_cmd':
> : undefined reference to `BX_CDSN_IO'
> 
> I have googled and grepped for BX_CDSN_IO with no results.  Any 
> thoughts?  Has anyone successfully compiled the most recent docboot?

Ack! My fault.  I somehow forgot to check in doc_bootstub.h

Checked in now.  Please let me know if that fixes the problem.  Or if it 
doesn't.

	-Dan
