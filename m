Subject: Re: RO jffs2 implementation for bootloader
From: David Woodhouse <dwmw2@infradead.org>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <loom.20070503T102421-36@post.gmane.org>
References: <loom.20070503T102421-36@post.gmane.org>
Content-Type: text/plain
Date: Thu, 03 May 2007 17:07:19 +0100
Message-Id: <1178208439.11120.188.camel@pmac.infradead.org>
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

On Thu, 2007-05-03 at 08:40 +0000, Matthieu CASTET wrote:
> I need to mount a jffs2 partition in a bootloader. I tried u-boot that support
> jffs2, but it is very slow (2 minutes for mounting a 64MB partition).
> 
> Do you know if there are other (fast) implemenation of jffs2 suitable for a
> bootloader ?

The version of OpenFirmware which we use on OLPC has JFFS2 support. And
eCos also has JFFS2 support, which means that RedBoot does too.

If you build using -ffunction-sections --gc-sections (as eCos/RedBoot
does), and if you never call the write functions, a huge amount of JFFS2
just drops out of the build.

-- 
dwmw2
