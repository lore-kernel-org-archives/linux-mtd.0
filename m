From: David Woodhouse <dwmw2@infradead.org>
To: Clay Douglass <cdouglass@austin.rr.com>
In-Reply-To: <6.1.2.0.2.20040819151746.04354ad8@mail.conformative.com>
References: <6.1.2.0.2.20040819151746.04354ad8@mail.conformative.com>
Content-Type: text/plain
Message-Id: <1093006831.14552.3681.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 20 Aug 2004 14:00:31 +0100
Content-Transfer-Encoding: 7bit
Cc: sreenivasa.reddy@conformative.com, linux-mtd@lists.infradead.org
Subject: Re: ilookup-2.4.23.patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-08-19 at 15:17 -0500, Clay Douglass wrote:
> i am working on the JFFS2 on 2.4.22 Kernel. I got the ilookup() 
> unreferenced error. After seeing the messages in this list, i found that 
> ilookup() implementation is not available in 2.4 series of kernel.

That information is out of date. The ilookup() function is implemented
correctly in the current 2.4 kernels.

The original patch which was in CVS was buggy. Since it's working
correctly in 2.4 now, we removed the old patch from CVS.

-- 
dwmw2
