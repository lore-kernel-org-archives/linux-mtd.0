From: David Woodhouse <dwmw2@infradead.org>
To: Todd Poynor <tpoynor@mvista.com>
In-Reply-To: <4146449D.8030305@mvista.com>
References: <4123FE19.9000109@mvista.com>
	<1092904045.3777.69.camel@imladris.demon.co.uk>
	<4146449D.8030305@mvista.com>
Content-Type: text/plain
Message-Id: <1095144725.9144.176.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 14 Sep 2004 07:52:05 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtdblock cache flush at remount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-09-13 at 18:08 -0700, Todd Poynor wrote:
> If mtdblock is unique in that it does not necessarily write a block to 
> stable storage when the block layer issues a write then this is not 
> likely to gain much interest.  It's possible that the IDE drivers might 
> want to flush disk hardware buffers in such a situation as well, much 
> like what occurs at suspend and shutdown, but I haven't looked into that 
> yet.

IDE and SCSI drives definitely _do_ need precisely this.

-- 
dwmw2
