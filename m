Received: from mail-pg0-x22b.google.com ([2607:f8b0:400e:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eQg4E-0007F0-W7
 for linux-mtd@lists.infradead.org; Sun, 17 Dec 2017 21:01:52 +0000
Received: by mail-pg0-x22b.google.com with SMTP id m25so8359999pgv.12
 for <linux-mtd@lists.infradead.org>; Sun, 17 Dec 2017 13:01:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171217190056.GA1107@1wt.eu>
References: <20171217120503.GA3323@1wt.eu>
 <CAAEAJfBUyhvi68A6QEJRywq9hxMBYuJ4m+O6ogBtV1nkeBR_og@mail.gmail.com>
 <20171217155305.16c5bb4f@bbrezillon> <20171217150043.GA1403@1wt.eu>
 <CAAEAJfD47bGTSppEqcRszjAgBUjiCevmdYLKfsQTPYMcVu8VDA@mail.gmail.com>
 <20171217162342.GA1833@1wt.eu> <20171217190746.2a61232c@bbrezillon>
 <20171217190056.GA1107@1wt.eu>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 17 Dec 2017 18:01:29 -0300
Message-ID: <CAAEAJfArtxcWgcjHAb__3BQxWEBgWU8uWtHGYETc-m9eUs91nA@mail.gmail.com>
Subject: Re: pxa3xx_nand times out in 4.14 with JFFS2
To: Willy Tarreau <w@1wt.eu>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17 December 2017 at 16:00, Willy Tarreau <w@1wt.eu> wrote:
> On Sun, Dec 17, 2017 at 07:07:46PM +0100, Boris Brezillon wrote:
>> > > This would guarantee that devices with factory bad blocks,
>> > > (and no BBT), would be OK with this patch.
>> >
>> > I see. I'm fine with trying provided I have reasonably good assurance
>> > that I won't have to go through the kwboot pain again :-/
>>
>> There's a easy test you can do without scrubing the NAND:
>> 1/ comment the nand-on-flash-bbt property in your DT (this will trigger
>>    a full scan)
>> 2/ from u-boot (before booting the kernel), erase a block that you know
>>    contains nothing important
>> 3/ during the kernel scan, make sure this block is not reported as bad
>
> OK so I tried and never faced any error. Thus I also attempted to mark
> a bad block in u-boot, it appeared in the bad blocks table, then I had
> to scrub the whole table to get rid of it. Each time when I booted I
> saw the message "Scanning device for bad blocks" but no error ever
> happened. So I hope it's OK.
>

Nice. Thanks a lot Willy. I think this acks Boris' patch.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
