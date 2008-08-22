Received: from anchor-post-37.mail.demon.net ([194.217.242.87])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWNLL-0003FU-VR
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 03:29:44 +0000
Message-ID: <48AE32AE.9010901@lougher.demon.co.uk>
Date: Fri, 22 Aug 2008 04:29:50 +0100
From: Phillip Lougher <phillip@lougher.demon.co.uk>
MIME-Version: 1.0
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH 04/10] AXFS: axfs_inode.c
References: <48AD00F0.5030403@gmail.com> <200808211417.14425.arnd@arndb.de>	
	<48AE22F5.3000309@lougher.demon.co.uk>
	<6934efce0808212023x758babf0w500da6801bd66f45@mail.gmail.com>
In-Reply-To: <6934efce0808212023x758babf0w500da6801bd66f45@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: cotte@de.ibm.com, Arnd Bergmann <arnd@arndb.de>,
	linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jared Hulbert wrote:

> 
> The memcpy in question copies a c_node to the page.  The len is either
> the max length of a c_node and size of the buffer I'm copying to
> (PAGE_CACHE_SIZE) or it is the difference between the beginning of the
> c_node in the c_block and the end of the c_block, whichever is
> smaller.  The confusion is probably because of the fact that this
> copies extra crap to the page for tails.


Ah yes, that's where I got confused :)  Glad to see AXFS uses tail packing.


Phillip
