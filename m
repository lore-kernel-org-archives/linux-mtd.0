Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MITNi-0007RB-Kf
	for linux-mtd@lists.infradead.org; Sun, 21 Jun 2009 20:11:21 +0000
Message-ID: <4A3E940A.8090603@nokia.com>
Date: Sun, 21 Jun 2009 23:11:54 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: jerry <jerrydreaming@gmail.com>
Subject: Re: the memory consumption about ubifs
References: <71103bce0906181936k49ee800ejfa1830b6c6193ce5@mail.gmail.com>
In-Reply-To: <71103bce0906181936k49ee800ejfa1830b6c6193ce5@mail.gmail.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

jerry wrote:
>      Now,I have a problem.The filesysterm is ubifs.When the page size
> of nandflash  changes from 2k to 4k£¬the memory consumes more than
> 4M.What can I do to reduce the memory consumption£¿

What is the LEB size?
