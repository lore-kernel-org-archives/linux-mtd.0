Received: from mail-vc0-f172.google.com ([209.85.220.172])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUY03-0001eL-Qa
 for linux-mtd@lists.infradead.org; Tue, 23 Apr 2013 07:50:53 +0000
Received: by mail-vc0-f172.google.com with SMTP id hx10so309995vcb.31
 for <linux-mtd@lists.infradead.org>; Tue, 23 Apr 2013 00:50:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1304230641270.4128@lnxricardw.se.axis.com>
References: <1366665870-8998-1-git-send-email-marex@denx.de>
 <1366667786.7319.17.camel@shinybook.infradead.org>
 <201304230002.55533.marex@denx.de>
 <alpine.DEB.2.00.1304230641270.4128@lnxricardw.se.axis.com>
Date: Tue, 23 Apr 2013 00:50:46 -0700
Message-ID: <CAN8TOE9fo4+dWnMp493Yz2PieM2uMDK8df1gGbVGZ0m6eG31Eg@mail.gmail.com>
Subject: Re: [PATCH 17/18] fs: Fix copyright symbol in printk()
From: Brian Norris <computersforpeace@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Marek Vasut <marex@denx.de>, David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 22, 2013 at 9:44 PM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
> On Tue, 23 Apr 2013, Marek Vasut wrote:
>>>> printk() as the later produces the following output on dmesg
>>>>
>>>> instead of the expected one:
>>>>   jffs2: version 2.2. (NAND) \xffffffc2\xffffffa9 2001-2006 Red Hat,
>>>> Inc.
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> Cc: David Woodhouse <dwmw2@infradead.org>
>>>
>>>
>>> You appear to have discovered a problem with printk. Let's *fix* it
>>> rather than regressing to the 20th century to work around it though?
>>
>>
>> Should printk() even be capable of printing UTF8 stuff like that? How
>> should I
>> go about this?
>
>
> A lot of debugging in embedded systems happens over serial lines. While it
> might be nice to be able to print symbols like the copyright, I would think
> it has little value compared to the practicality of being able to connect
> whatever serial terminal or terminal emulator is available without getting
> odd character sequences.

FWIW, I debug my embedded systems over serial lines and these messages
currently render just fine (during initial boot-time print and via
dmesg). But not all environments are created equal I suppose.

I'm curious though, shouldn't such display be determined primarily by
the host-side environment where the console is being viewed? That is,
even for embedded development, going to be a fully-fledged system that
can be expected to handle modern text encodings, right? I'm honestly
not very knowledgeable in this area, so there could be many pitfalls
I'm missing. And I'm not even sure right now what would cause Marek's
system to print out that escape-char junk while printing fine on mine.

> What I'm trying to say is that it's not just printk that's at fault, it's
> worth considering the environment which printk is used in.

But this is not necessarily an argument against supporting it. Can
legacy support and UTF-8 coexist peacefully?

Brian
