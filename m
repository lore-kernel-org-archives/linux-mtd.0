Received: from linux01.gwdg.de ([134.76.13.21])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FQnca-0002vz-2E
	for linux-mtd@lists.infradead.org; Tue, 04 Apr 2006 11:39:18 -0400
Date: Tue, 4 Apr 2006 17:38:56 +0200 (MEST)
From: Jan Engelhardt <jengelh@linux01.gwdg.de>
To: Richard Purdie <richard@openedhand.com>
In-Reply-To: <1144163888.6441.48.camel@localhost.localdomain>
Message-ID: <Pine.LNX.4.61.0604041737440.14611@yvahk01.tjqt.qr>
References: <1144163888.6441.48.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC/testing] Upgrade the zlib_inflate library code to a
 recent version
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
>Upgrade the zlib_inflate implementation in the kernel from a patched
>version 1.1.3 to a patched 1.2.3. 
>
>The code in the kernel is about seven years old and I noticed that the
>external zlib library's inflate performance was significantly faster
>(~50%) than the code in the kernel on ARM (and faster again on x86_32).
>
Any plans to move to something newer, e.g. bzip2 or LZMA?


Jan Engelhardt
-- 
