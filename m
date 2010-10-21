Received: from www.tglx.de ([62.245.132.106])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P8qQd-0000h8-7y
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2010 08:23:16 +0000
Message-ID: <4CBFF865.9010706@linutronix.de>
Date: Thu, 21 Oct 2010 10:23:01 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: ubifs: sync() causes writes even if nothing is changed
References: <20101013163005.GB1889@silverbox.local>
	<1287581218.9272.67.camel@localhost>
In-Reply-To: <1287581218.9272.67.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Hans J. Koch" <hjk@linutronix.de>, linux-mtd@lists.infradead.org,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
>> From a quick glance at the ubifs code, this might come out of the
>> garbage collector that is triggered on every sync() and writes
>> something even if nothing has changed.
>>
>> Is that really needed?
> 
> I briefly looked, and UBIFS is doing a lot of I/O in that case, which is
> unnecessary and should not be done, I'll need to investigate this.

 From what I've seen from the code there are two parts:
- writing "unwritten" data (the write back part I guess). Nothing is done
   here as long as no data is queued
- writing the journal. The first step seems to be to write a node "begin
   write" and the last one is "end write".

Since hjk sees only two erases I would guess that they are initiated by 
the "journal begin" & "end" requests.

Thanks for looking at this.

Sebastian
