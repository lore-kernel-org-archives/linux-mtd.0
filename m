Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G0xo0-0003AM-36
	for linux-mtd@lists.infradead.org; Thu, 13 Jul 2006 05:48:34 -0400
Message-ID: <44B616F0.3050409@ru.mvista.com>
Date: Thu, 13 Jul 2006 13:48:32 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: M Sudharshana-A18475 <sudharshana@motorola.com>
Subject: Re: Nand read/write
References: <B7803DC652E2F9458758AEBB6A5FD60FF88DB0@ZMY16EXM67.ds.mot.com>
In-Reply-To: <B7803DC652E2F9458758AEBB6A5FD60FF88DB0@ZMY16EXM67.ds.mot.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

M Sudharshana-A18475 wrote:
> It is a flash partition where no file system is defined for that
> mount-able partition. Read/write operations are performed on /dev/mtd0
> (place where memory partition is mounted
Ok, then the answer is yes, unless your board driver selects 
NAND_ECC_NONE for ECC calculation.

I'd also expect to hear a lection on top-posting if I were you.

Vitaly
