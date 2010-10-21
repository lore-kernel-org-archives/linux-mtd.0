Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P915b-00023L-OR
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2010 19:46:16 +0000
Received: by fxm5 with SMTP id 5so390780fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Oct 2010 12:46:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4CC0621E.9040102@gmail.com>
References: <1287645577-13538-1-git-send-email-computersforpeace@gmail.com>
	<1287645577-13538-2-git-send-email-computersforpeace@gmail.com>
	<AANLkTikthtaMh0qjFVLu29ZbageANnd_JsbB7wLqiMSM@mail.gmail.com>
	<4CC0621E.9040102@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 21 Oct 2010 15:45:53 -0400
Message-ID: <AANLkTi=kVN90MrdD5f9ifzb4XLrV4Gh7Z00iHkeRYQ7Y@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mtd-utils: nanddump/nandwrite: style, signed-ness,
	printing fixups
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 21, 2010 at 11:54, Brian Norris wrote:
> On 10/21/2010 12:37 AM, Mike Frysinger wrote:
>> On Thu, Oct 21, 2010 at 03:19, Brian Norris wrote:
>>> There were some signed/unsigned integer comparisons. Their types were
>>> changed for safety. Also, "strtol" was improperly used for unsigned
>>> data types.
>>
>> dont really like these being merged, but that's obviously Artem's call, not mine
>
> What exactly do you not like? The use of unsigned types, the use of
> strtoul, a lack of consistency, or something else? I'm open to changing
> my type usages if you have ideas that make more sense.

i dont have a problem with the changes.  i was talking about doing
style and functional (type changes) in one patch rather than two.
-mike
