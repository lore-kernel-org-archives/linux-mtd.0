Received: from ns1.ixmail.hkcix.com ([202.181.230.228] helo=ixmail.hkcix.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15rfPA-0004HP-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Oct 2001 13:57:40 +0100
Received: from uniquemodem.com ([202.181.182.134])
	by ixmail.hkcix.com (8.11.5/8.10.2) with ESMTP id f9BD0LE25430
	for <linux-mtd@lists.infradead.org>; Thu, 11 Oct 2001 21:00:22 +0800
Message-ID: <3BC599FF.9ECDA81C@uniquemodem.com>
Date: Thu, 11 Oct 2001 21:09:19 +0800
From: data <data@uniquemodem.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Problem on building the kernel 2.2.18 with MTD sc520 processor
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

I would like to put the embedded linux into the sc520cdp processor
board. I follow the document The Linux MTD, JIFFS HOWTO to build the
kernel 2.2.18 with the patch MTD 2.2.18. During the compiling process, I
have encountered                  the following problem. Have anybody
come across similar problem before? If you do, could you please give me
a hand?
The followings are the installation log for the kernel when compiling
the driver MTD stuffs and I hope you can help me to sort out the
problem.

Thanks and regards,

Jimmy Chun

                        >Installation log:
                        >
                        >otypes -O2 -fomit-frame-pointer
-fno-strict-aliasing -pipe -fno-strength-ed
                        >uce
                        >-m386 -DCPU=386   -c -o chipreg.o chipreg.c
                        >chipreg.c: In function `do_map_probe':
                        >chipreg.c:67: parse error before `do'
                        >chipreg.c:63: warning: unused variable `ret'
                        >chipreg.c:69: warning: control reaches end of
non-void function
                        >chipreg.c: At top level:
                        >chipreg.c:73: warning: type defaults to `int'
in declaration of `ret'
                        >chipreg.c:73: `drv' undeclared here (not in a
function)
                        >chipreg.c:73: `map' undeclared here (not in a
function)
                        >chipreg.c:73: warning: data definition has no
type or storage class
                        >chipreg.c:84: parse error before `if'
                        >make[4]: *** [chipreg.o] Error 1
                        >make[4]: Leaving directory

>`/home/dlam/linux-v2.2/linux-2.2.18/drivers/mtd/chips
                        >'
                        >make[3]: *** [first_rule] Error 2
                        >make[3]: Leaving directory

>`/home/dlam/linux-v2.2/linux-2.2.18/drivers/mtd/chips
                        >'
                        >make[2]: *** [_subdir_chips] Error 2
                        >make[2]: Leaving directory
`/home/dlam/linux-v2.2/linux-2.2.18/drivers/mtd'
                        >make[1]: *** [_subdir_mtd] Error 2
                        >make[1]: Leaving directory
`/home/dlam/linux-v2.2/linux-2.2.18/drivers'
                        >make: *** [_dir_drivers] Error 2
