Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Z50i-0006CN-00
	for <linux-mtd@lists.infradead.org>; Tue, 21 Aug 2001 07:27:36 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B824989.F4626DBE@sasken.com> 
References: <3B824989.F4626DBE@sasken.com> 
To: Ashok M Padmanaban <ashokmp@sasken.com>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>,
    JFFS mailing list <jffs-dev@axis.com>
Subject: Re: Erase Sector Size 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 21 Aug 2001 07:33:16 +0100
Message-ID: <16243.998375596@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

ashokmp@sasken.com said:
>  Iam using intels 28F128 Strata flash, According to its data sheet its
> erase sector size is 128KB. But with 2.4.2 kernel + rmk2 (patch,diff)
> + mtd patch , the erase sector size is 256KB.

It's not configurable. You probably have two 16-bit devices arranged in a 
pair to give a 32-bit data path - which doubles the effective erase size 
because it doesn't make sense to erase one half at a time.

We just need to fix JFFS2 so it isn't so greedy.

--
dwmw2
