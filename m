Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MkvZh-0007RD-QH
	for linux-mtd@lists.infradead.org; Tue, 08 Sep 2009 07:57:18 +0000
Message-ID: <4AA60E6C.6060307@nokia.com>
Date: Tue, 08 Sep 2009 10:57:32 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: JerinJacob <jerin.jacob@maxim-ic.com>
Subject: Re: UBIFS Error
References: <4AA5F37F.4050307@maxim-ic.com>
In-Reply-To: <4AA5F37F.4050307@maxim-ic.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Bityutskiy Artem \(Nokia-M/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

JerinJacob wrote:
> Hi All,
> 
> Got an UBIFS error while performing a regression write test on UBIFS 
> file system.
> 
> 
> [Issue]
> =======
> 
> While performing a regression write test on UBIFS file system,the UBIFS 
> file system becomes read-only mode.
> pseudo code for the regression write test as follows:
> 
> while(1)
> {
> create and write a random image(with different block size using dd 
> command) to nand flash
> 
> if "disk space is reached maxim size"
>     delete all the files
> 
> }

Can you provide the actual test?
