Received: from mtagate7.uk.ibm.com ([195.212.29.140])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KW4rs-0007do-9l
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 07:46:04 +0000
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate7.uk.ibm.com (8.13.8/8.13.8) with ESMTP id m7L7gr1F608964
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2008 07:42:54 GMT
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v9.0) with
	ESMTP id m7L7grJE3514384
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2008 08:42:53 +0100
Received: from d06av04.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id m7L7gqvq003439
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2008 08:42:53 +0100
Message-ID: <48AD1C7A.6020705@de.ibm.com>
Date: Thu, 21 Aug 2008 09:42:50 +0200
From: Carsten Otte <cotte@de.ibm.com>
MIME-Version: 1.0
To: jaredeh@gmail.com
Subject: Re: [PATCH 01/10] AXFS: exporting xip_file_fault() for use with AXFS
References: <48AD00D5.5010904@gmail.com>
In-Reply-To: <48AD00D5.5010904@gmail.com>
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
> We'll need this for AXFS.  The equivalent function in filemap.c is exported.
> 
> Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
> ---
>  include/linux/mm.h |    4 ++++
>  mm/filemap_xip.c   |    3 ++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
Acked-by: Carsten Otte <cotte@de.ibm.com>
