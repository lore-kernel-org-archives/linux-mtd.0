Received: from ms01.sssup.it ([193.205.80.99] helo=sssup.it)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F8z9F-0003w0-7r
	for linux-mtd@lists.infradead.org; Tue, 14 Feb 2006 07:19:19 -0500
Received: from [193.205.82.7] (HELO gandalf.sssup.it)
	by sssup.it (CommuniGate Pro SMTP 4.1.8)
	with ESMTP-TLS id 19664169 for linux-mtd@lists.infradead.org;
	Tue, 14 Feb 2006 13:18:53 +0100
Message-ID: <43F1CABE.4040300@gandalf.sssup.it>
Date: Tue, 14 Feb 2006 13:19:10 +0100
From: Michael Trimarchi <trimarchi@gandalf.sssup.it>
MIME-Version: 1.0
To: Michael Trimarchi <trimarchi@gandalf.sssup.it>
References: <43F1C5FC.9010402@gandalf.sssup.it>
In-Reply-To: <43F1C5FC.9010402@gandalf.sssup.it>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Skipping bad block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Michael Trimarchi wrote:

> Hi all,
> I modify the flash_eraseall width two new parameter start e size. It 
> skips the bad block but dd does't skip. Which utility may I use to 
> write and skip the bad block.
> Regards Michael
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
I do it with nandwrite
Regards
