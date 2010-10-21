Received: from mail-px0-f177.google.com ([209.85.212.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8xV1-000805-0J
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2010 15:56:15 +0000
Received: by pxi13 with SMTP id 13so584903pxi.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Oct 2010 08:56:13 -0700 (PDT)
Message-ID: <4CC0621E.9040102@gmail.com>
Date: Thu, 21 Oct 2010 08:54:06 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH v2 1/2] mtd-utils: nanddump/nandwrite: style, signed-ness,
	printing fixups
References: <1287645577-13538-1-git-send-email-computersforpeace@gmail.com>
	<1287645577-13538-2-git-send-email-computersforpeace@gmail.com>
	<AANLkTikthtaMh0qjFVLu29ZbageANnd_JsbB7wLqiMSM@mail.gmail.com>
In-Reply-To: <AANLkTikthtaMh0qjFVLu29ZbageANnd_JsbB7wLqiMSM@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I just want to be clear in communication this time, so I have a few
clarification questions.

On 10/21/2010 12:37 AM, Mike Frysinger wrote:
> On Thu, Oct 21, 2010 at 03:19, Brian Norris wrote:
>> There were some signed/unsigned integer comparisons. Their types were
>> changed for safety. Also, "strtol" was improperly used for unsigned
>> data types.
> 
> dont really like these being merged, but that's obviously Artem's call, not mine

What exactly do you not like? The use of unsigned types, the use of
strtoul, a lack of consistency, or something else? I'm open to changing
my type usages if you have ideas that make more sense.

>> -       while (lx < (linebuflen - 1) && lx < (ascii_column - 1))
>> +       do {
>>                linebuf[lx++] = ' ';
>> +       } while (lx < (linebuflen - 1) && lx < (ascii_column - 1));
> 
> hmm, unrelated to your changes, but i'm pretty sure this can be
> rewritten into a sprintf ...
>   sprintf(linebuf + lx, "%*s", (linebuflen - 1) - lx, "")
> and integrating the ascii_column stuff too.  or maybe that's too complicated.


I can look try that in the future. You're probably right though. When I
wrote this, I really just copied/pasted/fixed the library hexdump code
from the linux kernel, so I didn't spend time making it the simplest
possible.

Thanks,
Brian
