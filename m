Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UbnXc-0006iV-Q2
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 07:51:29 +0000
Date: Mon, 13 May 2013 09:50:56 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBI, udev and systemd
In-Reply-To: <1368196362.26780.170.camel@sauron.fi.intel.com>
Message-ID: <alpine.DEB.2.00.1305130932340.22700@lnxricardw.se.axis.com>
References: <alpine.DEB.2.00.1304081509460.10377@lnxricardw.se.axis.com>
 <1368196362.26780.170.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 10 May 2013, Artem Bityutskiy wrote:

> On Mon, 2013-04-08 at 15:17 +0200, Ricard Wanderlof wrote:
>> I know this might be a more systemd-related issue, however, it seems
>> that
>> there might be something about the way UBI reports device state
>> changes to
>> udev etc, or that just someone using UBI and systemd on their system
>> has
>> had a similar problem and solved it.
>
> I do not think UBI is doing anything special, it uses standard Linux
> infrastructure API for creating the devices, and deleting them.

I never followed this up on the list because there were no other responses 
so I figured there was no other interest.

You are right, there's nothing special about UBI, except that for udev it 
comes up as its own subsystem type "ubi". There are lots of default rules 
for disk devices which place them under systemd control, but nothing for 
UBI, at least not in the build I was working on. Adding the line

SUBSYSTEM=="ubi", GROUP="disk", TAG+="systemd"

to the appropriate rules file allowed systemd to receive UBI subsystem 
updates, and all was well.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
