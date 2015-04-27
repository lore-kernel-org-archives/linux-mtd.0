Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ymdtp-0005nv-QO
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2015 07:56:18 +0000
From: "Dolev Raviv" <draviv@codeaurora.org>
To: "'Richard Weinberger'" <richard.weinberger@gmail.com>
References: <006901d08012$3a1f97a0$ae5ec6e0$@codeaurora.org>
 <CAFLxGvyJDyN2-WJUkJ9wz5cCDvNjrUsbdpHrN4DH7S1gQoF2Yw@mail.gmail.com>
In-Reply-To: <CAFLxGvyJDyN2-WJUkJ9wz5cCDvNjrUsbdpHrN4DH7S1gQoF2Yw@mail.gmail.com>
Subject: RE: planning general storage capacity for y fs
Date: Mon, 27 Apr 2015 10:55:51 +0300
Message-ID: <007201d080bf$96a0e4e0$c3e2aea0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-us
Cc: linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 'Tanya Brokhman' <tlinder@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>On Sun, Apr 26, 2015 at 1:14 PM, Dolev Raviv <draviv@codeaurora.org> =
wrote:
>> Hi,
>> I'm looking for guidelines for planning storage capacity. I =
understand=20
>> it strongly depended on the usage type.
>> I want to know at what point storage fullness is effecting =
performance=20
>> in a standard read/write partition. Do different File Systems=20
>> (UBIFS/EXT4) have different full-free ratio?
>> What about read only fs? Can I plan less free space in such cases?
>>
>> I'll appreciate any input on this, for UBIFS specific and fs in =
general.
>
>Not sure if I got your question.
>You want to know how filesystems in general behave when they run out of =
free space?
>The general answer is that they need more effort to find free space.
>
>In case of UBIFS you also have to think of the garbage collector.
>See http://www.linux-mtd.infradead.org/doc/ubifs.html
>At the end of the day you'll have to run benchmarks on your own to find =
out how a specific filesystem behaves on your workload...
>

Thanks Richard!
Let me rephrase the question: In the past I knew there was a rule of =
thumb, 'leave free 30% of the storage space'. Nowadays I couldn't find =
any reference to this.
I was wondering, is there a known point in UBIFS (or ext4), where =
leaving less free storage space, that performance is dropping? Maybe a =
ratio of free-occupied is not the right way to look at it, but to leave =
a certain size free (e.g. 50MB)?

Thanks,
Dolev
--=20
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a =
Linux Foundation Collaborative Project
