Received: from moutng.kundenserver.de ([212.227.126.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KW8Iv-0008UW-GC
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 11:26:14 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: jaredeh@gmail.com
Subject: Re: [PATCH 02/10] AXFS: Kconfig and Makefiles
Date: Thu, 21 Aug 2008 13:24:22 +0200
References: <48AD00DF.9080207@gmail.com>
In-Reply-To: <48AD00DF.9080207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200808211324.22989.arnd@arndb.de>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?iso-8859-1?q?J=F6rn_Engel?= <joern@logfs.org>,
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

On Thursday 21 August 2008, Jared Hulbert wrote:
> The Kconfig edits and Makefiles required for AXFS.
> 
> Signed-off-by: Jared Hulbert <jaredeh@gmail.com>

If you split out this patch separate from the files, please make it the
*last* patch so that you cannot get build errors during a later git-bisect
through the middle of your series.

	Arnd <><
