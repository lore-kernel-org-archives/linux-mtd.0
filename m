Received: from mtagate8.de.ibm.com ([195.212.29.157])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KW7NW-0004Ho-22
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 10:26:54 +0000
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate8.de.ibm.com (8.13.8/8.13.8) with ESMTP id m7LAProm670144
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2008 10:25:53 GMT
Received: from d12av03.megacenter.de.ibm.com (d12av03.megacenter.de.ibm.com
	[9.149.165.213])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.0) with
	ESMTP id m7LAPrlV4034594
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2008 12:25:53 +0200
Received: from d12av03.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av03.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id m7LAPqw5025154
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2008 12:25:53 +0200
Message-ID: <48AD42AE.4030107@de.ibm.com>
Date: Thu, 21 Aug 2008 12:25:50 +0200
From: Carsten Otte <cotte@de.ibm.com>
MIME-Version: 1.0
To: jaredeh@gmail.com
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
References: <48AD00C4.6060302@gmail.com>
In-Reply-To: <48AD00C4.6060302@gmail.com>
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
> I'd like to get a first round of review on my AXFS filesystem.
I like the general approach of it. It's much more flexible than the 
ext2 extension I've done, and the possibility to select XIP vs. 
compression per page is really really neat. I can imagine that people 
will prefer this over the ext2 implementation on s390. It is unclear 
to me how the "secondary block device" thing is supposed to work. 
Could you elaborate a bit on that?
