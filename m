Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HHRge-00020p-Em
	for linux-mtd@lists.infradead.org; Wed, 14 Feb 2007 16:29:22 -0500
Date: Wed, 14 Feb 2007 20:56:01 +0000
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Jon Ringle <jon@ringle.org>
Subject: Re: P30 flash left in read status mode after a write
Message-ID: <20070214205601.GB20486@lazybastard.org>
References: <45D35A6F.3060203@ringle.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45D35A6F.3060203@ringle.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 14 February 2007 13:52:31 -0500, Jon Ringle wrote:
> 
> This did indeed seem to fix the problem, but I'm not sure if I might 
> inadvertently be causing some side effect. I believe that I might be 
> taking a slight performance hit to consecutive jffs2 write operations 
> because now each write operation will need to spend more cycles putting 
> the flash in to a write mode.

If the performance hit concerns you, you could set a timer instead of
changing the chip state.  Only if the timer expires - which means that
consecutive writes are a non-issue - do you change the chip state.

Jörn

-- 
"Error protection by error detection and correction."
-- from a university class
