Received: from alias1.ihug.co.nz ([203.96.222.11])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HJd9n-0000qi-8b
	for linux-mtd@lists.infradead.org; Tue, 20 Feb 2007 22:08:23 +0000
From: "Gavin Lambert" <gavinl@compacsort.com>
To: <tglx@linutronix.de>
Subject: RE: Why is PEB not erased before writing???
Date: Wed, 21 Feb 2007 10:48:51 +1300
Message-ID: <037a01c75538$eb2a3590$0502a8c0@gavinlpc>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1171970271.30834.231.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Quoth Thomas Gleixner [tglx@linutronix.de]:
> On Tue, 2007-02-20 at 16:41 +0530, Brijesh Singh wrote:
>> Yes I did enable this CONFIG_MTD_UBI_USERSPACE_IO  option.We can't
>> write the device if this flag is not enabled.UBI treats the device as
>> readonly. This  is the usual way to write UBI device,I guess.
> 
> No. It is not. It is a _DEBUG_ option. UBI has an update mechanism.
> See documentation. 

Perhaps it needs to be named better then :)
