From: David Woodhouse <dwmw2@infradead.org>
To: Philippe <philippe@accuitee.com>
In-Reply-To: <000501c3e41d$c858e780$247dfea9@jennifer>
References: <000501c3e41d$c858e780$247dfea9@jennifer>
Content-Type: text/plain
Message-Id: <1075129659.24024.86.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 26 Jan 2004 15:07:39 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: DOC2k booting speed ...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-01-26 at 16:05 +0100, Philippe wrote:
> When grub is booting, it takes 10 seconds to load the kernel and 35 seconds
> to load the initrd.
>  -> 5MB loaded : 45sec
>  
> When I boot from the Doc but with loading from the hard drive it takes 1
> seconds to load the kernel and 2 seconds to load the initrd.
>  -> 5MB loaded : 3sec

Grub's drivers are not particularly optimised. Why use an initrd rather
loaded by the bootloader, rather than having the kernel itself access
the device? That should be much faster, and wouldn't even need to whole
device to be read at startup.


-- 
dwmw2
