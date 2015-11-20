Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzrcE-00031e-Je
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 19:45:03 +0000
Received: by wmdw130 with SMTP id w130so32193094wmd.0
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 11:44:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151120192157.GF1929@sirena.org.uk>
References: <564CEB61.2000601@gmail.com> <20151120000226.GP64635@google.com>
 <564EC4E0.90602@gmail.com>
 <CAFSsGVsJBi6yPin7X9MCS8LD6nygjynfgDgFicjojkm0rOJSJw@mail.gmail.com>
 <20151120123540.GC1929@sirena.org.uk> <564F6D99.8090203@gmail.com>
 <CAOMqctTt=78C4m2jjMb9mRBOkoZ5uZ4neVm0NS39iNO8otn=dA@mail.gmail.com>
 <20151120192157.GF1929@sirena.org.uk>
From: Michal Suchanek <hramrach@gmail.com>
Date: Fri, 20 Nov 2015 20:44:01 +0100
Message-ID: <CAOMqctSCMO93BWD0HOAmKniZLmZkXvXG5hbUQ3kD9PrxNzKw+w@mail.gmail.com>
Subject: Re: RfC: Handle SPI controller limitations like maximum message length
To: Mark Brown <broonie@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Martin Sperl <martin@sperl.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 20 November 2015 at 20:21, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Nov 20, 2015 at 08:05:48PM +0100, Michal Suchanek wrote:
>
>> I don't think ignoring errors in general is good idea.
>
>> If it's desirable that a partial transfer is reported as error then a
>> particular error value should be defined for this case and drivers
>> that can continue the transfer in a driver-specific way (such as
>> spi-nor) can check for this error and handle it appropriately and pass
>> through any other error.
>
> Fundamentally callers just shouldn't be trying to do excessively large
> transfers in the first place, this is why we want capability reporting.
> *Any* error code could indicate a truncation, we may have truncated due
> to some length limitation but it could also be that there was some
> hardware problem that occurred mid transfer or something similar.

Indeed, and in the case the SPI master driver truncated the message
due to known limitation before it even attempted a transfer it can
assure with as much certainty as is possible with SPI bus that this
much data was transferred, no more and no less. In contrast, a DMA
failure that is detected after the fact can leave the hardware in
unknown state. So I see a difference here.

And yes, for some driver protocols transferring less data than was
initially requested is not acceptable. For example, if you transferred
Ethernet frames to an Ethernet controller the frames must be
transferred fully.

Thanks

Michal
