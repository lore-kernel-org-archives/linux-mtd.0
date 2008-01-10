Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JD6jS-0003QV-MD
	for linux-mtd@lists.infradead.org; Thu, 10 Jan 2008 23:22:48 +0000
Date: Fri, 11 Jan 2008 00:16:45 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: [PATCH] [MTD] [RFC] New Solarflare NIC EEPROM/Flash driver
Message-ID: <20080110231645.GB29847@lazybastard.org>
References: <47866921.40904@solarflare.com>
	<20080110201309.GC26820@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080110201309.GC26820@lazybastard.org>
Cc: linux-net-drivers@solarflare.com, Steve Pope <spope@solarflare.com>,
	linux-mtd@lists.infradead.org,
	Robert Stonehouse <rstonehouse@solarflare.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Editor window was still open on some terminal, so I had a second look:

        /* Free verification buffer */
	kfree(verify_buffer);
  Please kill such non-documentation.  Plain C is readable enough and
  does not need translation in English.  Some of your comments are
  quite useful, because they explain background information.  Do keep
  those.

  efx_mtd_sync() is a function of 29 lines that does... very little.  It
  takes the semaphore and releases it again.  Everything else is pure
  noise.  When reading the function, 90% of the time is wasted on noise.
  So please take a rough brush and sweep out everything you don't need.

  One of my first questions was, why does this driver need 1000 lines?
  And the answer is: it doesn't.  500 sounds like a fair goal.  That
  means 50% of your driver is noise and should get removed.  Which, btw,
  is a fairly good starting point for in-house code.  In my last job,
  75% noise was quite common.
  
  Another interesting metric for in-house code was that while removing
  noise I usually fixed one bug for every 10-20 lines I removed.  Your
  code gives me a significantly better first impression, so I don't
  expect you to find and fix 50 bugs during the cleanup.  But I'd be
  equally surprised if you found none. ;)

Jörn

-- 
Data dominates. If you've chosen the right data structures and organized
things well, the algorithms will almost always be self-evident. Data
structures, not algorithms, are central to programming.
-- Rob Pike
