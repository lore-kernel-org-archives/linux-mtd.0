Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmeiy-0002yc-4a
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 10:25:57 +0000
Subject: Re: Micron qspi nor flash and UBIFS
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Andras Szemzo <szemzo.andras@gmail.com>
References: <EB1698FB-FF63-4FC1-A706-A81DB9E655DD@gmail.com>
 <CAFLxGvzmRPaNFqzYubCo2_mB9W4inja_J9YM7rUay_9TpJBmCA@mail.gmail.com>
 <CB87F86A-3E14-4091-B669-6C325085F397@gmail.com>
 <3806eb18-1939-567d-6006-ae02ecbf14a4@nod.at>
 <7a29bdfc-3722-2869-54fc-6cf79c2e1af5@atmel.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 hramrach@gmail.com, computersforpeace@gmail.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <fef5d249-de76-6c38-a317-6adaac58fec3@nod.at>
Date: Wed, 21 Sep 2016 12:24:39 +0200
MIME-Version: 1.0
In-Reply-To: <7a29bdfc-3722-2869-54fc-6cf79c2e1af5@atmel.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Cyrille,

On 21.09.2016 11:51, Cyrille Pitchen wrote:
> So I think we should keep Michal's patch but only remove the WARN_ONCE() as
> it seems to be the only regression reported.
> 
> Richard, Andras, would it be ok for you?

Perfectly fine by me. :-)
Thanks for looking.

Thanks,
//richard
