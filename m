Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M7PRw-00049l-9f
	for linux-mtd@lists.infradead.org; Fri, 22 May 2009 07:46:01 +0000
Message-ID: <4A165848.4030108@nokia.com>
Date: Fri, 22 May 2009 10:46:16 +0300
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
> We have UBI/UBIFS working with MLC Flash (4K pages).  Before going into production we would like to stress test the system for all the obvious reasons.
> 
> What tools / tests would one recommend to do this.  

And you should take this patch if you don't have it:

http://git.infradead.org/ubifs-2.6.git?a=commitdiff;h=8b3884a841f398f6e0a0411d6929d8d9381bb265
