From: David Woodhouse <dwmw2@infradead.org>
To: xavier prabhu <xavier_prabhu@linuxmail.org>
In-Reply-To: <20040318074823.9C9BC2B2B58@ws5-7.us4.outblaze.com>
References: <20040318074823.9C9BC2B2B58@ws5-7.us4.outblaze.com>
Content-Type: text/plain
Message-Id: <1079597392.16952.109.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 18 Mar 2004 08:09:52 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: cramfs: wrong magic :
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-03-18 at 15:48 +0800, xavier prabhu wrote:
> Creating 3 MTD partitions on "Pb1550 flash":
> 0x00000000-0x07c00000 : "User FS"
> 0x07c00000-0x07d00000 : "yamon"
> 0x07d00000-0x07fc0000 : "raw kernel"

> cramfs: wrong magic :
> Kernel panic: VFS: Unable to mount root fs on 1f:01

You're telling it to use the yamon partition as root. It doesn't find
the cramfs magic there. Try /dev/mtdblock0 instead?

-- 
dwmw2
