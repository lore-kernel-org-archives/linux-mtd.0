Received: from mail4.cadvision.com ([207.228.64.49])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16RbM8-0000qX-00
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2002 15:55:05 +0000
Received: from localhost (h-207-228-117-70.gen.cadvision.com [207.228.117.70])
	by mail4.cadvision.com (8.9.3/8.9.3/CWT/DCE) with SMTP id JAA10219
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2002 09:06:04 -0700
Message-ID: <003901c1a03a$8db548e0$0100007f@localdomain.wni.com.wirelessnetworksinc.com>
From: "Herman Oosthuysen" <Herman@WirelessNetworksInc.com>
To: <linux-mtd@lists.infradead.org>
References: <Pine.LNX.4.33.0201170137210.18875-100000@chaingun.noernet.de> <002101c19f99$874d7e60$0100007f@localdomain.wni.com.wirelessnetworksinc.com> <3C474523.60E74892@daniel.com>
Subject: Re: experience with max block erase
Date: Fri, 18 Jan 2002 09:09:48 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Well, if you have to write data to flash continuously, then you are using
the wrong media.  Flash is designed for stuff that doesn't have to change
often.

Anyhoo, getting a million or more cycles from flash is not unrealistic, but
then you probably would get some failures in some products and the erase
cycle time would get unacceptably slow eventually.

The important thing to understand is that a flash disk drive isn't one...

BTW, I like your writeups Vipin - it is well presented.
--
Herman Oosthuysen
Herman@WirelessNetworksInc.com
Suite 300, #3016, 5th Ave NE,
Calgary, Alberta, T2A 6K4, Canada
Phone: (403) 569-5688, Fax: (403) 235-3965
----- Original Message -----
From: Vipin Malik <vipin.malik@daniel.com>
To: Herman Oosthuysen <Herman@WirelessNetworksInc.com>
Cc: dennis noermann <dennis.noermann@noernet.de>;
<linux-mtd@lists.infradead.org>
Sent: Thursday, January 17, 2002 2:41 PM
Subject: Re: experience with max block erase


> Herman Oosthuysen wrote:
>
> > 100 000 cycles is lot.  You have to erase the chip about ten times per
hour
> > continuously for 100 years to reach that number...
>
> Let's state 100K cycles another way:
>
> for a 8mbit chip (1024KB)
>
> It's only 100K * 1024KB of data life (assuming a circular use- which is
the
> best case and what you will get with wear leveling).
>
> If you want your product to last 8 years (pick a number), then the max
data
> rate that you can send to the flash chip is "only":
> 100000 * 1024/(8*365*24*60*60) = 0.4KB/sec!
>
> That's not a lot. This does not even take into account the extra data
generated
> due to the overhead of any filesystem one may be using. Tack in another
20% for
> that (not unusual for JFFS2 system- it depends on write sizes- this
assumes a
> small write size/write) then the data rate falls to 0.32KB/sec
>
> OR let's say that the system is generating data (that needs to be saved to
> flash) at the rate of 10KB/sec (not very high number too), then the life
of the
> system is only 0.32years! (Yikes!)
>
> Vipin
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
