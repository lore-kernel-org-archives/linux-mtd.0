Received: from wproxy.gmail.com ([64.233.184.192])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CbJUi-0002iL-Jg
	for linux-mtd@lists.infradead.org; Mon, 06 Dec 2004 09:05:44 -0500
Received: by wproxy.gmail.com with SMTP id 68so62519wri
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Dec 2004 06:05:39 -0800 (PST)
Message-ID: <550530ef04120606054caa83cc@mail.gmail.com>
Date: Mon, 6 Dec 2004 14:05:39 +0000
From: Andrew Douglas <andy.douglasspam@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Compiling MTD-utils
Reply-To: Andrew Douglas <andy.douglasspam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All

I'm tring to compile the latest snapshot of MTD utils for my host and
embedded target systems. According to Karim Yaghmour's Building
Embedded Linux Systems I should use:

$ automake --foreign; autoconf
$ ./configure --with-kernel=/usr/src/linux

When I do I get the folowing error messages:

"automake: 'configure.ac ' or 'configure.in' is required
"autoconf: no input file"

Are these the correct commands? If not what should I be using??

Any suggestions would be appreciated

Thanks

Andy Douglas
