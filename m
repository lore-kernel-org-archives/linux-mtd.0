Subject: Re: JFFS2 problem with filename length > 7
From: David Woodhouse <dwmw2@infradead.org>
To: Martin Wedepohl <martinatgd@gmail.com>
In-Reply-To: <67f0a57c0609262213j56993210h654450841dcac92f@mail.gmail.com>
References: <67f0a57c0609262213j56993210h654450841dcac92f@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 27 Sep 2006 07:12:44 +0100
Message-Id: <1159337564.3309.91.camel@pmac.infradead.org>
Mime-Version: 1.0
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

On Tue, 2006-09-26 at 23:13 -0600, Martin Wedepohl wrote:
> bash-3.00# ls -al /mnt
> ls: /mnt/8888: No such file or directory
> ls: /mnt/9999: No such file or directory
> ls: /mnt/aaaa: No such file or directory

Weird. Please reproduce with CONFIG_JFFS2_FS_DEBUG=1 and show the
(KERN_DEBUG) messages -- preferably by capturing them (without loss)
over a serial port. Please also take a snapshot of the offending image
from the flash.

I suspect a hardware driver or wiring problem.

-- 
dwmw2
