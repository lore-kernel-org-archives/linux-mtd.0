Received: from zmc.proxad.net ([212.27.53.206])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rl1bN-0004ZU-AJ
 for linux-mtd@lists.infradead.org; Wed, 11 Jan 2012 17:04:41 +0000
Message-ID: <4F0DC11E.5020308@freebox.fr>
Date: Wed, 11 Jan 2012 18:04:30 +0100
From: Florian Fainelli <ffainelli@freebox.fr>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] cfi: AMD/Fujitsu compatibles: add panic write support
References: <1325878159-32306-1-git-send-email-iws@ovro.caltech.edu>
 <4F0C124F.7040807@freebox.fr> <1326233055.2335.13.camel@koala>
 <4F0CB86C.10006@freebox.fr> <1326234127.2335.19.camel@koala>
In-Reply-To: <1326234127.2335.19.camel@koala>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 "Ira W. Snyder" <iws@ovro.caltech.edu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 01/10/12 23:22, Artem Bityutskiy wrote:
> On Tue, 2012-01-10 at 23:15 +0100, Florian Fainelli wrote:
>>
>> My concern is about not adding more code which is barely used. I
>> don't
>> question the mtdoops driver, it definitively is useful.
>
> I'd actually question "substential" - a tiny piece in generic parts
> and few functions in drivers does not look substantial.

Fair enough, though that is exactly how the kernel gets more and more 
bloated with features added and no way to get them disabled.
--
Florian
