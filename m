Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BxKaR-0004lr-K8
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2004 03:10:20 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Pathompong Puengrostham <jay4mail@yahoo.com>
In-Reply-To: <4122D157.7070702@yahoo.com>
References: <4122D157.7070702@yahoo.com>
Content-Type: text/plain
Message-Id: <1092813016.3777.52.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Wed, 18 Aug 2004 08:10:17 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: amd_flash.c not compile
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-08-18 at 10:47 +0700, Pathompong Puengrostham wrote:
> I tried to use mtd 20040816 snapshot with linux 2.6.8.1 but there was a 
> compile errors in amd_flash.c. The latest version I can get it working 
> is 20040707. I read the cvs archive and saw that there was changes in 
> map.h that broke all the devices. Is there anybody already working on 
> this same file or get it working with the latest snapshot? Anyway, I'll 
> try to fix it.

amd_flash.c has been deprecated for a long time. You should find that
jedec_probe and cfi_cmdset_0002 work for you. Please test.

-- 
dwmw2
