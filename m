Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1ME4vV-0002dd-H1
	for linux-mtd@lists.infradead.org; Tue, 09 Jun 2009 17:16:05 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1ME4vS-0005yf-1f
	for linux-mtd@lists.infradead.org; Tue, 09 Jun 2009 17:15:54 +0000
Received: from adsl-99-185-243-218.dsl.pltn13.sbcglobal.net ([99.185.243.218])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2009 17:15:54 +0000
Received: from jehan by adsl-99-185-243-218.dsl.pltn13.sbcglobal.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2009 17:15:54 +0000
To: linux-mtd@lists.infradead.org
From: Jehan Bing <jehan@orb.com>
Subject: Re: [PATCH] [MTD-UTILS] Bad block handling in nandwrite when reading
	from standard input
Date: Tue, 09 Jun 2009 10:15:41 -0700
Message-ID: <4A2E98BD.30704@orb.com>
References: <h0k3il$ij6$1@ger.gmane.org>
	<1244551983.5847.388.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <1244551983.5847.388.camel@localhost.localdomain>
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Mon, 2009-06-08 at 15:32 -0700, Jehan Bing wrote:
>   
>> Nandwrite tries to use lseek() when failing to write on a page. lseek() will fail when used on the standard input so nandwrite fails. This code replaces lseek with a buffer.
>>
>> When the data is read, it is put in a buffer (filebuf). This buffer is reset at each block boundary. So a "seek" just means reading from the beginning of the buffer. writebuf and oobreadbuf are now just pointers to locations in filebuf.
>>
>> With this change, reading from stdin or from a file now uses the same code path.
>>
>>
>> Signed-off-by: Jehan Bing <jehan@orb.com>
>
> Too large patch for me to review. Could you split it on few smaller
> ones please?
>   

Ok, I'll see what I can do.


> Also, please, do not send e-mails with
>  looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong
> lines. Please, wrap them to 78 characters. You'll make it then
> easier for other people to deal with you. Let's be nice.
>   

Sorry, I'm still trying to find the correct configuration for my mailer. 
I followed the instruction in the email-clients documentation but that 
broke things for me.
Hopefully this one will work better.
