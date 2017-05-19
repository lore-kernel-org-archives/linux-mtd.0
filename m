Received: from mail-yw0-x244.google.com ([2607:f8b0:4002:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBgD4-0008Kw-BE
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 11:36:43 +0000
Received: by mail-yw0-x244.google.com with SMTP id h82so4715806ywb.3
 for <linux-mtd@lists.infradead.org>; Fri, 19 May 2017 04:36:22 -0700 (PDT)
Date: Fri, 19 May 2017 07:36:14 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 08/30] isa.txt: standardize document format
Message-ID: <20170519113613.GA26174@sophia>
References: <cover.1495156975.git.mchehab@s-opensource.com>
 <3cfb5ad6db86330e07c6d0f833bbdb2788d99fa7.1495156975.git.mchehab@s-opensource.com>
 <20170519021355.GA24556@sophia> <20170519055500.0334ebdc@vento.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20170519055500.0334ebdc@vento.lan>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 19, 2017 at 05:55:00AM -0300, Mauro Carvalho Chehab wrote:
>Hi William,
>
>Em Thu, 18 May 2017 22:13:55 -0400
>William Breathitt Gray <vilhelm.gray@gmail.com> escreveu:
>
>> On Thu, May 18, 2017 at 10:24:00PM -0300, Mauro Carvalho Chehab wrote:
>> >Each text file under Documentation follows a different
>> >format. Some doesn't even have titles!
>> >
>> >Change its representation to follow the adopted standard,
>> >using ReST markups for it to be parseable by Sphinx:
>> >
>> >- Use the main title standard for this document;
>> >- replace _foo_ by **foo** for emphasis;
>> >- mark literal blocks as such.
>> >
>> >Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>  
>> 
>> I'm all right with this patch, but there's just one minor nitpick about
>> the title that I've inlined.
>> 
>> Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>
>
>Thanks for review!
>
>> >---
>> > Documentation/isa.txt | 53 ++++++++++++++++++++++++++-------------------------
>> > 1 file changed, 27 insertions(+), 26 deletions(-)
>> >
>> >diff --git a/Documentation/isa.txt b/Documentation/isa.txt
>> >index f232c26a40be..def4a7b690b5 100644
>> >--- a/Documentation/isa.txt
>> >+++ b/Documentation/isa.txt
>> >@@ -1,5 +1,6 @@
>> >+===========
>> > ISA Drivers
>> >------------  
>> 
>> There's no need for this single-dashed line now so just remove it.
>
>Actually, the patch is removing the single-dashed line. The first "-"
>character on the above line from diff :-)

Ah yes, my apologies, you're absolutely correct! This should be
perfectly fine then.

William Breathitt Gray

>
>> 
>> >+===========
>
>
>Thanks,
>Mauro
