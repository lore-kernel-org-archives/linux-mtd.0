Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M7PAQ-0006r0-GA
	for linux-mtd@lists.infradead.org; Fri, 22 May 2009 07:27:52 +0000
Message-ID: <4A165425.3070209@nokia.com>
Date: Fri, 22 May 2009 10:28:37 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Philip Rakity <prakity@yahoo.com>
Subject: Re: Advice needed on test tools for UBI/UBIFS Flash Testing
References: <645039.23613.qm@web58906.mail.re1.yahoo.com>
In-Reply-To: <645039.23613.qm@web58906.mail.re1.yahoo.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Philip Rakity wrote:
> 
> We have UBI/UBIFS working with MLC Flash (4K pages).  Before going into production we would like to stress test the system for all the obvious reasons.
> 
> What tools / tests would one recommend to do this.  


There are file system tests in LTP http://ltp.sourceforge.net/
including one called fsstress which is good for stress testing.

We would typically do power-off-recovery testing with fsstress
running.

There are also tests in mtd-utils:

	http://git.infradead.org/mtd-utils.git

We tend to run the integrity test as a basic test of whether things work,
but it is best if it can unmount the partition.

There are a bunch of tests in mtd-utils/tests/fs-tests that are run by
the run-all.sh script there.
