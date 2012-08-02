Received: from e23smtp04.au.ibm.com ([202.81.31.146])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Swlub-00081g-Go
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2012 03:17:22 +0000
Received: from /spool/local
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <hejianet@linux.vnet.ibm.com>;
 Thu, 2 Aug 2012 13:16:37 +1000
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay04.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
 q7238qUJ7536714
 for <linux-mtd@lists.infradead.org>; Thu, 2 Aug 2012 13:08:52 +1000
Received: from d23av03.au.ibm.com (loopback [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
 q723H9uR018721
 for <linux-mtd@lists.infradead.org>; Thu, 2 Aug 2012 13:17:09 +1000
Received: from [127.0.0.1] ([9.123.236.172])
 by d23av03.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
 q723GgZw017980
 for <linux-mtd@lists.infradead.org>; Thu, 2 Aug 2012 13:17:09 +1000
Message-ID: <5019F11A.9060801@linux.vnet.ibm.com>
Date: Thu, 02 Aug 2012 11:16:42 +0800
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
besides, how to search all the archives of linux-mtd?
http://lists.infradead.org/pipermail/linux-mtd/ is a link, but it
couldn't be searched totally by date. I have review all pages
month by month :(
