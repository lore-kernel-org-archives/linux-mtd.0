Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JPVkC-0000D5-2U
	for linux-mtd@lists.infradead.org; Thu, 14 Feb 2008 04:30:50 +0000
Date: Thu, 14 Feb 2008 15:30:35 +1100
From: Hamish Moffatt <hamish@cloud.net.au>
To: Jacob Avraham <jacob@imaginecommunications.com>
Subject: Re: Redboot FIS entry upgrade from Linux
Message-ID: <20080214043035.GB1449@cloud.net.au>
References: <FF584854D6FFE547AB2F7515A798AC3A4E3A9955@venus.imagineil.tv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FF584854D6FFE547AB2F7515A798AC3A4E3A9955@venus.imagineil.tv>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 13, 2008 at 06:31:20PM +0200, Jacob Avraham wrote:
> Hi,
> 
> Say I have a zImage or ramdisk image as a file listed in FIS,
> which I use to  "fis load" from Redboot.
> Now I want to upgrade an image from Linux, so in addition to
> writing into the specific mtd partition I need to update the FIS
> directory entry checksum value.
> 
> Are there any utils to facilitate that?
> Or maybe such where not developed because it's not a good idea?

(Sorry, I'm a bit behind on this list.)

There's a utility here which can modify the RedBoot FIS table:
http://svn.chezphil.org/utils/trunk/fis.c

I added support for updating the checksums. You can get my patch here:
http://buildroot.uclibc.org/cgi-bin/viewcvs.cgi/trunk/buildroot/package/fis/fis-001-checksum.patch?rev=20951&view=auto

Like you, I update the kernel/initrd from linux then use fis to update
the checksums so that RedBoot will still load the image.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
