Received: from webapps.arcom.com ([194.200.159.168])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BDLj9-0004ut-Ib
	for linux-mtd@lists.infradead.org; Tue, 13 Apr 2004 12:05:16 +0100
Message-ID: <407BC953.2060005@arcom.com>
Date: Tue, 13 Apr 2004 12:04:51 +0100
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
References: <40742192.5030901@imc-berlin.de>
	<1081354787.4799.191.camel@tubarao> <407553A5.5010702@imc-berlin.de>
	<20040408143717.GA1921@wohnheim.fh-wedel.de>
	<1081514570.20197.182.camel@imladris.demon.co.uk>
In-Reply-To: <1081514570.20197.182.camel@imladris.demon.co.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: kernel oops in cfi_cmdset_0002.c:do_write_one()...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> 1. Wait till the MTD CVS code is actually stable. It's not at the
>    moment; cfi_cmdset_0002.c is known to be broken and I can't send it
>    off while it's like that.

Revert cfi_cmdset_0002.c back to 1.94?  1.95 is the change that appears 
to have broken interleaved chips.

David
