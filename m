Received: from anubis.se.axis.com ([195.60.68.12])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TWnQm-0008Tq-6o
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2012 12:11:31 +0000
Date: Fri, 9 Nov 2012 13:11:24 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Tech tech <tttechmail@gmail.com>
Subject: Re: Frequent Writes to NAND flash with UBIFS in sychronous mode
In-Reply-To: <CAHT8gTMP3NdsxSSe4OXHEU0FZcR9tMj3OG31w0TUMeRY4vZqEQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.00.1211091308520.29771@lnxricardw.se.axis.com>
References: <loom.20121108T103932-198@post.gmane.org>
 <alpine.DEB.2.00.1211091006110.29771@lnxricardw.se.axis.com>
 <CAHT8gTMcFtwJ2qkW0rhzWVKeS0R3AjLVp27H4WhVVcbJf1ZBTQ@mail.gmail.com>
 <alpine.DEB.2.00.1211091138290.29771@lnxricardw.se.axis.com>
 <CAHT8gTMP3NdsxSSe4OXHEU0FZcR9tMj3OG31w0TUMeRY4vZqEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: =?ISO-8859-15?Q?Ricard_Wanderl=F6f?= <ricardw@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 9 Nov 2012, Tech tech wrote:

> Ok. Got it. W.r.t erroneous identification of bit flips within 
> hardware/software, we verified that the ECC algorithm doesn't report bit 
> flips before writes. Though there were a few ECC errors reported by 
> hardware, that could be corrected the the ECC correction algorithm. Is 
> this what you meant?   -Joe    

What I meant was that UBI upon detecting that ECC corrections have been 
applied will schedule the relevant blocks for rewrite, to avoid further 
bit flips causing the data to become unreadable. Such detection is 
performed when reading, hence reading data where bit flips have been 
detected (even if they have been corrected by the ECC algorithm) can 
result in writes, even if they don't necessarily occur immediately after 
the read which scheduled them.

How many are 'a few ECC errors', and over how long a time from where the 
detected?

/Ricard

> On Fri, Nov 9, 2012 at 4:12 PM, Ricard Wanderlof <ricard.wanderlof@axis.com>
> wrote:
>
>       On Fri, 9 Nov 2012, Tech tech wrote:
>
>             Hi Ricard,
>              Thanks for the reply. Yes. This observation is only
>             with synchronous mode.
>             Without '-sync' option, writes doesn't happen with
>             reads.
>             Can you explain a little more on the "cached writes"
>             that you mentioned?
> 
> 
> Sorry, thinking about it, that would be valid for the case without '-o
> sync' where write operations do not happen right away but are
> buffered. But in the synchronous case writes should be performed more
> or less immediately.
>
>       I will try to check the UBI scrub part & will update.
> 
> 
> I was thinking along the lines of misconfigured hardware or software
> believing that there were bit flips in the data and it needed to be
> rewritten for that reason.
> 
> /Ricard
> --
> Ricard Wolf Wanderlöf                           ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden            www.axis.com
> Phone +46 46 272 2016                           Fax +46 46 13 61 30
> 
> 
> 
>

-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
