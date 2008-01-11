Received: from mail.semihalf.com ([83.15.139.206])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JDLny-0006VH-SA
	for linux-mtd@lists.infradead.org; Fri, 11 Jan 2008 15:28:29 +0000
Message-ID: <47878AD4.2070204@semihalf.com>
Date: Fri, 11 Jan 2008 16:27:16 +0100
From: Bartlomiej Sieka <tur@semihalf.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH][MTD] Fix incorrect interface code for x16/x32 chips
References: <20071126175517.GA1221@frozen.semihalf.com>	
	<4755E020.4070702@semihalf.com> <4785E372.9010409@semihalf.com>
	<1200003063.2954.4.camel@shinybook.infradead.org>
In-Reply-To: <1200003063.2954.4.camel@shinybook.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
[...]
>>>> According to "Common Flash Memory Interface Publication 100" dated 
>>>> December 1, 2001, the interface code for x16/x32 chips is 0x0005, 
>>>> and not 0x0004 used so far.
>>>>
>>>> Signed-off-by: Bartlomiej Sieka <tur@semihalf.com>
[...]
> Sorry. As Jörn said, I tend to apply patches in bursts. When the merge
> window is about to open I try to make sure I catch up. I've applied your
> patch now.

OK, thanks.

> 
> Sending it on my girlfriend's birthday and then following up on my
> birthday isn't the best way to make sure I pay attention, fwiw :)

Ah, I've marked my calendar now :)

Cheers,
Bartlomiej
