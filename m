From: David Woodhouse <dwmw2@infradead.org>
To: "Eisenhut, Daniel (MED)" <Daniel.Eisenhut@med.ge.com>
In-Reply-To: <77FE4A1FA59FF947845A42194AD6676277319C@uswaumsx07medge.med.ge.com>
References: 
	 <77FE4A1FA59FF947845A42194AD6676277319C@uswaumsx07medge.med.ge.com>
Content-Type: text/plain
Message-Id: <1079711717.16952.287.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 19 Mar 2004 15:55:17 +0000
Content-Transfer-Encoding: 7bit
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Block lock-bits
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-03-19 at 09:43 -0600, Eisenhut, Daniel (MED) wrote:
> I've set up MTD to use my NOR flash chips (Intel StrataFlash J3) and can
> successfully read and write using /dev/mtdblock/X.  Now I need to be able to
> set and clear the lock-bits on the individual blocks.  My question is how?

ioctl(MEMUNLOCK) on /dev/mtdX character device.

If this is the silly chip that automatically locks every time you power
cycle it, then perhaps we ought to be unlocking the whole thing when we
detect it.

-- 
dwmw2
