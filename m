Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15OfVL-0001vr-00
	for <linux-mtd@lists.infradead.org>; Mon, 23 Jul 2001 14:12:11 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E0FDC90A9031D511915D00C04F0CCD250399CB@LEONOID> 
References: <E0FDC90A9031D511915D00C04F0CCD250399CB@LEONOID> 
To: raghav@ishoni.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: Porting FFS2 on MIPS 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 23 Jul 2001 14:17:55 +0100
Message-ID: <9387.995894275@redhat.com>
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

raghav@ishoni.com said:
>  Since I do not have access to the format document nor access to FFS2
> documenatation; can anyone point as to whether FFS2 specifies any
> endian for storing the data structures? 

I'd assume LE - no Windows platforms run in BE mode as far as I know.

The source to WinCE is now available, isn't it? Can you glean some 
information about FFS2 from there?

--
dwmw2
