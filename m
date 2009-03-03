Received: from mail-fx0-f174.google.com ([209.85.220.174])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LePMl-0002Pu-P9
	for linux-mtd@lists.infradead.org; Tue, 03 Mar 2009 07:48:42 +0000
Received: by fxm22 with SMTP id 22so2415007fxm.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 02 Mar 2009 23:48:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1236062311.4261.43.camel@localhost.localdomain>
References: <52e42efe0903010645t7de56621t59de14626953e0fe@mail.gmail.com>
	<1236062311.4261.43.camel@localhost.localdomain>
Date: Tue, 3 Mar 2009 08:48:22 +0100
Message-ID: <71cd59b00903022348u34f272cci927fe492c006125d@mail.gmail.com>
Subject: Re: libubiio : userspace UBI input output library
From: Corentin Chary <corentin.chary@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Sidney Amani <seed95@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 3, 2009 at 7:38 AM, Artem Bityutskiy <dedekind@infradead.org> wrote:
> On Sun, 2009-03-01 at 15:45 +0100, Sidney Amani wrote:
>> Hi list,
>>
>> UBIIO library is an user-space library which exports same functions in
>> UBI Linux kernel module.
>> It provides exactly the same API as the kernel does, that way kernel
>> code can be used in user-space without any change.
>> The code is widely inspired with libubi source code.
>>
>> Documentation can be found at http://uffs.org/api/libubiio.html
>> It is obviously the same as UBI kernel API, but there is actually few
>> differences in return values.
>>
>> The code can be found at http://git.uffs.org/
>>
>> We would like to know if you are interested in it and want to include
>> it in mtdutils.
>
> Hi, I guess this is useful. Just wonder, if you are targeted to
> mtd-utils, why not to develop in there from the very beginning? Use
> similar coding style, clean-up current code if needed, etc?
>

Hi,
We first made that lib for us. And as it can be considered as "usable" (wich is
not the case for the rest of the project) we posted it there.
If you think it can be merged in mtd-utils, we'll take some time for
the coding style
and cleanups... I wanted to do that before, but didn't had a lot of
time to do so.
Which part of mtd-utils could use this lib ? maybe mkfs.ubifs ?

-- 
Corentin Chary
http://xf.iksaif.net
