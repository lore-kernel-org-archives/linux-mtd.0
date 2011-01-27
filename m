Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PiOrT-00082d-Ug
	for linux-mtd@lists.infradead.org; Thu, 27 Jan 2011 10:13:57 +0000
Received: by wyf22 with SMTP id 22so1842294wyf.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 27 Jan 2011 02:13:53 -0800 (PST)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: wxzzzh@163.com, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: incompatible libmtd.a when compiling the mtd-utils
References: <201101262351090621559@163.com>
Date: Thu, 27 Jan 2011 11:13:31 +0100
In-Reply-To: <201101262351090621559@163.com> (wxzzzh@163.com's message of
	"Wed, 26 Jan 2011 23:51:09 +0800")
Message-ID: <87pqrislh0.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "wxzzzh" == wxzzzh  <wxzzzh@163.com> writes:

 wxzzzh> Hi,
 wxzzzh> I was trying to cross compile the mtd-utils-1.4.1, for ARM, using the arm-2009q3 version of arm-none-linux-gnueabi, following the instructions on http://elinux.org/CompilingMTDUtils

 wxzzzh> it always fail with saying: "/home/zh/1808/tool/arm-2009q3/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.1/../../../../arm-none-linux-gnueabi/bin/ld: skipping incompatible /home/zh/1808/mtd/mtd-utils-1.4.1/arm-none-linux-gnueabi/lib/libmtd.a when searching for -lmtd
 wxzzzh> /home/zh/1808/tool/arm-2009q3/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.1/../../../../arm-none-linux-gnueabi/bin/ld: cannot find -lmtd
 wxzzzh> collect2: ld returned 1 exit status"

 wxzzzh> How this happened? and how to solve?
 wxzzzh> Any help appreciated. 	

Redownload the tarball or delete the lib*.a files. The first 1.4.1
tarball contained some build files (for 32bit x86), which confuses your
cross compiler.

Artem, there has been quite some changes since mtd-utils-1.4.1, time for
a new release?

-- 
Bye, Peter Korsgaard
