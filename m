From: David Woodhouse <dwmw2@infradead.org>
To: Robin Gilks <robin.gilks@tait.co.nz>
In-Reply-To: <401ECD2A.4070106@tait.co.nz>
References: <401ECD2A.4070106@tait.co.nz>
Content-Type: text/plain
Message-Id: <1077309760.427.681.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 20 Feb 2004 20:42:42 +0000
Content-Transfer-Encoding: 7bit
cc: mtd list <linux-mtd@lists.infradead.org>
Subject: Re: workstation mount of jffs2 and endianess
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-02-03 at 11:20 +1300, Robin Gilks wrote:
> Is it possible to mount a bigendian jffs2 filesystem image (via blkmtd 
> or whatever) on a little endian host system (i.e. a PC workstation)?

Yes. #define JFFS2_BIG_ENDIAN in include/linux/jffs2.h

-- 
dwmw2
