Received: from ug-out-1314.google.com ([66.249.92.172])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KYdSl-00025g-9L
	for linux-mtd@lists.infradead.org; Thu, 28 Aug 2008 09:06:43 +0000
Received: by ug-out-1314.google.com with SMTP id m2so1237775uge.5
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Aug 2008 02:06:42 -0700 (PDT)
Message-ID: <ac9c93b10808280206u55158b51q6161a9e99c3c24c1@mail.gmail.com>
Date: Thu, 28 Aug 2008 11:06:42 +0200
From: "Frans Meulenbroeks" <fransmeulenbroeks@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH][MTD][NAND]Bad Block Management
In-Reply-To: <1219854666.7107.204.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1219830684.13957.25.camel@il93elnxlog2>
	<ac9c93b10808270359l18c89a84m6d14353e78ee60df@mail.gmail.com>
	<1219854666.7107.204.camel@pmac.infradead.org>
Cc: Sheng-Zhe Zhao <a18689@motorola.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008/8/27 David Woodhouse <dwmw2@infradead.org>:
> On Wed, 2008-08-27 at 12:59 +0200, Frans Meulenbroeks wrote:
>> Wrt the device wise approach: I think I would prefer if I could say
>> per partition if I wanted to use this (and thus have the mapping done
>> per partition). That way filesystems that do their own bad block
>> handling can do it the way they want to.Now it seems a little bit
>> double work to have bad block handling in both the filesystem and in
>> the mtd layer.
>
> I don't believe it lives in the low-level MTD drivers. The _users_ (file
> system code, translation layers, etc.) of devices should handle this as
> they see fit (although we can provide _library_ code for them to use if
> they want to). I don't think it lives in the NAND driver though.
>
David,

As this is reply to my msg, is this directed to me?
If so: yes I am definitely in favour of modularisation, separation of
concerns etc (that is if it does not hamper performance too much).
Then again: as far as I can see it the patch from Zhao is a patch in
the driver level.

Wrt bad block handling etc. Guess this can be done in ftl or so (I'm
not really an expert here).
Issue is that ftl seems quite complicated and seems to add quite some overhead.
(and pardon me if my understanding of ftl is completely off).

Anyway, a good layering would probably be:
filesystem
optional bad block handling layer
block driver

Frans
