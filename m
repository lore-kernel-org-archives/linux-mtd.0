Received: from mail-lb0-x236.google.com ([2a00:1450:4010:c04::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1an6Oz-0007IH-8P
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2016 15:26:54 +0000
Received: by mail-lb0-x236.google.com with SMTP id vo2so166947543lbb.1
 for <linux-mtd@lists.infradead.org>; Mon, 04 Apr 2016 08:26:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160404172048.6a76b472@bbrezillon>
References: <1459546164-6269-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1459546164-6269-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20160402155524.55e34fe4@bbrezillon>
 <20160404172048.6a76b472@bbrezillon>
Date: Mon, 4 Apr 2016 12:26:30 -0300
Message-ID: <CAAEAJfDr9ADhgQJ95hjyjSxAHsD=s9H20KAPML91Gntn9MAvwg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: Remove BUG() abuse in nand_scan_tail
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4 April 2016 at 12:20, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Sat, 2 Apr 2016 15:55:24 +0200
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
>
>> On Fri,  1 Apr 2016 18:29:24 -0300
>> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
>>
>> > There's no reason to BUG() when parameters are being
>> > validated. Drivers can get things wrong, and it's much nicer
>> > to just throw a noisy warn and fail gracefully, than calling
>> > BUG() and throwing the whole system down the drain.
>>
>> I'm fine with this change as long as all callers are checking
>> nand_scan_tail() return value.
>
> Actually, the s3c2410 driver is not checking nand_scan_tail() return
> value. Could you send a v2 addressing that?
>

Hmm, I don't see how that relates to this patch.
As far as I can see, it's two completely independent issues.

Or am I missing something here?
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
