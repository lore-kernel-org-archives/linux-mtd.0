Received: from ik-out-1112.google.com ([66.249.90.183])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KvKSl-0002zR-Lc
	for linux-mtd@lists.infradead.org; Wed, 29 Oct 2008 23:28:31 +0000
Received: by ik-out-1112.google.com with SMTP id b32so278148ika.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Oct 2008 16:28:30 -0700 (PDT)
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: 2.6.28-rc2: (mtd)block/partitions BUG with kobject reference count
References: <87ej1z4ep8.fsf@macbook.be.48ers.dk>
	<200810300027.19116.rjw@sisk.pl>
From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 Oct 2008 00:28:27 +0100
In-Reply-To: <200810300027.19116.rjw@sisk.pl> (Rafael J. Wysocki's message of
	"Thu\, 30 Oct 2008 00\:27\:18 +0100")
Message-ID: <87abcnj810.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: Peter Korsgaard <jacmet@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Rafael" == Rafael J Wysocki <rjw@sisk.pl> writes:

 Rafael> On Wednesday, 29 of October 2008, Peter Korsgaard wrote:
 >> Hi,
 >> 
 >> I'm seing what looks like a kobject reference count issue with
 >> mtdblock_ro + mtd_dataflash + mtd partitions and repeated unbind/bind.
 >> I'm on 2.6.28-rc2, but I can reproduce the problem on 2.6.27 as well.

 Rafael> Is it reproducible with 2.6.26 too?

Sorry, I haven't backported my platform support code to such "old"
kernel. I can do it though, if you think it will help pinpoint the
issue.

-- 
Bye, Peter Korsgaard
