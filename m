Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZfYC-00030n-ON
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 08:46:14 +0000
Received: by pwi3 with SMTP id 3so1270055pwi.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 01:46:08 -0700 (PDT)
Subject: Re: Problem with clean markers/partial writes on Micron 4-bit ECC NAND
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Peter Barada <peter.barada@gmail.com>
Date: Thu, 23 Jun 2011 11:46:52 +0300
In-Reply-To: <4DFB9458.1030304@gmail.com>
References: <4DFB9458.1030304@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308818817.18119.103.camel@sauron>
Mime-Version: 1.0
Cc: Eric Nelson <eric.nelson@logicpd.com>, linux-mtd@lists.infradead.org,
	Peter Barada <peter.barada@logicpd.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-06-17 at 13:52 -0400, Peter Barada wrote:
> I'm using a 2K page Micron NAND that has an internal 4-bit ECC engine.
> 
> The Micron NAND chip uses 8-bytes per 512 bytes of main data area + 4 
> bytes of the OOB.  This allows the 32 bytes of ECC to correct 2048 bytes 
> of the main data area and 16 bytes of the OOB area.
> 
> The problem I'm running into with JFFS2 is that empty flash is first 
> marked with a clean marker into the OOB, and then a 2nd write to the 
> main data area is done (w/o an intervening erase) to that page with data 
> which corrupts the ECCs that were first modified by writing the cleanmarker.

I remember someone sent patches to teach JFFS2 to avoid using clean
markers, but I do not remembers the details and whether the patches made
it into the mainline.

-- 
Best Regards,
Artem Bityutskiy
