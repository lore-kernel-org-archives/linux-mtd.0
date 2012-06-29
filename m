Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SkVSM-0006DS-Fh
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 07:17:31 +0000
Received: by bkwj4 with SMTP id j4so2925070bkw.36
 for <linux-mtd@lists.infradead.org>; Fri, 29 Jun 2012 00:17:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1340900549.3070.130.camel@sauron.fi.intel.com>
References: <1340636918-7505-1-git-send-email-richard.genoud@gmail.com>
 <1340894351.3070.121.camel@sauron.fi.intel.com>
 <CACQ1gAjLdR-ZRUS6gxMrJzVpRdvdMK2JRceyiFmeSq-FQkZbZg@mail.gmail.com>
 <1340900549.3070.130.camel@sauron.fi.intel.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 29 Jun 2012 09:17:11 +0200
Message-ID: <CACQ1gAgGbYvTO=_vVW11Ru9OXpra7oiJinbpX=DBiOHmoUtA8g@mail.gmail.com>
Subject: Re: [PATCH] UBI: add minimal amount of reserved erase blocks in
 Kconfig
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/6/28 Artem Bityutskiy <dedekind1@gmail.com>:
> On Thu, 2012-06-28 at 18:07 +0200, Richard Genoud wrote:
>> Agreed, it seems that 2% of the whole flash (at least for SLC device)
>> is more realistic.
>
> Agree, feel free to send a separate patch for this.
Done !
>
>> > Frankly, I do not understand this logic :-) And your patch looks wrong -
>> > it touches the "auto-format" code which you may consider more like a
>> > "debugging" feature and should not rely on this in production.
>> Sorry, but I don't understand what you mean by the "auto-format" code.
>
> Yeah, right, this comment was incorrect, sorry.
>

I was thinking that instead of giving to ubiattach the MBB, we could
give it the MBB percentage (maximum bad blocks percentage of the whole
flash device).
>From this % and the whole flash size, we get the MBB number, and set
beb_rsvd_level for each MTD part.
It will be easier for userspace, as we won't have to set a different
value for different flash size. The default 2% value will (almost)
always be correct.
We can even get rid of the CONFIG_MTD_UBI_BEB_RESERVE option.

BTW, the real killer feature would be that the flash gives its NVB or
MBB value in response to the READ_ID command, but unfortunately that's
not the case...
