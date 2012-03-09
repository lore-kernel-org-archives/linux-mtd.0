Received: from anubis.se.axis.com ([195.60.68.12])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S608e-0001Uc-5d
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 13:45:46 +0000
Date: Fri, 9 Mar 2012 14:45:34 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBI/ubifs problem
In-Reply-To: <1331300366.29445.31.camel@sauron.fi.intel.com>
Message-ID: <Pine.LNX.4.64.1203091444540.21132@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1202161543340.13194@lnxricardw.se.axis.com>
 <Pine.LNX.4.64.1202171107440.13194@lnxricardw.se.axis.com>
 <1331131250.32316.8.camel@sauron.fi.intel.com>
 <Pine.LNX.4.64.1203071723410.21132@lnxricardw.se.axis.com>
 <1331138261.3463.19.camel@sauron.fi.intel.com>
 <Pine.LNX.4.64.1203080606110.24516@lnxricardw.se.axis.com>
 <1331300366.29445.31.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 9 Mar 2012, Artem Bityutskiy wrote:

>> I think what I'm thinking about is that in the specialized case of ubifs
>> used for a read-only file system, such as a root file system (without
>> /etc, /var, and so on), it would be possible for mkfs.ubifs to create a
>> file system, and use as many LEBs as it needs for the actual data. On a
>> read-only file system there doesn't even have to be a journal, although =
I
>> don't know if that is possible.
>
> Well, I'd accept a patch which added a --optimize-for-ro option which
> would prepare a file-system with the smallest journal size.

Can the journal be eliminated completely or does something in ubifs=20
require there to be a journal at all times, albeit small?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
