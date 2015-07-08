Received: from 220.77.144.195.ipv4.evonet.be ([195.144.77.220]
 helo=exchange.essensium.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCrH9-00065Z-9P
 for linux-mtd@lists.infradead.org; Wed, 08 Jul 2015 15:28:44 +0000
Subject: Re: UBIFS: Possible on-flash metadata corruption
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <559A8A83.3050508@essensium.com>
 <CAFLxGvwMKmzR26eoy_QYj+asQZrnvSZqXfE3-sBXcenEQS3GuA@mail.gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Philip
 Oberstaller <Philip.Oberstaller@septentrio.com>
From: Arnout Vandecappelle <arnout.vandecappelle@essensium.com>
Message-ID: <559D4181.2060805@essensium.com>
Date: Wed, 8 Jul 2015 17:28:01 +0200
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwMKmzR26eoy_QYj+asQZrnvSZqXfE3-sBXcenEQS3GuA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 Hi Richard,

On 07/06/15 21:49, Richard Weinberger wrote:
> Hi Philip, hi Arnout,
> 
> On Mon, Jul 6, 2015 at 4:02 PM, Arnout Vandecappelle
> <arnout.vandecappelle@essensium.com> wrote:
[snip]
>> The PEB related to LEB 23 contains all data nodes. AFAIK, UBIFS separates
>> data nodes and other nodes on two different jheads, effectively putting them on
>> separate PEBs? So, it would be weird why it would even look for a direntry node
>> on LEB 23.
> 
> Yeah.
> Does LEB 23 contain only valid nodes or is something broken or odd too?

 It looks like it only contains valid data nodes, corresponding to the data that
is frequently updated. At least the node type looks OK, but that's just from
looking at the hexdump so not a very exhaustive check.

[snip]
>> I have not been able to locate the node that refers to LEB 23:120832 - it would
>> seem that that is the one that is corrupt. Is there any tool or debug trace that
>> will help me find the referring node?
>>
>> Is there any way that would allow me to automatically recover from such an
>> issue if it occurs again?
> 
> First we have to figure out what exactly is broken. It looks like a
> wrong LEB->PEB mapping.

 We thought of that as well. However, the UBI partition contains 1800 PEBs, of
which about 1000 are in use and only 34 are used by this particular ubifs
volume. So it seems to me that it would be quite unlikely that a bad LEB->PEB
mapping would happen to point to the right volume.

> Can you please share the image?

 Unfortunately, no. It took me so long to reply because I had to find out if
this was possible or not.

 We could extract the PEB headers from the image, and the internal volume, and
that could be shared. We could also erase everything in the other volumes. But
all that takes time which we don't really have at the moment :-(


 So no progress at the moment. We'll do some more debugging next week and report
the results.


 Regards,
 Arnout


-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
