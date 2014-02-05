Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WAxrX-000337-Db
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2014 08:29:40 +0000
Message-ID: <52F1F658.9080701@nod.at>
Date: Wed, 05 Feb 2014 09:29:12 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: "Wiedemer, Thorsten (Lawo AG)" <Thorsten.Wiedemer@lawo.com>
Subject: Re: UBI leb_write_unlock NULL pointer Oops (continuation)
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
 <CAFLxGvya5WXoKcYmOgeM_SmVVEht1jEzeLG9vHhwFudFU+Ny8A@mail.gmail.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>
 <52EF772D.8080207@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>,
 <52EF9FFE.4020405@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18A7474A@Exchange1.lawo.de>
In-Reply-To: <D7B1B5F4F3F27A4CB073BF422331203F2A18A7474A@Exchange1.lawo.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Bill Pringlemeir <bpringlemeir@nbsps.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 04.02.2014 18:01, schrieb Wiedemer, Thorsten (Lawo AG):
> Hi,
> 
> I made a "hardcore test" with:
> $ while [ 1 ]; do cp <file_of_8kByte_size> tmp/<file_of_8kByte_size.1>; sync; done &
> $ while [ 1 ]; do cp <file_of_8kByte_size> tmp/<file_of_8kByte_size.2>; sync; done &
> $ while [ 1 ]; do cp <file_of_8kByte_size> tmp/<file_of_8kByte_size.3>; sync; done &
> 
> It took about 2-3 hours until I had an error (two times):

This test ran the over night without any error on my imx51 board. :-\

Bill's great analysis showed that it may be a linked list corruption in rw_semaphore.
Thorsten, can you please enable CONFIG_DEBUG_LIST?
Also try whether you can trigger the issue with lock debugging enabled.

Thanks,
//richard
