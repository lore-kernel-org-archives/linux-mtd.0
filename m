Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SWlZo-0003dg-7L
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 09:40:24 +0000
Date: Tue, 22 May 2012 11:40:20 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Robert Homann <homann@bury.com>
Subject: Re: Resizing of an existing UBIFS
In-Reply-To: <4FBB5B82.8070009@bury.com>
Message-ID: <Pine.LNX.4.64.1205221138410.4247@lnxricardw.se.axis.com>
References: <4FBB3506.3020904@bury.com>
 <1337669583.2483.88.camel@sauron.fi.intel.com>
 <4FBB3E7F.3080807@bury.com> <1337674258.2483.123.camel@sauron.fi.intel.com>
 <4FBB5B82.8070009@bury.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 22 May 2012, Robert Homann wrote:

> On 05/22/2012 10:10 AM, Artem Bityutskiy wrote:
>
>> amend the indexing information. This is not a simple task, but doable.
>
> Thank you a lot for the quick answers! Looks like I need to learn a lot=
=20
> of details about UBIFS, should I really decide to make such a tool. I'll=
=20
> think it through again... :)

It would also be nice if such a tool could reduce the size of a UBIFS=20
volume (given that there is enough free space to do so). That could be=20
useful if the contents of a flash at a given point needed to be compacted=
=20
for make room for an additional volume for instance.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
