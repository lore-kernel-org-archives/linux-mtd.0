Received: from rikers.org ([166.70.15.250] helo=localhost)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nAzU-0005h5-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 05:45:08 +0100
Message-ID: <3D78306A.38DB8612@Rikers.org>
Date: Thu, 05 Sep 2002 22:34:50 -0600
From: Tim Riker <Tim@Rikers.org>
MIME-Version: 1.0
To: lixi_avansys <lixi@avansys.com>, uclibc@uclibc.org
CC: linux <linux-mtd@lists.infradead.org>
Subject: Re: GPL ,LGPL ,and our application
References: <001801c2532b$fda0d3f0$e8023f0a@l23009>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

This is the wrong list for this question. I've copied the uClibc list on
my reply that would be a better place to ask.

As noted in the COPYING.LIB:

http://uclibc.org/cgi-bin/cvsweb/uClibc/COPYING.LIB?rev=HEAD&content-type=text/vnd.viewcvs-markup

uClibc is under the LGPL which states:

  5. A program that contains no derivative of any portion of the
Library, but is designed to work with the Library by being compiled or
linked with it, is called a "work that uses the Library".  Such a
work, in isolation, is not a derivative work of the Library, and
therefore falls outside the scope of this License.

So your application can link to uClibc and not be required to be open
source. This would not be true if the GPL license was used, but is true
under the LGPL.

lixi_avansys wrote:
> 
> hello,
> 
>     we want to make a product using Coldfire5272 with uclinux, but we meet a license problem.
> 
>     according to GPL/LGPL we need to open our application source code if the application program are static linked with uc-libc.
> 
>     I want to know how to avoid to open application source code , otherwise the others can clone our product without any problem . Some other company using uclinux in their product may face same problem before so I want to know how them handle this?
> 
>                                                 thanks a lot!
> 
>                                                     windstone
> ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿòâ?ìLL7b±Ë¬²*'?¨¥Sx%SËa¶Úÿÿùb²ÛÿSwëi×swú+fùsSYsYùb²Ø§~?åS{±þk]

-- 
Tim Riker - http://rikers.org/ - TimR@Debian.org
Lineo CTO - Tim@Lineo.com - http://www.Lineo.com/
BZFlag maintainer - http://BZFlag.org/ - for fun!
