Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QrS1-0001ys-4f
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jun 2003 17:30:53 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: f.callaghan@ieee.org
In-Reply-To: <200306131153.42657.f.callaghan@ieee.org>
References: <OOEOKBMECIFAEPIMFOGIMEPICBAA.sgluckman@omnitech.com>
	 <200306131153.42657.f.callaghan@ieee.org>
Message-Id: <1055521884.3632.158.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 13 Jun 2003 17:31:24 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Please Help, problem mounting jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-06-13 at 16:53, Frank R Callaghan wrote:
> Thanks Sid, but I don't think I'm getting that far :(
> 
> # mount -t jffs2 /dev/mtdblock0 /var/fixed_flash &
> # mtdblock_open
> ok
> 
> # ps ax

>     6         root          0   D   [kupdated]
>  
>    87 ttyS1   root        468   D   mount -t jffs2 /dev/mtdblock0 
> /var/fixed_fl
>    88 ttyS1   root        468   R   mount -t jffs2 /dev/mtdblock0 
> /var/fixed_fl

Why are there two mounts running simultaneously? What if you compile
with CONFIG_JFFS2_FS_DEBUG=1 and set the console loglevel to 9 before
mounting? Is it actually _doing_ anything or is it just deadlocked?

If it's just deadlocked (and you're not using 2.4.18) then what was the
last thing it said _before_ stopping?


-- 
dwmw2
