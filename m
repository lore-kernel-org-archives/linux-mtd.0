Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jf91H-0002Dd-Ly
	for linux-mtd@lists.infradead.org; Fri, 28 Mar 2008 07:29:00 +0000
Received: from esebh107.NOE.Nokia.com (esebh107.ntc.nokia.com [172.21.143.143])
	by mgw-mx06.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m2S7SmBL015685
	for <linux-mtd@lists.infradead.org>; Fri, 28 Mar 2008 09:28:55 +0200
Message-ID: <47EC9CC4.3090902@nokia.com>
Date: Fri, 28 Mar 2008 09:22:44 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: choosing a file system to use on NAND/UBI
References: <20080328010403.GB23610@cloud.net.au>
In-Reply-To: <20080328010403.GB23610@cloud.net.au>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hamish Moffatt wrote:
> I'm developing an embedded product which will have its root file system
> on NAND. The root will be pre-prepared and installed using
> flashcp/nandwrite/ubiupdatevol, and usually mounted read-only.
> Occasionally we might want to mount it read/write for debug purposes.
> 
> I'm intending to use UBI for volume management and wear-levelling.
> 
> JFFS2 on UBI does not seem very fast, in particular mount time and
> initial access (until cache is populated). I tried disabling compression
> but that seemed to make it worse (mount time was doubled).

Do you know that you need to have JFFS2 summary support enabled to have
reasonable mount times?
