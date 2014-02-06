Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WBRUm-0003a6-9J
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2014 16:08:09 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: "Wiedemer, Thorsten (Lawo AG)" <Thorsten.Wiedemer@lawo.com>
Subject: Re: AW: UBI leb_write_unlock NULL pointer Oops (continuation)
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
 <CAFLxGvya5WXoKcYmOgeM_SmVVEht1jEzeLG9vHhwFudFU+Ny8A@mail.gmail.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>
 <52EF772D.8080207@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>
 <52EF9FFE.4020405@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18A7474A@Exchange1.lawo.de>
 <52F1F658.9080701@nod.at> <87vbwt1bex.fsf@nbsps.com>
 <52F2B78A.1050802@nod.at> <87r47h19o0.fsf@nbsps.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18A74752@Exchange1.lawo.de>
Date: Thu, 06 Feb 2014 11:00:36 -0500
In-Reply-To: <D7B1B5F4F3F27A4CB073BF422331203F2A18A74752@Exchange1.lawo.de>
 (Thorsten Wiedemer's message of "Thu, 6 Feb 2014 14:05:40 +0100")
Message-ID: <87mwi41ba3.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On  5 Feb 2014, richard@nod.at wrote:

>> I think the issue is not related to fastmap because we have reports
>> for kernels older than 3.7.  Fastmap got merged in 3.7.

> ________________________________________
> Von: Bill Pringlemeir [bpringlemeir@nbsps.com]
> Gesendet: Mittwoch, 5. Februar 2014 23:23

> Yes, of course.  I meant fastmap may prevent the issue from happening.
> So, I wondered about Thorsten's configuration.

On  6 Feb 2014, Thorsten.Wiedemer@lawo.com wrote:

> we run on a 3.6.11 kernel, so no fastmap.
>
> grep -E 'MTD|UBI' .config | grep -v '^#'   gives

mxc_nand has 52689931 interrupts and several bit flips and I didn't have
a crash over night.  I think that 'kmemleak' and/or fast map changes the
behaviour (or maybe some other option).  I will retry with options
closer to yours.

Fwiw,
Bill Pringlemeir.
