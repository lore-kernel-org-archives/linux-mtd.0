From: David Woodhouse <dwmw2@infradead.org>
To: simon@baydel.com
In-Reply-To: <EDC19A8677F@baydel.com>
References: <3F9F94C0.28402.10FED3@localhost>
	 <1067424903.15551.1537.camel@hades.cambridge.redhat.com>
	 <EDC19A8677F@baydel.com>
Content-Type: text/plain
Message-Id: <1067526214.3423.147.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 30 Oct 2003 15:03:34 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: SmartMedia FAT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-10-30 at 14:26 +0000, Simon Haynes wrote:
> I have been looking at the OOB data format for SSFDC and it seems I will have 
> to create and process my own OOB data as I can not see how the NAND/MTD layer 
> will work with this. 

Yes, that's expected. NFTL and JFFS2 do this too.

> When we started this project there seemed to be a fixed NAND OOB format. Now 
> the NAND OOB format is selectable. I have noticed in a couple of kernel 
> distributions that the JFFS2 code does not seem to be aware of this and just 
> calls pain mtd->read. I guess this would mean no ecc for JFFS2 on NAND unless 
> it was done automatically by the hardware. This was the case for latest 
> stable kernel, 2.4.22 downloaded from kernel.org today. 
> 
> Is this really the case ?

The JFFS2 in the 2.4 kernel doesn't support NAND. The code in CVS does.


-- 
dwmw2
