Received: from anubis.se.axis.com ([195.60.68.11])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDV4s-0000ur-Sd
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 08:21:55 +0000
Date: Wed, 12 Feb 2014 09:21:31 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: Aw: Re: Linux MTD: Per Partition ECC
In-Reply-To: <20140212080724.GD3500@norris-Latitude-E6410>
Message-ID: <alpine.DEB.2.00.1402120921120.5908@lnxricardw.se.axis.com>
References: <trinity-5aec7168-325d-4995-9e70-e4d2ce4b4816-1392119925322@3capp-gmx-bs63>
 <52FA1B39.2070904@corscience.de>
 <trinity-39536070-43ab-4f9e-9b92-9852f5fd000b-1392133387225@3capp-gmx-bs63>
 <52FA4E64.8020200@gmail.com> <20140212073328.GA3500@norris-Latitude-E6410>
 <alpine.DEB.2.00.1402120845000.5908@lnxricardw.se.axis.com>
 <20140212080724.GD3500@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: "star@gmx.li" <star@gmx.li>,
 =?ISO-8859-15?Q?Ricard_Wanderl=F6f?= <ricardw@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Peter Barada <peter.barada@logicpd.com>, Peter Barada <peter.barada@gmail.com>,
 =?ISO-8859-15?Q?Andreas_Bie=DFmann?= <andreas.biessmann@corscience.de>,
 "biessmann@corscience.de" <biessmann@corscience.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 12 Feb 2014, Brian Norris wrote:

>> I don't know if it has changed lately, but I was just looking at how
>> nandwrite handles writes in RAW mode, and it appears that it does
>> two separate writes in this case, one for the OOB and one for the
>> main area.
>
> It has changed.
>
> http://git.infradead.org/mtd-utils.git/commitdiff/6a8889fbc0ea7a198628c9e3901fd88038e12d09

Ah, great. Thanks for pointing this out.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
