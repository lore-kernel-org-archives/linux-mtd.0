Received: from 235-216.205.122.dellhost.com ([216.205.122.235] helo=imagequestdesign.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17aiUa-0004Kv-00
	for <linux-mtd@lists.infradead.org>; Fri, 02 Aug 2002 20:53:44 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: Ilguiz Latypov <ilatypov@superbt.com>
Subject: Re: [patch] doc_stage1.S : GRUB on DoC
Date: Fri, 2 Aug 2002 15:49:39 -0400
Cc: linux-mtd@lists.infradead.org
References: <Pine.LNX.4.44.0208020949420.26999-100000@server.superbt.com>
In-Reply-To: <Pine.LNX.4.44.0208020949420.26999-100000@server.superbt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200208021549578.SM02488@there>
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

Ilguiz,

Indeed, the READID command doesn't seem to care what address is sent -- the 
answer came back correctly either way.

Here's what I've learned so far:

1)  The Grub CVS code (from 7/30), with the 2002-06-21 patch applied also 
causes the P133 machine to reboot.  This code has none of the combined 
doc_stage1/1b additions made in the 07-29 patch.

2)  The 0.92 Grub, with an earlier doc patch (I think it was 05-30) boots 
fine.

3)  Using the combined doc_stage1/1b with 0.92 Grub does not work.

Again, all three combinations above work just fine on the faster PC.

Item #1 seems to suggest that cvs grub may have introduced the problem, but 
in that case #3 should work.  Item #3 was patched manually (just doc_stage1.S 
and the Makefile), so it's possible I missed something else in your 07-29 
patch.

Anyway, is it possible to take an unmodified 0.92 Grub, and cleanly apply the 
latest (07-29) patch?  I was not able to do this, mainly because of automake 
version differences.  

Thanks,

Mark

Ilguiz Latypov wrote:
> I understand that the same register %di serves as the offset to the
> destination in RAM and as the offset in flash.  And stage2 or doc2000.c
> code will read chip ID from offset 0.  I think the offset may not be
> important because the READID command tells the chip to report the ID.
