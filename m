Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170GG6-0006I7-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2002 07:28:06 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3CC61DDF.3050102@yottayotta.com> 
References: <3CC61DDF.3050102@yottayotta.com> 
To: Murtada Shah <mshah@yottayotta.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd jffs2 on 2.4.18-rmk3: undefined references 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 24 Apr 2002 07:27:54 +0100
Message-ID: <8726.1019629674@redhat.com>
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


mshah@yottayotta.com said:
> I'm getting undefined references to zlib_deflateInit_,
> zlib_inflateInit_ and some other zlib_<> calls.. which seem to reside
> in the lib/zlib_deflate & lib/zlib_inflate directories of mtd. How do
> I copy these to the linux kernel so I can cross-compile 2.4.18-rmk3
> with latest mtd without undefined reference errors? 

ftp://ftp.??.kernel.org/pub/linux/kernel/people/dwmw2/shared-zlib/

The 2.4.19-pre1 version ought to work. Obviously the bits which patch the 
stable JFFS2 code to work with shared zlib won't work - ignore those and 
drop in the new code.

--
dwmw2
