From: David Woodhouse <dwmw2@infradead.org>
To: zheng wei <jeanwelly0614@hotmail.com>
In-Reply-To: <BAY19-F26rjbudzxxfY00000234@hotmail.com>
References: <BAY19-F26rjbudzxxfY00000234@hotmail.com>
Content-Type: text/plain
Message-Id: <1095144914.9144.179.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 14 Sep 2004 07:55:14 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Need help about mtd on s3c2410
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-09-14 at 13:34 +0800, zheng wei wrote:
> Hi, sir
>     I download the mtd newest package, and use patchin.sh to install it ... 
> 
> But when I make zImage, errors was found...
>     It says that there sis no bug.h file included in map.h.
> How can i resolve it?

The kernel you are using is too old. Make sure you're using a 2.6
kernel.

-- 
dwmw2
