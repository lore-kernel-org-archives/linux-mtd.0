Received: from mtagate7.de.ibm.com ([195.212.29.156])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KW5o0-0004pG-Mi
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 08:46:09 +0000
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate7.de.ibm.com (8.13.8/8.13.8) with ESMTP id m7L8ipbj626530
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2008 08:44:51 GMT
Received: from d12av01.megacenter.de.ibm.com (d12av01.megacenter.de.ibm.com
	[9.149.165.212])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.0) with
	ESMTP id m7L8ipne2756632
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2008 10:44:51 +0200
Received: from d12av01.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av01.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id m7L8io45010283
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2008 10:44:51 +0200
Message-ID: <48AD2AFF.5060609@de.ibm.com>
Date: Thu, 21 Aug 2008 10:44:47 +0200
From: Carsten Otte <cotte@de.ibm.com>
MIME-Version: 1.0
To: jaredeh@gmail.com
Subject: Re: [PATCH 05/10] AXFS: axfs_profiling.c
References: <48AD00F8.1030004@gmail.com>
In-Reply-To: <48AD00F8.1030004@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: nickpiggin@yahoo.com.au, linux-embedded@vger.kernel.org,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@AM.SONY.COM
Reply-To: carsteno@de.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jared Hulbert wrote:
> Profiling is a fault instrumentation and /proc formating system.
> This is used to get an accurate picture of what the pages are actually used.
> Using this info the image can be optimized for XIP
Exporting profiling data for a file system in another file system 
(/proc) seems not very straigtforward to me. I think it is worth 
considering to export this information via the same mount point.
