Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cNP2-0000lT-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 10:46:53 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <957BD1C2BF3CD411B6C500A0C944CA2601499C38@pdsmsx32.pd.intel.com> 
References: <957BD1C2BF3CD411B6C500A0C944CA2601499C38@pdsmsx32.pd.intel.com> 
To: "Yuan, Cain" <cain.yuan@intel.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 peoblems with K3 strata flash on Dalhart 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 07 Aug 2002 10:46:49 +0100
Message-ID: <30833.1028713609@redhat.com>
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

cain.yuan@intel.com said:
> 	According to your email  I  rebuild a JFFS2 image with the   block
> size 0x10000,  same as the datasheet saids. but the problem still
> exist.  First bootup will success without any error message. but when
> I reset the board and boot it again, many errors occurs.

Looks like you should be using 0x20000. 0x10000 is fine but triggers 
harmless messages about 'Empty block at 0x.... '. I think you were using 
0x40000 before which would have caused problems.

The other problem still remains, and isn't related, though...

> Write of 68 bytes at 0x0035e908 failed. returned 0, retlen 0
> Not marking the space at 0x0035e908 as dirty because the flash driver returned retlen zero

The hardware driver seems broken -- it's returning success but not actually 
reporting that it's written any data. What driver, what version?

--
dwmw2
