Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PiOt5-00083Q-GH
	for linux-mtd@lists.infradead.org; Thu, 27 Jan 2011 10:15:35 +0000
Subject: Re: incompatible libmtd.a when compiling the mtd-utils
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Peter Korsgaard <jacmet@sunsite.dk>
In-Reply-To: <87pqrislh0.fsf@macbook.be.48ers.dk>
References: <201101262351090621559@163.com>
	<87pqrislh0.fsf@macbook.be.48ers.dk>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 27 Jan 2011 12:15:08 +0200
Message-ID: <1296123308.9948.105.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: wxzzzh@163.com, linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-01-27 at 11:13 +0100, Peter Korsgaard wrote:
> >>>>> "wxzzzh" == wxzzzh  <wxzzzh@163.com> writes:
> 
>  wxzzzh> Hi,
>  wxzzzh> I was trying to cross compile the mtd-utils-1.4.1, for ARM, using the arm-2009q3 version of arm-none-linux-gnueabi, following the instructions on http://elinux.org/CompilingMTDUtils
> 
>  wxzzzh> it always fail with saying: "/home/zh/1808/tool/arm-2009q3/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.1/../../../../arm-none-linux-gnueabi/bin/ld: skipping incompatible /home/zh/1808/mtd/mtd-utils-1.4.1/arm-none-linux-gnueabi/lib/libmtd.a when searching for -lmtd
>  wxzzzh> /home/zh/1808/tool/arm-2009q3/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.1/../../../../arm-none-linux-gnueabi/bin/ld: cannot find -lmtd
>  wxzzzh> collect2: ld returned 1 exit status"
> 
>  wxzzzh> How this happened? and how to solve?
>  wxzzzh> Any help appreciated. 	
> 
> Redownload the tarball or delete the lib*.a files. The first 1.4.1
> tarball contained some build files (for 32bit x86), which confuses your
> cross compiler.
> 
> Artem, there has been quite some changes since mtd-utils-1.4.1, time for
> a new release?

Yes, I'll do this as soon as I can.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
