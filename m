Received: from w228.z208176144.sjc-ca.dsl.cnc.net ([208.176.144.228]
	helo=ns1.pwrseries.com)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1ET0xZ-0002Nh-5f
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2005 13:45:43 -0400
From: "Joseph M Dupre (AVAB Inc.)" <dupre@avab.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 21 Oct 2005 10:45:30 -0700
MIME-Version: 1.0
Message-ID: <4358C6CA.16998.6EB936@localhost>
In-reply-to: <434BFE23.4060701@ieee.org>
References: <434B98B0.776.50BEDB@localhost>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Cc: Dan Brown <dan_brown@ieee.org>
Subject: Re: docboot: nandwrite:  Input file is not page aligned
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11 Oct 2005 at 14:02, Dan Brown wrote:

> If you get the same result, then we're in really weird territory, and
> I'd start to wonder if the mtd tools just don't build (or run)
> properly under uClibc.  Is there any chance you can use a standard
> glibc environment to doublecheck?

OK, issue solved.  There is no problem with nandwrite using uClibc 
librarires.  Docboot works "as advertised" using the uClibc buildroot 
tools. 

My problem was that the doc_spl file was getting corrupted when I 
transferred the image from the build machine to the target.  The 
ftpget command in the uClibc buildroot environment is truncating the 
file durring transfer.  Thus the error messages about "not page 
aligned" were correct.  Sorry.

- Joe 
