Received: from webapps.arcom.com ([194.200.159.168])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BBGDI-0008Us-BW
	for linux-mtd@lists.infradead.org; Wed, 07 Apr 2004 17:47:44 +0100
Message-ID: <407430AD.2020705@arcom.com>
Date: Wed, 07 Apr 2004 17:47:41 +0100
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
References: <40742192.5030901@imc-berlin.de>
	<1081354787.4799.191.camel@tubarao>
In-Reply-To: <1081354787.4799.191.camel@tubarao>
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

> These error messages are from an ancient version of cfi_cmdset_0002.c.
> They come from over-efficient software design that didn't consider the
> quirks of how a flash chip works. Have you tried a recent version?

Be aware that the more recent version from MTD CVS are broken for 
interleaved chips.

http://lists.infradead.org/pipermail/linux-mtd/2004-March/009467.html

David Vrabel
