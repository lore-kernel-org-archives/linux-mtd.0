Received: from tiger.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Ji96-0000Vn-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2002 22:37:32 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: justin.wojdacki@analog.com,
	"'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: MTD Device Stats
Date: Thu, 5 Dec 2002 12:03:24 +1300
References: <3DEE7B15.6AAC4334@analog.com>
In-Reply-To: <3DEE7B15.6AAC4334@analog.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20021204230804.09DD64A0D@tiger.actrix.co.nz>
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

The problem with this is that "free" and "used" are determined by higher 
level usage - ie the file system - rather than the device itself. Dunno what 
JFFS gives you, but you can see these stats in YAFFS through /proc/yaffs.

On Thu, 05 Dec 2002 11:00, Justin Wojdacki wrote:
> Is there an "mtdstat" or similar program that I can use to get the
> stats of an MTD device? Basically, I want to know the state of the
> physical device (free blocks, used blocks, etc.).
