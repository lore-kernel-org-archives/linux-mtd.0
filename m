Received: from 228-216.205.122.dellhost.com ([216.205.122.228] helo=lakeshoremicro.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16lCUl-0000qv-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2002 17:25:00 +0000
Message-ID: <001a01c1cab5$8ea76170$0101a8c0@dellc800>
From: "Mark Meade" <mark@lakeshoremicro.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: "Vadim Khmelnitsky" <VadimK@m-sys.com>,
	<linux-mtd@lists.infradead.org>
References: <000f01c1caa0$8cdd3550$0101a8c0@dellc800>  <002201c1ca2b$00ca7fc0$0101a8c0@dellc800> <AEA9DCA73595D411A6D4009027DE9C5E019BFA74@MSI-EX6> <4513.1015976946@redhat.com> <6602.1015982029@redhat.com>  <20430.1016033617@redhat.com>
Subject: Re: UnitSizeFactor of != 1 yet? 
Date: Wed, 13 Mar 2002 12:35:43 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Reverting back to nftlmount 1.25 and removing check seems to have similar problems.
Attempting to boot gets past NFTL_setup and "nftla: nftla1", but locks up soon after that.
Mounting ext2 partition works, but still gives error messages described earlier.

David Woodhouse wrote:

> Weird. Can you revert to the older version, just remove the check for
> UnitSizeFactor and see if it exhibits the same behaviour? Maybe I broke
> something else in the process?
