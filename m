Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dfZHA-00005D-4E
 for linux-mtd@lists.infradead.org; Wed, 09 Aug 2017 22:16:29 +0000
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
 [209.85.220.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 89DDE22B5D
 for <linux-mtd@lists.infradead.org>; Wed,  9 Aug 2017 22:16:07 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id x191so43882554qka.5
 for <linux-mtd@lists.infradead.org>; Wed, 09 Aug 2017 15:16:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170719214447.228f13d2@bbrezillon>
References: <20170718214339.7774-37-robh@kernel.org>
 <20170719214447.228f13d2@bbrezillon>
From: Rob Herring <robh@kernel.org>
Date: Wed, 9 Aug 2017 17:15:46 -0500
Message-ID: <CAL_JsqL19zdtGxV49C+OHtZOf2jrEUJ0BVU1=jXghrYhWgcQmg@mail.gmail.com>
Subject: Re: [PATCH] mtd: Convert to using %pOF instead of full_name
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 19, 2017 at 2:44 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Tue, 18 Jul 2017 16:43:17 -0500
> Rob Herring <robh@kernel.org> wrote:
>
>> Now that we have a custom printf format specifier, convert users of
>> full_name to use %pOF instead. This is preparation to remove storing
>> of the full path string for each node.
>>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> Cc: David Woodhouse <dwmw2@infradead.org>
>> Cc: Brian Norris <computersforpeace@gmail.com>
>> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
>
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Thanks. Please take this thru the mtd tree.

Rob
