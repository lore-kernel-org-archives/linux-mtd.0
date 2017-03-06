Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ckxvJ-0006Ly-7l
 for linux-mtd@lists.infradead.org; Mon, 06 Mar 2017 19:04:00 +0000
Subject: Re: [PATCH 2/3] mtd: Add support for reading MTD devices via the
 nvmem API
To: Alban <albeu@free.fr>
References: <1488484223-844-1-git-send-email-albeu@free.fr>
 <1488484223-844-3-git-send-email-albeu@free.fr>
 <20170302221803.223ff23b@bbrezillon> <20170303133629.3aac2945@tock>
 <20170303143658.5d89a329@bbrezillon> <20170303145726.16cd67fd@tock>
 <20170303151107.36754d19@bbrezillon>
 <54c76650-b61f-8a4c-70c7-febe76e16d3b@nod.at>
 <20170306182147.65d59d33@avionic-0020>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Moritz Fischer <moritz.fischer@ettus.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <ad8f9469-2574-4fb5-2baa-37c6bca0dfa8@nod.at>
Date: Mon, 6 Mar 2017 20:03:28 +0100
MIME-Version: 1.0
In-Reply-To: <20170306182147.65d59d33@avionic-0020>
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

Am 06.03.2017 um 18:21 schrieb Alban:
> On Fri, 3 Mar 2017 23:21:29 +0100
> Richard Weinberger <richard@nod.at> wrote:
> 
>> Am 03.03.2017 um 15:11 schrieb Boris Brezillon:
>>>> And add a list of successfully added notifiers, along with their
>>>> data pointer, to the MTD device. That's simple and would also remove
>>>> the need for notifier to have a private list of their instances as I
>>>> had to do here.  
>>>
>>> And then you're abusing the notifier concept. As said earlier, a
>>> notifier is not necessarily using the device, and thus, don't
>>> necessarily need private data.
>>> It's not only about what is the simplest solution for your use case,
>>> but also what other users want/need.  
>>
>> Yes, please don't use the mtd_notifier.
>> I strongly vote to embed the nvmem pointer into struct mtd_info.
> 
> Ok, I'll do that. However it mean it will have to stays in
> drivers/mtd as it then become part of the MTD core.

Brian, are you fine with this?
I know, refcounting in MTD is tricky. :(

Thanks,
//richard
