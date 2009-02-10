Received: from mail.mystique-magazine.com ([205.238.173.42])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LWk1Z-00080J-3h
	for linux-mtd@lists.infradead.org; Tue, 10 Feb 2009 04:15:07 +0000
Message-ID: <4990FF85.70709@infinity-studios.com>
Date: Mon, 09 Feb 2009 22:16:05 -0600
From: Dzuy Nguyen <dzuy@infinity-studios.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: jffs2: Too few erase blocks (1)
References: <498FC4BB.7060903@infinity-studios.com>	<Pine.LNX.4.64.0902090947080.19761@lnxricardw.se.axis.com>	<49904E48.7000805@infinity-studios.com>
	<Pine.LNX.4.64.0902091731030.22663@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0902091731030.22663@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I think I'll just use ext2.  ext2 doesn't mind small partition.  Writing
to it
should work the same as dd.

Ricard Wanderlof wrote:
> On Mon, 9 Feb 2009, Dzuy Nguyen wrote:
>
>   
>> Thanks, Ricard.  I didn't realize that jffs2 is not suitable for a small
>> partition.  Yes,
>> 64K is all I can afford.  I suppose I can dd the file, but doesn't that
>> provide no wear
>> leveling feature that jffs2 does?
>>     
>
> No. But with one eraseblock you can't get much wear levelling anyway.
>
> It might not be too difficult to write an application that appends 
> new data to existing data to the partition, erasing the whole block when 
> it fills up and write the latest. Then you need something that will search 
> for the latest version of the file. Something that jffs2 does, but on a 
> smaller scale, acceptable for your application.
>
> /Ricard
> --
> Ricard Wolf Wanderlöf                           ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden            www.axis.com
> Phone +46 46 272 2016                           Fax +46 46 13 61 30
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>   
