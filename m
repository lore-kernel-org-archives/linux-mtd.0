Received: from mercury.sun.com ([192.9.25.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15L7Gu-0002Y5-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2001 19:02:36 +0100
Message-ID: <3B4F3ABA.2EFCAB42@sun.com>
Date: Fri, 13 Jul 2001 11:15:22 -0700
From: Tim Hockin <thockin@sun.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: module names in request_module()
References: <3B4E5085.62422401@sun.com> <24251.995007133@redhat.com>
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

David Woodhouse wrote:
> 
> thockin@sun.com said:
> >  if I depmod a module that needs cfi and cfi_probe is not loaded,
> > request_module fails, because it is looking for the module named "cfi"
> > not "cfi_probe".
> 
> Does v1.9 of chipreg.c fix it correctly?

only for cfi

the problem is that the module name is not predictable from the "probe"
name.

cfi -> cfi_probe.o
jedec -> jedec.o
ram -> map_ram.o
rom -> map_rom.o
amd_flash -> amd_flash.o

there is no way to have that knowledge a priori with modules.


So we have three options:
	1) rename files to match their probe names
	2) rename probe names to match module names
	3) use modules.conf to give external fixes for internal flaws

I'm leaning towards #2.  Comments?  

-- 
Tim Hockin
Systems Software Engineer
Sun Microsystems, Cobalt Server Appliances
thockin@sun.com
