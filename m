Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzrVU-0004x9-Dq
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 19:38:33 +0000
Received: by wmdw130 with SMTP id w130so32006655wmd.0
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 11:37:43 -0800 (PST)
Subject: Re: RfC: Handle SPI controller limitations like maximum message length
To: Mark Brown <broonie@kernel.org>
References: <564CEB61.2000601@gmail.com> <20151120000226.GP64635@google.com>
 <564EC4E0.90602@gmail.com>
 <CAFSsGVsJBi6yPin7X9MCS8LD6nygjynfgDgFicjojkm0rOJSJw@mail.gmail.com>
 <20151120123540.GC1929@sirena.org.uk> <564F6D99.8090203@gmail.com>
 <20151120191842.GE1929@sirena.org.uk>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Michal Suchanek <hramrach@gmail.com>, martin@sperl.org
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <564F7673.40205@gmail.com>
Date: Fri, 20 Nov 2015 20:37:23 +0100
MIME-Version: 1.0
In-Reply-To: <20151120191842.GE1929@sirena.org.uk>
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

Am 20.11.2015 um 20:18 schrieb Mark Brown:
> On Fri, Nov 20, 2015 at 07:59:37PM +0100, Heiner Kallweit wrote:
> 
>> OK, I interpret this as:
>> Controller drivers shall return 0 only if the complete message was
>> transferred successfully.
> 
> Yes.
> 
>> If  a controller driver returns an error it has the option to set
>> actual_length to what was transferred successfully.
> 
> It should always do this.
> 
>> This means we can't use patch 4 from Michal because it bails out as soon
>> as the underlying SPI transfer returns an error.
> 
> I haven't seen that patch.
> 
Sorry, this was addressed to Brian. It's about a mtd spi-nor patch.
http://lists.infradead.org/pipermail/linux-mtd/2015-August/061062.html
Most likely neither you nor linux-spi was on cc.
(Oh, it was patch 7 of the series, not 4.)
