Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2gpX-0006fQ-MB
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2011 09:27:49 +0000
From: Detlev Zundel <dzu@denx.de>
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Subject: Re: [RFC] Handling of errors for AMD NOR (cfi_cmdset_0002) chips
References: <4D797E23.6070409@emcraft.com> <4D79DC90.6070600@aimvalley.nl>
	<m27hbpyh36.fsf@ohwell.denx.de> <4D8AF428.5010000@aimvalley.nl>
Date: Thu, 24 Mar 2011 10:27:43 +0100
In-Reply-To: <4D8AF428.5010000@aimvalley.nl> (Norbert van Bolhuis's message of
	"Thu, 24 Mar 2011 08:35:04 +0100")
Message-ID: <m28vw4x3zk.fsf@ohwell.denx.de>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, yanok@emcraft.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Norbert,

> On 03/23/11 16:47, Detlev Zundel wrote:
>> Hi Norbert,
>>
>>> What issue you have with NOR flash and UBIFS ?
>>
>> We're still working on the issue initially reported by Anatolij here:
>>
>> http://thread.gmane.org/gmane.linux.drivers.mtd/33832
>>
>> Cheers
>>    Detlev
>>
>
>
> ok, thanks.
>
> But the unstable bit problem is different from software timeout
> related issues regarding UBI and NOR flash the OP mentioned.
> It is anyway good to hear work is in progress here.

It is never good to ignore errors reported by the hardware if you are
looking for problems in higher software layers.  That's why we decided
to implement such error checks which can then be helpful in our further
testing.  We are hoping that we can better differentiate between
software and hardware problems this way.

> I asked about the software timeout issue because I've seen false
> timeouts with powerpc + CONFIG_NO_HZ a while ago.
> In my case the low-level do_write_buffer (cfi_cmdset_0002.c) timed
> out too early. See
> http://lkml.org/lkml/2009/9/3/84

Ok, I see, thanks for the pointer.  The problems you experienced then
were unneccessary software timeouts, but there was no data corruption,
correct?

Best wishes
  Detlev Zundel

--
DENX Software Engineering GmbH,      MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich,  Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-40 Fax: (+49)-8142-66989-80 Email: dzu@denx.de
