Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EgWwc-0000FC-Nn
	for linux-mtd@lists.infradead.org; Sun, 27 Nov 2005 19:32:37 -0500
Message-ID: <438A5023.4040503@inf.u-szeged.hu>
Date: Mon, 28 Nov 2005 01:32:35 +0100
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <8126E4F969BA254AB43EA03C59F44E840C3738@pdsmsx404>	<4386FC5F.9050305@yandex.ru>
	<4389AE3D.8000807@inf.u-szeged.hu> <4389B293.3020507@yandex.ru>
In-Reply-To: <4389B293.3020507@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, "Zhao, Forrest" <forrest.zhao@intel.com>
Subject: Re: The problem that I didn't think out
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

> Nonetheless, tests should show the worthiness of keys compression. 
> There is obviously a (CPU time) vs. (amount of flash IO) trade-off. 
> Thus, I offer to wait for a JFFS3 prototype and evaluate this. Let's 
> mark this stuff as "to be evaluated".

Yes, I think the same.

>> The big questions are that questions you already thinging on: garbage
>> collection and wear leveling. Without solving them JFFS3 have no nice
>> future. I only would like to say that now we are also thinking on these
>> important problems... and we will write if anything usable found. (I may
>> be better feeling to thinking on someting not alone... :) )
>
> Great! :-)

I was thinking a lot. There is something in my mind, but I have to think 
it over again tomorrow before writing it down.

Be that as it may I have a NAND question, I think you know the answer 
(NAND Guru Artem :) ):
- if there is and erase block aready fulled, is there any possibility to 
mark its pages as obsolated (individually)? Is it allowed to write to 
OOB (or data) area one more? (or write OOB later than the data... or 
similar trick?)
At NOR it is so easy.

Ferenc
