Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QfGC8-00038x-23
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2011 18:54:33 +0000
Received: by pvg20 with SMTP id 20so1647524pvg.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Jul 2011 11:54:24 -0700 (PDT)
Message-ID: <4E17524F.3020000@gmail.com>
Date: Fri, 08 Jul 2011 11:54:07 -0700
From: "Justin P. Mattock" <justinmattock@gmail.com>
MIME-Version: 1.0
To: Jiri Kosina <jkosina@suse.cz>
Subject: Re: [RFC 6/9]drivers:char:nvram.c Change the copyright info.
References: <1290838879-11038-1-git-send-email-justinmattock@gmail.com>
	<1290838879-11038-7-git-send-email-justinmattock@gmail.com>
	<alpine.LNX.2.00.1107081832490.11049@pobox.suse.cz>
In-Reply-To: <alpine.LNX.2.00.1107081832490.11049@pobox.suse.cz>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-rdma@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/08/2011 09:33 AM, Jiri Kosina wrote:
> On Fri, 26 Nov 2010, Justin P. Mattock wrote:
>
>> Change the copyright info from Sun Microsystems to Oracle since Oracle now owns them.
>>
>> Signed-off-by: Justin P. Mattock<justinmattock@gmail.com>
>>
>> ---
>>   drivers/char/nvram.c |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/char/nvram.c b/drivers/char/nvram.c
>> index 166f1e7..33e8faa 100644
>> --- a/drivers/char/nvram.c
>> +++ b/drivers/char/nvram.c
>> @@ -3,7 +3,7 @@
>>    *
>>    * Copyright (C) 1997 Roman Hodek<Roman.Hodek@informatik.uni-erlangen.de>
>>    * idea by and with help from Richard Jelinek<rj@suse.de>
>> - * Portions copyright (c) 2001,2002 Sun Microsystems (thockin@sun.com)
>> + * Portions copyright (c) 2001,2002 Oracle and/or its affiliates. (thockin@sun.com)
>>    *
>>    * This driver allows you to access the contents of the non-volatile memory in
>>    * the mc146818rtc.h real-time clock. This chip is built into all PCs and into
>
> You can't just change other people/company copyright.
>
> This will need Signoff from the original copyright holder at least.
>

yeah I think somebody from oracle had already told me this the day I had 
sent these out. from what I remember here is the original thread:
https://lkml.org/lkml/2010/11/27/31

so somebody from oracle needs to claim this, and the rest of the kernel!


Justin P. Mattock
