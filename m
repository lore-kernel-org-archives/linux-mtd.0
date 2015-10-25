Received: from smtp02.smtpout.orange.fr ([80.12.242.124]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZqGEj-0006PC-Bn
 for linux-mtd@lists.infradead.org; Sun, 25 Oct 2015 08:01:06 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [patch] mtd/docg3: off by one in doc_register_sysfs()
References: <20151019102005.GF26688@mwanda> <87twpgwahr.fsf@belgarion.home>
 <20151024174912.GD7289@mwanda>
Date: Sun, 25 Oct 2015 08:54:16 +0100
In-Reply-To: <20151024174912.GD7289@mwanda> (Dan Carpenter's message of "Sat,
 24 Oct 2015 20:49:12 +0300")
Message-ID: <87wpubl6xj.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Sat, Oct 24, 2015 at 11:49:27AM +0200, Robert Jarzmik wrote:
>> Dan Carpenter <dan.carpenter@oracle.com> writes:
>> 
>> > Smatch found a bug in the error handling:
>> >
>> > 	drivers/mtd/devices/docg3.c:1634 doc_register_sysfs()
>> > 	error: buffer overflow 'doc_sys_attrs' 4 <= 4
>> >
>> > The problem is that if the very last device_create_file() fails, then we
>> > are beyond the end of the array.  Actually, any time i == 3 then there
>> > is a problem.  We can fix this an simplify the code at the same time by
>> > moving the !ret conditions out of the for loops and using a goto
>> > instead.
>> 
>> Hi Dan,
>> 
>> I must admit I don't see the issue here :
>>  - if the last device_create_file() fail, we have :
>>    - i = 3, ret = -Exxx
>>    - doc_sys_attrs[floor][0] is populated
>>    - doc_sys_attrs[floor][1] is populated
>>    - doc_sys_attrs[floor][2] is populated
>>    - doc_sys_attrs[floor][3] is probably NULL
>
> We increment "i" to 4.
Ah yes, I see it now, thanks. Somehow in my brain the !ret condition in the for
loop was preventing the increment ... silly.

So:
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
