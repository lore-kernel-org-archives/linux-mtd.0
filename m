Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17jnHf-0003Eh-00
	for <linux-mtd@lists.infradead.org>; Tue, 27 Aug 2002 21:49:55 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D6BD539.4050101@goepel.com> 
References: <3D6BD539.4050101@goepel.com>  <3D6BCCFD.4090707@goepel.com> <27451.1030476296@redhat.com> 
To: Michael Palme <m.palme@goepel.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: flash file system for production use 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 27 Aug 2002 21:49:43 +0100
Message-ID: <29072.1030481383@redhat.com>
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

m.palme@goepel.com said:
> okay... thanks for the answer. i will do some serious testing myself.
> what would be a real life  scenario ??? is a random loop with
> creating, writing and deleting files  mixed with mounting and
> unmounting and some random powerfaults???

Yeah -- coupled with sanity checking every existing file on the file system 
at every remount, etc. And make them _real_ powerfaults, with an X10 
controller or something. You get really weird behaviour out of flash chips 
that way -- which we should deal with just fine.

If you're going to report any faults, it's best to do the testing with 
CONFIG_JFFS2_FS_DEBUG=1 and _logging_ the kernel messages over a serial 
port. But that of course slows down the test run. YMMV. A 230400 baud 
serial console helps :)

--
dwmw2
