Received: from mail.ch.keymile.com ([193.17.201.103])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TYZxb-0002aV-1m
 for linux-mtd@lists.infradead.org; Wed, 14 Nov 2012 10:12:44 +0000
Message-ID: <50A36E92.7070204@keymile.com>
Date: Wed, 14 Nov 2012 11:12:34 +0100
From: Gerlando Falauto <gerlando.falauto@keymile.com>
MIME-Version: 1.0
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: state of support for "external ECC hardware"
References: <20121029204227.GA32300@harvey-pc.matrox.com><509B9143.4020506@keymile.com><20121108152125.GR2389@harvey-pc.matrox.com><509BDE9B.3080909@keymile.com><alpine.DEB.2.00.1211090938500.29771@lnxricardw.se.axis.com><50A12FBD.8020801@keymile.com><20121112173515.GA3041@parrot.com><50A13461.7070304@keymile.com>
 <20121112185231.GA6843@parrot.com>
In-Reply-To: <20121112185231.GA6843@parrot.com>
Content-Type: text/plain;
	charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Bigler, Stefan" <Stefan.Bigler@keymile.com>,
 Christopher Harvey <charvey@matrox.com>, "Brunck,
 Holger" <Holger.Brunck@keymile.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ivan,

thanks once more.
Speaking of compatibility, I was wondering: doesn't a NAND flash have 
*any* spare storage space at all, where software could store some 
information about the current OOB layout and/or ECC mechanism?
Partition tables on hard drives for instance have a "partition type" 
byte which provides some hints about what to expect from the data within 
a partition.

This would be especially useful for *future* compatibility (i.e. old 
software reading a NAND "formatted" with unknown mechanism could simply 
stop working, or force read-only mode disabling ECC altogether).

Feasibility aside, would that make any sense?

Thank you,
Gerlando

On 11/12/2012 07:52 PM, Ivan Djelic wrote:
> On Mon, Nov 12, 2012 at 05:39:45PM +0000, Gerlando Falauto wrote:
>> Hi Ivan,
>>
>> wonderful, thanks a lot!
>> If you also happen to have an opionion to using it for chips only
>> needing 1-bit correction, I'd love to hear that...
>
> I would recommend using the strongest ECC your hardware can provide without
> hurting performance too much. This is what I do on my hardware (e.g. 8-bit
> correction on current 4-bit devices). I find it has 2 advantages:
> - increased reliability
> - seamless transition to newer devices with stronger ecc requirements
> The latter is important, because changing ECC strength can be painful: it
> means changing the OOB layout, impacting bootloader and kernel, thus breaking
> compatibility, etc.
> HTH,
> --
> Ivan
