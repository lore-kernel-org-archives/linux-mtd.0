Received: from e28smtp03.in.ibm.com ([122.248.162.3])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SwoRi-0000hU-7F
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2012 05:59:43 +0000
Received: from /spool/local
 by e28smtp03.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <hejianet@linux.vnet.ibm.com>;
 Thu, 2 Aug 2012 11:29:37 +0530
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
 by d28relay03.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
 q725xYuD28246252
 for <linux-mtd@lists.infradead.org>; Thu, 2 Aug 2012 11:29:34 +0530
Received: from d28av05.in.ibm.com (loopback [127.0.0.1])
 by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
 q725xY0Y001100
 for <linux-mtd@lists.infradead.org>; Thu, 2 Aug 2012 15:59:34 +1000
Received: from [127.0.0.1] ([9.123.236.172])
 by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
 q725wwdq031968
 for <linux-mtd@lists.infradead.org>; Thu, 2 Aug 2012 15:59:33 +1000
Message-ID: <501A1720.6000604@linux.vnet.ibm.com>
Date: Thu, 02 Aug 2012 13:58:56 +0800
From: hejianet <hejianet@linux.vnet.ibm.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: jffs2 copy too long after mounting
References: <5019EE49.7000208@linux.vnet.ibm.com>
In-Reply-To: <5019EE49.7000208@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2012-08-02 11:04, hejianet wrote:
> hi All
> my kernel is 2.6.16
> after mounting the nand flash with jffs2 partition, the first copy operation
> for a 15M file(from jffs2 partition to jffs2 partition) take 9
> minutes,but the
> second copy operation takes 1 minutes.
> the disk usage(df result) is over 85%.
> I wonder is there any patch ported to such old kernel?
> Thanks
>
> B.R.
> Jia
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
>
Is there anyway to show the summary result of jffs2's fragmentation?
Is there anyway to manually make defragmentation?
Thanks

Jia
