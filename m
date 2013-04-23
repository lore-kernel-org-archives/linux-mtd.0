Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUV5f-0007Nq-DS
 for linux-mtd@lists.infradead.org; Tue, 23 Apr 2013 04:44:28 +0000
Date: Tue, 23 Apr 2013 06:44:15 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 17/18] fs: Fix copyright symbol in printk()
In-Reply-To: <201304230002.55533.marex@denx.de>
Message-ID: <alpine.DEB.2.00.1304230641270.4128@lnxricardw.se.axis.com>
References: <1366665870-8998-1-git-send-email-marex@denx.de>
 <1366667786.7319.17.camel@shinybook.infradead.org>
 <201304230002.55533.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 23 Apr 2013, Marek Vasut wrote:

>>> printk() as the later produces the following output on dmesg
>>>
>>> instead of the expected one:
>>>   jffs2: version 2.2. (NAND) \xffffffc2\xffffffa9 2001-2006 Red Hat, Inc.
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> Cc: David Woodhouse <dwmw2@infradead.org>
>>
>> You appear to have discovered a problem with printk. Let's *fix* it
>> rather than regressing to the 20th century to work around it though?
>
> Should printk() even be capable of printing UTF8 stuff like that? How should I
> go about this?

A lot of debugging in embedded systems happens over serial lines. While it 
might be nice to be able to print symbols like the copyright, I would 
think it has little value compared to the practicality of being able to 
connect whatever serial terminal or terminal emulator is available without 
getting odd character sequences.

What I'm trying to say is that it's not just printk that's at fault, it's 
worth considering the environment which printk is used in.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
