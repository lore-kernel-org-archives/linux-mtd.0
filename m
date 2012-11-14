Received: from eu1sys200aog113.obsmtp.com ([207.126.144.135])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TYcvL-00019j-J4
 for linux-mtd@lists.infradead.org; Wed, 14 Nov 2012 13:22:36 +0000
Message-ID: <50A39B9B.7020808@st.com>
Date: Wed, 14 Nov 2012 13:24:43 +0000
From: Angus CLARK <angus.clark@st.com>
MIME-Version: 1.0
To: Gerlando Falauto <gerlando.falauto@keymile.com>
Subject: Re: state of support for "external ECC hardware"
References: <20121029204227.GA32300@harvey-pc.matrox.com><509B9143.4020506@keymile.com><20121108152125.GR2389@harvey-pc.matrox.com><509BDE9B.3080909@keymile.com><alpine.DEB.2.00.1211090938500.29771@lnxricardw.se.axis.com><50A12FBD.8020801@keymile.com><20121112173515.GA3041@parrot.com><50A13461.7070304@keymile.com>
 <20121112185231.GA6843@parrot.com> <50A36E92.7070204@keymile.com>
In-Reply-To: <50A36E92.7070204@keymile.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>, "Brunck,
 Holger" <Holger.Brunck@keymile.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Bigler,
 Stefan" <Stefan.Bigler@keymile.com>, Ivan Djelic <ivan.djelic@parrot.com>,
 Christopher Harvey <charvey@matrox.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Gerlando,

On 11/14/2012 10:12 AM, Gerlando Falauto wrote:
> Hi Ivan,
> 
> thanks once more.
> Speaking of compatibility, I was wondering: doesn't a NAND flash have
> *any* spare storage space at all, where software could store some
> information about the current OOB layout and/or ECC mechanism?
> Partition tables on hard drives for instance have a "partition type"
> byte which provides some hints about what to expect from the data within
> a partition.
> 
> This would be especially useful for *future* compatibility (i.e. old
> software reading a NAND "formatted" with unknown mechanism could simply
> stop working, or force read-only mode disabling ECC altogether).
> 
> Feasibility aside, would that make any sense?
> 

In general I am in favour of anything that facilitates the automatic probing of
devices.  However, I can see a number of complications in trying to implement
what you suggest.  Storing static information in a fixed location is never a
good idea on NAND.  A further issue relates to the very information you are
trying to store.  The data itself would need to be protected by ECC, but for it
to be useful, you need to be able to retrieve it without knowing what ECC/layout
was used when storing it.  Perhaps, for this ECC/layout data, one could use a
special dedicated S/W ECC scheme, strong enough for any device.  Yet another
layout of complexity though.

With regards to "spare storage", I would probably suggest the ECC/layout data be
added to the BBT area, assuming Flash-Resident BBTs are being used.

My only doubt would be whether there is sufficient motivation to overcome some
of the complexities and implement such a scheme...

Cheers,

Angus

> Thank you,
> Gerlando
> 
> On 11/12/2012 07:52 PM, Ivan Djelic wrote:
>> On Mon, Nov 12, 2012 at 05:39:45PM +0000, Gerlando Falauto wrote:
>>> Hi Ivan,
>>>
>>> wonderful, thanks a lot!
>>> If you also happen to have an opionion to using it for chips only
>>> needing 1-bit correction, I'd love to hear that...
>>
>> I would recommend using the strongest ECC your hardware can provide
>> without
>> hurting performance too much. This is what I do on my hardware (e.g.
>> 8-bit
>> correction on current 4-bit devices). I find it has 2 advantages:
>> - increased reliability
>> - seamless transition to newer devices with stronger ecc requirements
>> The latter is important, because changing ECC strength can be painful: it
>> means changing the OOB layout, impacting bootloader and kernel, thus
>> breaking
>> compatibility, etc.
>> HTH,
>> -- 
>> Ivan
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

-- 
-------------------------------------
Angus Clark
ST Microelectronics (R&D) Ltd.
1000 Aztec West, Bristol, BS32 4SQ
email: angus.clark@st.com
tel: +44 (0) 1454 462389
st-tina: 065 2389
-------------------------------------
