Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3q7k-0000x9-3b
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 18:58:01 +0000
Received: by wmvv187 with SMTP id v187so221639353wmv.1
 for <linux-mtd@lists.infradead.org>; Tue, 01 Dec 2015 10:57:38 -0800 (PST)
Subject: Re: [PATCH resubmit 2/2] spi: fsl-espi: make use of max_msg_size in
 spi_master to handle HW restrictions
To: Mark Brown <broonie@kernel.org>
References: <20151119114057.GN31303@sirena.org.uk>
 <F224F5F3-FAD5-47FE-9419-39E53BCBB8C6@sperl.org>
 <20151119171538.GO31303@sirena.org.uk>
 <9CDADBED-FD18-4635-82A9-5AB14C9ABCAE@sperl.org>
 <20151120120502.GT31303@sirena.org.uk>
 <08871ECD-52DF-4CBF-AF3D-4C3A442C008A@sperl.org>
 <20151121134946.GI26072@sirena.org.uk> <56507B3B.4080608@gmail.com>
 <CAOMqctR=UDEPbgJDY3YvxpbVEEp4t6ajkyv=cVAZp2fLBNBanA@mail.gmail.com>
 <565CB0C0.9060104@gmail.com> <20151201141923.GJ1929@sirena.org.uk>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Michal Suchanek <hramrach@gmail.com>, Martin Sperl <martin@sperl.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <565DECC4.2030507@gmail.com>
Date: Tue, 1 Dec 2015 19:53:56 +0100
MIME-Version: 1.0
In-Reply-To: <20151201141923.GJ1929@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 01.12.2015 um 15:19 schrieb Mark Brown:
> On Mon, Nov 30, 2015 at 09:25:36PM +0100, Heiner Kallweit wrote:
>> Propagate the 64K message size limitation allowing client drivers
>> to deal properly with this limitation.
> 
> Please don't submit patches into the middle of existing threads, it
> makes it very confusing trying to work out what the currently proposed
> patches are:
> 
>    8592 N T 11/22 Heiner Kallweit (2.1K) │                   │ ├─>[PATCH 2/3] mt
>    8593 N C 11/22 Michal Suchanek (0.5K) │                   │ │ └─>
> -> 8594 N T 11/22 Heiner Kallweit (0.9K) │                   │ ├─>[PATCH 3/3] sp
>    8595 N T 11/30 Heiner Kallweit (1.7K) │                   │ ├─>[PATCH v2 1/2]
>    8596 N T 11/30 Heiner Kallweit (0.9K) │                   │ └─>[PATCH resubmi
>    8597 NsF 11/22 To Heiner Kallw (1.4K) │                   └─>Re: RfC: Handle
> 
> I *think* the two messages from yesterday are supposed to be a single
> patch series but they're buried in the middle of a huge thread at the
> same level as some older patches and for soem reason have different tags
> (one of which is "resubmit" which is really just adding noise).
> 
Sorry, my mail template referred to the discussion thread.
I'll resubmit.
