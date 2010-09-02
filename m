Received: from mail-qy0-f170.google.com ([209.85.216.170])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OrIrT-0007MT-N6
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 23:06:31 +0000
Received: by qyk35 with SMTP id 35so2821005qyk.15
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Sep 2010 16:06:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1283427948.3085.19.camel@brekeke>
References: <AANLkTimuZZ-B1sO1jHAu_gjwa8Gb_WXKowORNvWHMmcT@mail.gmail.com>
	<1283427948.3085.19.camel@brekeke>
Date: Thu, 2 Sep 2010 16:06:26 -0700
Message-ID: <AANLkTi=JQDmBoy7LjSop1hT+cO=Cynbedsk2iGOvOh1D@mail.gmail.com>
Subject: Re: UBIFS in-place vs out-of-place GC
From: Russ Dill <russ.dill@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 2, 2010 at 4:45 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> Hi,
>
> On Wed, 2010-09-01 at 09:08 -0700, Russ Dill wrote:
>> I'm doing a bit of research on UBIFS and something I read from a few
>> sources has me confused regarding garbage collection:
>>
>> http://osl.sed.hu/~havasi/ubifs/#gc
>
> You should contact Szeged guys and ask them to remove obsolete
> information.
>
> For much more up-to-date information, see
> http://linux-mtd.infradead.org/doc/ubifs.html#L_documentation
>
>> Looking at the source, I can find the code that does the out of place
>> updates, but I can't find any references to in place updates or
>> displacement tables. What gives?
>
> We do not have displacement tables, that was some old idea which we
> never implemented.
>
> We do not have in-place GC in UBIFS. But we have so-called "in-the-gaps"
> method which we use during commit to write the FS index when we do not
> have extra empty LEBs. In the code it corresponds to the
> 'layout_in_gaps()' function.
>

Thanks much, I figured it was outdated information, I just wanted to
confirm that suspicion.
