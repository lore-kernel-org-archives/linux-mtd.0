Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BEFE2-0002wg-JV
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2004 23:20:50 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: Shen Aaron-r62966 <Aaron.Shen@motorola.com>,
	linux-mtd@lists.infradead.org
Date: Fri, 16 Apr 2004 10:30:31 +1200
References: <01139FC052A0D411900B00508B9535FC13AC4031@ZCH07EXM04.corp.mot.com>
In-Reply-To: <01139FC052A0D411900B00508B9535FC13AC4031@ZCH07EXM04.corp.mot.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20040415222038.ED38B16716@desire.actrix.co.nz>
Subject: Re: Bootloader for NAND flash with ecc and/or bad block checking
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 14 April 2004 15:41, Shen Aaron-r62966 wrote:
> Hi,
>
>   Anyone has the experience of NAND flash bootloader?
>   Could you send me a bootloader with ecc and/or bad block checking inside?
> I'd like to take it as a reference.


You could look at the YAFFS bootloader in YAFFS CVS and start with that as a 
kick-off.

-- CHarles
