Received: from mtagate2.de.ibm.com ([195.212.29.151])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jimkr-0004nU-P4
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 08:31:06 +0000
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate2.de.ibm.com (8.13.8/8.13.8) with ESMTP id m378Sxd2108164
	for <linux-mtd@lists.infradead.org>; Mon, 7 Apr 2008 08:28:59 GMT
Received: from d12av01.megacenter.de.ibm.com (d12av01.megacenter.de.ibm.com
	[9.149.165.212])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.7) with
	ESMTP id m378SxH33694844
	for <linux-mtd@lists.infradead.org>; Mon, 7 Apr 2008 10:28:59 +0200
Received: from d12av01.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av01.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id m378Sx6e025607
	for <linux-mtd@lists.infradead.org>; Mon, 7 Apr 2008 10:28:59 +0200
From: Christian Borntraeger <borntraeger@de.ibm.com>
To: joern@logfs.org
Subject: Re: [patch 1/15] Makefiles and Kconfig
Date: Mon, 7 Apr 2008 10:28:58 +0200
References: <20080401181308.512473173@logfs.org>
	<20080401181332.853833001@logfs.org>
In-Reply-To: <20080401181332.853833001@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200804071028.58362.borntraeger@de.ibm.com>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Dienstag, 1. April 2008 schrieb joern@logfs.org:
> --- linux-2.6.24logfs/fs/Kconfig~logfs	2008-03-24 12:39:10.190939342 +0100
> +++ linux-2.6.24logfs/fs/Kconfig	2008-04-01 19:48:18.517351063 +0200
[...]
> --- linux-2.6.24logfs/fs/Makefile~logfs	2008-03-24 12:39:10.190939342 
> +++ linux-2.6.24logfs/fs/Makefile	2008-03-24 12:40:08.127616634 +0100 
[...]
> --- /dev/null	2008-03-30 12:15:48.586669308 +0200
> +++ linux-2.6.24logfs/fs/logfs/Makefile	2008-04-01 19:48:07.170961891 
[...] 

Hi Joern,

can you make the Kconfig/Makefile changes the last patch? This will help git 
bisect. 

Christian
