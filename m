Received: from prgv79.xdsl.pgtc.com ([65.163.80.196] helo=bitworks.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16tXEK-0007PT-00
	for <linux-mtd@lists.infradead.org>; Fri, 05 Apr 2002 18:10:28 +0100
Received: from rsmth [192.168.0.18] by bitworks.com [127.0.0.1] with SMTP (MDaemon.v2.7.SP4.R) for <linux-mtd@lists.infradead.org>; Fri, 05 Apr 2002 11:13:03 -0600
From: "Richard A. Smith" <rsmith@bitworks.com>
To: "stepan@suse.de" <stepan@suse.de>
Cc: "linuxbios@lanl.gov" <linuxbios@lanl.gov>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Fri, 05 Apr 2002 11:09:54 -0600
Reply-To: "Richard A. Smith" <rsmith@bitworks.com>
In-Reply-To: <20020404123603.A2734@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: Re: jedec_probe_chip error?
Message-ID: <MDAEMON-F200204051113.AA130309MD40469@bitworks.com>
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

On Thu, 4 Apr 2002 12:36:04 +0200, Stefan Reinauer wrote:

>
>get /dev/bios from the OpenBIOS cvs tree:
>http://www.freiburg.linux.de/OpenBIOS/dev/cvs.html
>

The Readme lists that this should work under a 2.2.x kernel, however
I get serveral errors trying to compile with 2.2.19 

Things like:

structure has no member nameed 'resource'
'PCI_ROM_RESOURCE' undeclared

Does it sill work with 2.2.x?

I'm using the latest tarball from the above link.  I was unable to
get a CVS copy as it kept complaining that 'anonymous' was an unknown
user.

--
Richard A. Smith                         Bitworks, Inc.               
rsmith@bitworks.com               501.846.5777 x204                        
Sr. Design Engineer        http://www.bitworks.com   
