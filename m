Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D6owO-0000b5-6P
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 06:56:29 -0500
Message-ID: <4226FBCB.5020007@inf.u-szeged.hu>
Date: Thu, 03 Mar 2005 12:58:03 +0100
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <42232855.3020408@imc-berlin.de>
In-Reply-To: <42232855.3020408@imc-berlin.de>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Steven Scholz <steven.scholz@imc-berlin.de>
Subject: Re: SUMMARY for JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Steven Scholz wrote:
> IIUC then the SUMMARY stuff goes into JFFS3.
> But are there any plans to officially include it into the JFFS2 code?
> 
> It's quite cumbersome to update MTD CVS and then merge the patch 
> http://www.inf.u-szeged.hu/jffs2/jffs2-summary-20050211.patch by hand.
> 
> Since its a compile time option is there anything speaking against such 
> inclusion?

If David (dwmw2) says yes, we are ready to commit. Due to Steven's and 
some other people testing I think now it is stable.

Regards,
Ferenc
