Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K4eiI-0001ug-9J
	for linux-mtd@lists.infradead.org; Fri, 06 Jun 2008 16:22:51 +0000
Date: Fri, 6 Jun 2008 18:22:39 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: [RFC/PATCH 2/3] NAND multiple plane feature
Message-ID: <20080606162238.GA30407@logfs.org>
References: <alpine.LFD.1.10.0805281342150.23606@pentafluge.infradead.org>
	<20080601174841.GH13094@logfs.org>
	<alpine.LFD.1.10.0806031754030.32134@pentafluge.infradead.org>
	<20080605210929.GB19234@logfs.org>
	<alpine.LFD.1.10.0806061448270.26291@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LFD.1.10.0806061448270.26291@pentafluge.infradead.org>
Cc: linux-mtd@lists.infradead.org, tglx@linutronix.de, dwmw2@infradead.org,
	vasiliy.leonenko@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 6 June 2008 15:01:05 +0100, Alexey Korolev wrote:
>
> We just tried to check your scenario. It is not
> possible to overwrite something if JFFS2 returned -ENOSPC until
> something got deleted. 
> 
> In fact our test suite do not include this test case. We have another.
> Write file1 at about 5% of whole space, write file2 for rest of space.
> Delete file1. Do step 2. 
> In this not so good case we got the following numbers:
> 
> single-plane:
> 73 sec 424541 usec
> 
> dual-plane:
> 69 sec 428637 usec

An improvement instead of the expected regression.  Impressive.

Jörn

-- 
tglx1 thinks that joern should get a (TM) for "Thinking Is Hard"
-- Thomas Gleixner
