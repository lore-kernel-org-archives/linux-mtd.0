Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgnVl-0002rB-7a
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 06:36:06 +0000
Subject: Re: [PATCH] ubifs: compress lines for immediate return
To: Richard Weinberger <richard@nod.at>
References: <1473051597-30078-1-git-send-email-hs@denx.de>
 <94271caf-4852-1d08-c6a0-102aac22ab65@nod.at>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org
Reply-To: hs@denx.de
From: Heiko Schocher <hs@denx.de>
Message-ID: <57CD1239.6060105@denx.de>
Date: Mon, 5 Sep 2016 08:35:37 +0200
MIME-Version: 1.0
In-Reply-To: <94271caf-4852-1d08-c6a0-102aac22ab65@nod.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Richard,

Am 05.09.2016 um 08:28 schrieb Richard Weinberger:
> Heiko,
>
> On 05.09.2016 06:59, Heiko Schocher wrote:
>> fix the following code:
>>
>> -ret = expression;
>> -if (ret)
>> -        return ret;
>> -return 0;
>> +return expression;
>
> "Fix"? ;-)
> What was broken?

Ok, fix is to hard spoken ... nothing broken, sorry for confusing!

> I agree that we can write the expression in a different way, but is it really worth it?

I think yes ...

> Is this part of a tree-wide cleanup?

Yes, and I thought it is worth to change this part in linux too.

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
