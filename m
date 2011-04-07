Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q7mkj-0006Dl-HF
	for linux-mtd@lists.infradead.org; Thu, 07 Apr 2011 10:47:54 +0000
Subject: Re: [PATCHv2] tests: introduce new target tests in Makefile
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
In-Reply-To: <2016ea1c9296efd368a37e4f869bd8a51f20c537.1302015688.git.ext-andriy.shevchenko@nokia.com>
References: <BANLkTimsfEKUMGBAfyLoeqSQnB-6u-jWPw@mail.gmail.com>
	<2016ea1c9296efd368a37e4f869bd8a51f20c537.1302015688.git.ext-andriy.shevchenko@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 07 Apr 2011 13:44:39 +0300
Message-ID: <1302173079.2407.30.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Florian Fainelli <ffainelli@freebox.fr>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-04-05 at 18:03 +0300, Andy Shevchenko wrote:
> This patch appends Makefile to the tests subdirectory and introduces tests
> target in the root Makefile.
> 
> Additionally the clean target removes temporary stuff under tests subdirectory
> as well.
> 
> Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
> ---
>  Makefile       |    7 ++++++-
>  tests/Makefile |    8 ++++++++
>  2 files changed, 14 insertions(+), 1 deletions(-)
>  create mode 100644 tests/Makefile

Breaks compilation for me:

[dedekind@eru mtd-utils (master)]$ make
d=lib_all; \
        t=`echo $d | sed s:.*_::` d=`echo $d | sed s:_.*::`; \
        make BUILDDIR=/home/dedekind/git/mtd-utils/$d -C $d $t
make[1]: Entering directory `/home/dedekind/git/mtd-utils/lib'
make[1]: Nothing to be done for `all'.
make[1]: Leaving directory `/home/dedekind/git/mtd-utils/lib'
ar crv /home/dedekind/git/mtd-utils/lib/libmtd.a subdirs_lib_all
ar: subdirs_lib_all: No such file or directory
make: *** [/home/dedekind/git/mtd-utils/lib/libmtd.a] Error 1


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
