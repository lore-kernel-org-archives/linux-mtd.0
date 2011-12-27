Received: from mail1-relais-roc.national.inria.fr ([192.134.164.82])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RfSoj-0001mT-4U
 for linux-mtd@lists.infradead.org; Tue, 27 Dec 2011 08:55:30 +0000
Date: Tue, 27 Dec 2011 09:36:04 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 2/2] drivers/mtd/maps/lantiq-flash.c: drop iounmap for
 devm_ allocated data
In-Reply-To: <1324974236.1165.43.camel@sauron.fi.intel.com>
Message-ID: <alpine.DEB.2.02.1112270935410.1838@localhost6.localdomain6>
References: <1324921081-13161-2-git-send-email-julia@diku.dk>
 <1324974236.1165.43.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 27 Dec 2011, Artem Bityutskiy wrote:

> On Mon, 2011-12-26 at 18:38 +0100, Julia Lawall wrote:
>> From: Julia Lawall <julia@diku.dk>
>>
>> Data allocated with devm_ioremap or devm_ioremap_nocache should not be
>> freed using iounmap, because doing so causes a dangling pointer, and a
>> subsequent double free.
>>
>> The semantic match that finds this problem is as follows:
>> (http://coccinelle.lip6.fr/)
>>
>> // <smpl>
>> @r@
>> expression x;
>> @@
>> (
>>  x = devm_ioremap(...)
>> |
>>  x = devm_ioremap_nocache(...)
>> )
>>
>> @@
>> expression r.x;
>> @@
>> * iounmap(x)
>> // </smpl>
>
> Thanks Julia,
>
> surely this semantic patch script is worth adding to scripts/coccinelle?
> Are you going to take care of this?

OK, I will do that.

julia
