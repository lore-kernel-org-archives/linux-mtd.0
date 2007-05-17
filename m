Received: from courier.cs.helsinki.fi ([128.214.9.1] helo=mail.cs.helsinki.fi)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hon3d-0008R8-3Q
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 16:58:46 -0400
Message-ID: <464CC209.4060500@cs.helsinki.fi>
Date: Thu, 17 May 2007 23:58:49 +0300
From: Pekka Enberg <penberg@cs.helsinki.fi>
MIME-Version: 1.0
To: "=?UTF-8?B?SsO2cm4gRW5nZWw=?=" <joern@lazybastard.org>
Subject: Re: [PATCH] LogFS take three
References: <20070515151919.GA32510@lazybastard.org>
	<Pine.LNX.4.64.0705161319060.5152@sbz-30.cs.Helsinki.FI>
	<20070516122603.GE5472@lazybastard.org>
	<84144f020705160536i189f6206sffc964a145177da7@mail.gmail.com>
	<20070516132035.GJ5472@lazybastard.org>
In-Reply-To: <20070516132035.GJ5472@lazybastard.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: akpm@osdl.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Albert Cahalan <acahalan@gmail.com>, Greg KH <greg@kroah.com>,
	linux-kernel@vger.kernel.org, Ingo Oeser <ioe-lkml@rameria.de>,
	linux-mtd@lists.infradead.org, Jan Engelhardt <jengelh@linux01.gwdg.de>,
	linux-fsdevel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> Compressing random data will actually enlarge it.  If that happens I
> simply store the verbatim uncompressed data instead and mark it as such.
> 
> There is also demand for a user-controlled bit in the inode to disable
> compression completely.  All those .jpg, .mpg, .mp3, etc. just waste
> time by trying and failing to compress them.

So any sane way to enable compression is on per-inode basis which makes 
me still wonder why you need per-object compression.
