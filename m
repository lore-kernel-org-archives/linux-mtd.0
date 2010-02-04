Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nd7XF-0001tE-QC
	for linux-mtd@lists.infradead.org; Thu, 04 Feb 2010 19:38:46 +0000
Received: by vws14 with SMTP id 14so855518vws.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 Feb 2010 11:38:40 -0800 (PST)
Message-ID: <4B6B221E.2060409@gmail.com>
Date: Thu, 04 Feb 2010 20:38:06 +0100
From: Marek Skuczynski <mareksk7@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: Emulated write failures cause block marking as bad
References: <a328840c1002040902ic5c17a8p5262e482b4fced01@mail.gmail.com>
	<1265304794.7343.135.camel@localhost>
In-Reply-To: <1265304794.7343.135.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem,
> Using this option to
>> volume update test
>>    makes no sense.
>>     
> This is too strong statement. It does make sens - you verify that the
> error handling functionality works.
>
> You can say that this option is not good enough for you, this will be
> more fair statement.
>   

Okay. You are right. This option is not implemented as I expect.

>>    I am using kernel 2.6.23 with updated UBI  from 2.6.29.
>>    Have you experienced this problem already ? if so, is this has been fixed ?
>>     
> Yes, I saw it. This is purely a debugging feature, and it was enough for
> me.
>
> You can easilly develop it a bit more, and make it stop returning erase
> errors when the amount of bad eraseblocks has reached some level.
>
> Just amend ubi_dbg_is_erase_failure()
>
> You might want to do the same for 'ubi_dbg_is_write_failure()', for the
> same reasons, basically.
>
>   
Yes, of course I can modify the number of errors that will be reported.
However, I would expect that the "emulated write errors" will be
reported out of sync_erase() function,
because most of these errors are reported during writing EC header (in
my case) just after flash block
is erased. As result of this, using the "emulated write errors" I have
almost the same behavior that
I would get with "emulated erase errors" enabled.

Okay, maybe my case is isolated because of tested system configuration,
I will try manage this case myself.

Regards,
  Marek
