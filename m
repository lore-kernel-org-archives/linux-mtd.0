Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eff06-0006zt-UV
	for linux-mtd@lists.infradead.org; Fri, 25 Nov 2005 09:56:41 -0500
Message-ID: <43872712.7070608@inf.u-szeged.hu>
Date: Fri, 25 Nov 2005 16:00:34 +0100
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Holger Schurig <hs4233@mail.mn-solutions.de>
References: <4386F21B.9010507@inf.u-szeged.hu>
	<200511251247.41142.hs4233@mail.mn-solutions.de>
In-Reply-To: <200511251247.41142.hs4233@mail.mn-solutions.de>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: New compression method for JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Holger Schurig wrote:

>>- it uses the kernel's CryptoAPI interface, and will allow not only
>>compressors but also crypto algorithms
>>    
>>
>
>Does this make the zImage bigger or smaller as compared to the current JFFS2 ?
>  
>
These is no relevant change in this point of view.

It is an other kind of (more flexible) compression framework than the
recent JFFS2 uses. It uses ZLIB via CryptoAPI which can cause smaller
JFFS2 image, but the kernel size is almost the same as before.

Ferenc
