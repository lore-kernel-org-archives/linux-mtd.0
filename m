Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Ttz7L-0006gh-Gj
 for linux-mtd@lists.infradead.org; Sat, 12 Jan 2013 11:19:18 +0000
Date: Sat, 12 Jan 2013 12:19:09 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Daniel Tang <dt.tangr@gmail.com>
Subject: Re: Implementing NAND driver on a PrimeCell SMC PL350 series
In-Reply-To: <6EBAA2A8-BB5B-47E8-9E89-4A4F2A5870BD@gmail.com>
Message-ID: <alpine.DEB.2.00.1301121214110.30304@lnxricardw.se.axis.com>
References: <D9B11571-8012-4206-B903-A4C59B85F318@gmail.com>
 <alpine.DEB.2.00.1301111155250.13078@lnxricardw.se.axis.com>
 <6EBAA2A8-BB5B-47E8-9E89-4A4F2A5870BD@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sat, 12 Jan 2013, Daniel Tang wrote:

> I didn't know high level functions could be overridden. Most of the 
> drivers I looked through didn't override the 'nand_command' function for 
> example, so I wasn't aware it was possible.

A long time ago, the functions in nand_base.c were marked with things like 
"REPLACABLE" or somesuch to show that they could be replaced with 
user-defined functions.

I guess you have to read through things like nand_scan_defaults() e.g.

         /* check, if a user supplied command function given */
         if (chip->cmdfunc == NULL)
                chip->cmdfunc = nand_command;

etc to get an idea of what to replace.

Of course, if the existing driver framwork is not flexible enough for 
your needs, patches are always welcome.

> As per your advice, I also read through some of the other NAND drivers. 
> Although they didn't have anything similar to what I need, I have a good 
> idea of where to head.

Ok, good!

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
