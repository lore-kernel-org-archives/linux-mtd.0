Received: from codepoet.org
	([166.70.99.138] helo=winder.codepoet.org ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nB87-0005hi-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 05:54:03 +0100
Date: Thu, 5 Sep 2002 22:54:05 -0600
From: Erik Andersen <andersen@codepoet.org>
To: Tim Riker <Tim@Rikers.org>
Cc: lixi_avansys <lixi@avansys.com>, uclibc@uclibc.org,
	linux <linux-mtd@lists.infradead.org>
Subject: Re: [uClibc]Re: GPL ,LGPL ,and our application
Message-ID: <20020906045405.GA7747@codepoet.org>
Reply-To: andersen@codepoet.org
References: <001801c2532b$fda0d3f0$e8023f0a@l23009> <3D78306A.38DB8612@Rikers.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3D78306A.38DB8612@Rikers.org>
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

On Thu Sep 05, 2002 at 10:34:50PM -0600, Tim Riker wrote:
> This is the wrong list for this question. I've copied the uClibc list on
> my reply that would be a better place to ask.
> 
> As noted in the COPYING.LIB:
> 
> http://uclibc.org/cgi-bin/cvsweb/uClibc/COPYING.LIB?rev=HEAD&content-type=text/vnd.viewcvs-markup
> 
> uClibc is under the LGPL which states:

Indeed, thanks Tim.  And if people bothered to read the uClibc
FAQ (wishful thinking I know), which is available from 
    http://www.uclibc.org/FAQ.html 
this concern is specifically addressed.  I'll quote the FAQ entry
here for the sake of further squashing this concern:


 If I use uClibc, do I have to release all my source code to the
 world for free? I want to create a closed source commercial
 application and I want to protect my intellectual property.  
 
     No, you do not need to give away your source code just
     because you use uClibc and/or run on Linux. uClibc is
     licensed under the LGPL, just like GNU libc. Using shared
     libraries makes complying with the license easy. If you are
     using uClibc as a shared library, then your closed source
     application is 100% legal.  Please consider sharing some of
     the money you make with us! :-)

     If you are statically linking your closed source application
     with uClibc, then you must take additional steps to comply
     with the uClibc license. You may sell your statically linked
     application as usual, but you must also make your
     application available to your customers as an object file
     which can later be re-linked against updated versions of
     uClibc. This will (in theory) allow your customers to apply
     uClibc bug fixes to your application. You do not need to
     make the application object file available to everyone, just
     to those you gave the fully linked application. 

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
