Received: from mail-ie0-x233.google.com ([2607:f8b0:4001:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YuQd0-0002Sz-Le
 for linux-mtd@lists.infradead.org; Mon, 18 May 2015 19:23:07 +0000
Received: by iebgx4 with SMTP id gx4so178994507ieb.0
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2015 12:22:43 -0700 (PDT)
Message-ID: <555A3C01.3030800@gmail.com>
Date: Mon, 18 May 2015 15:22:41 -0400
From: nick <xerofoify@gmail.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: Tracking flash IO activity?
References: <CAD=nrE_4tsSvKQ_Rz8XJpjJhfT-z+-Tkhn-SMvvcyUaPzg1PHA@mail.gmail.com>
 <CAAbfDBfXZCrRJ2M_MDGP8Pmo97tLiduYGHa2AdKasTya60e81A@mail.gmail.com>
 <CAD=nrE9=040qfZHQi349KAikhiRAr5YrPgO52-7bm9uA9WmW=Q@mail.gmail.com>
 <20150516205354.GK6055@norris-Latitude-E6410>
 <CAFLxGvwrCO8BozRb3jkncWy+2w6y82zz+wtL2r_E9i3VT3N8HQ@mail.gmail.com>
 <20150518175702.GO11598@ld-irv-0074> <555A398B.8050203@nod.at>
In-Reply-To: <555A398B.8050203@nod.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "valent.turkovic@gmail.com" <valent.turkovic@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 2015-05-18 03:12 PM, Richard Weinberger wrote:
> Am 18.05.2015 um 19:57 schrieb Brian Norris:
>> On Sat, May 16, 2015 at 11:22:52PM +0200, Richard Weinberger wrote:
>>> On Sat, May 16, 2015 at 10:53 PM, Brian Norris
>>> <computersforpeace@gmail.com> wrote:
>>>> I don't know of any similar IO stats for MTDs, sorry.
>>>
>>> I wonder how hard it would be to integrate mtd into our current block IO stats.
>>> It mtd is too low level we could also do it with UBI.
>>
>> I'm not sure if blk-io's iostats would be sufficiently informative for
>> MTD/UBI anyway. Wouldn't we care about at least one extra
>> non-block-device stat: the erase stats?
> 
> This coin has two sides.
> I agree that for MTD we have three interesting counters, read, write and erase
> which would deserve their own tool. Maybe something like mtdtop or mtdstat?
> But it would be nice if well known tools like iostat(1) could work too.
> 
>> Also (and this may be more like what Valent is asking for, though he
>> mentions JFFS2, not UBIFS) is there a readily-available tool for reading
>> the erase counter information from a UBI volume?
> 
> Not really. I have a very hacky tool to inspect UBI Images.
> Mainly to debug fastmap issues. If I find some spare time to
> polish it I'll happily publish it.
> 
> Thanks,
> //richard
> 

Richard,
I feel that not having a tool like this is a very bad idea, it
may be one of the major issues I or others may  have with ubifs 
as a file system choice for flash based systems. You stated that
the tool you have is hacky, does this mean in terms of bugs or 
coding standards? If the tool works and is fairly stable why not
push to the repo for mtd-tools and mark it as experimental for now.
This way the mtd developers can start working on it and allow you
time to do other more important things with your time as a maintainer.
Nick
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
