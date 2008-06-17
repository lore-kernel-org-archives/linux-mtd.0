Received: from ipmail01.adl6.internode.on.net ([203.16.214.146])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K8Pbi-0002aW-U5
	for linux-mtd@lists.infradead.org; Tue, 17 Jun 2008 01:03:35 +0000
Message-ID: <48570D5A.1050906@call-direct.com.au>
Date: Tue, 17 Jun 2008 11:03:22 +1000
From: Iwo Mergler <iwo@call-direct.com.au>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [BUG] JFFS2 power loss recovery issues on NAND
References: <alpine.LFD.1.10.0806101438520.27550@casper.infradead.org>
In-Reply-To: <alpine.LFD.1.10.0806101438520.27550@casper.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: joern@logfs.org, dwmw2@infradead.org,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alexey Korolev wrote:
> JFFS2 ignores read errors from NAND since it has own CRC. On attempt to
> read fragment from first 256 bytes JFFS2 detects CRC error as this
> region has been improperly corrected and considers
> node as invalid. Rest data on page is considered as good. 
>
> So if we write new file during power loss and we have several nodes in
> page, we may face bad case with hole in the middle of the file after
> power loss. It is a bug. 
>
> The attached picture may explain the issue better. 
>
>
> So for now it is clear how JFFS2 fails. It is not obvious how to fix it. 
> Do you have any suggestions or ideas how it could be fixed?
> Would it be a good idea do hack JFFS2 in order to read data one more
> time but without ECC correction in case of failed read?
>   
Alexey,

I know of at least one hardware ECC implementation which can flag
errors within the ECC bytes separately. In other words, not all 
implementations
will detect/correct bit errors in the case of a ECC write error.

About how to fix it - what about making the reading without ECC the default
and only re-reading with ECC if JFFS2 finds an invalid checksum?

Kind regards,

Iwo
