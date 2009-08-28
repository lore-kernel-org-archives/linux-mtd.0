Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mgtrv-0008BC-KD
	for linux-mtd@lists.infradead.org; Fri, 28 Aug 2009 05:19:27 +0000
Subject: RE: [PATCH] [JFFS2] Fix csize integer overflow issue due to truncation
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Victor Gallardo <vgallardo@amcc.com>
In-Reply-To: <0CA0A16855646F4FA96D25A158E299D606EDB04E@SDCEXCHANGE01.ad.amcc.com>
References: <25217471.1985431251223831787.JavaMail.nabble@isper.nabble.com>
	<0CA0A16855646F4FA96D25A158E299D606EDB04E@SDCEXCHANGE01.ad.amcc.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 28 Aug 2009 08:18:45 +0300
Message-Id: <1251436725.3514.9.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Prodyut Hazarika <phazarika@amcc.com>,
	David Woodhouse <dwmw2@infradead.org>, Feng Kan <fkan@amcc.com>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-08-27 at 16:37 -0700, Victor Gallardo wrote:
> Hi David and Josh,
>  
> Sorry if I am bothering you guys. I know you guys are busy or might
> be on vacation (it was August).
>  
> Usually how long does it take for patches on the linux-mtd mailing
> list for JFFS2 patches to get ACKed or NACKed. Or get an email
> response from the MAINTAINER.
>  
> I submitted the following patch and need to monitor it until it gets applied.
>  
> http://lists.infradead.org/pipermail/linux-mtd/2009-August/027005.html
> http://patchwork.ozlabs.org/patch/31854/

Your patch is in my l2-mtd-2.6 tree:

http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/a33f02363d4f57c7bc6133e892ad99d7ce7e7c87

// the secretary.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
