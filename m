Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTSqj-0003dP-KF
 for linux-mtd@lists.infradead.org; Sun, 02 Dec 2018 14:35:59 +0000
Date: Sun, 2 Dec 2018 09:35:43 -0500
From: Sasha Levin <sashal@kernel.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 martin.kepplinger@ginzinger.com, Stable <stable@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Juergen <juergen.lachmann@harman.com>
Subject: Re: [PATCH] ubi: fastmap: Check each mapping only once
Message-ID: <20181202143543.GE221015@sasha-vm>
References: <20181126103842.3249-1-martin.kepplinger@ginzinger.com>
 <20181129080923.GE13859@kroah.com> <1676802.TThbbZSlzy@blindfold>
 <CADVatmP1h7GJJRVURkinwSM44Y4iooMP-U_7zew4V+zsMva4Vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CADVatmP1h7GJJRVURkinwSM44Y4iooMP-U_7zew4V+zsMva4Vw@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 02, 2018 at 11:50:33AM +0000, Sudip Mukherjee wrote:
>Hi Greg,
>
>On Sun, Dec 2, 2018 at 8:51 AM Richard Weinberger <richard@nod.at> wrote:
>>
>> Greg,
>>
>> Am Donnerstag, 29. November 2018, 09:09:23 CET schrieb Greg KH:
>> > On Mon, Nov 26, 2018 at 11:38:42AM +0100, Martin Kepplinger wrote:
>> > > From: Richard Weinberger <richard@nod.at>
>> > >
>> > > [ Upstream commit 34653fd8c46e771585fce5975e4243f8fd401914 ]
>> > >
><snip>
>> >
>> > Now queued up for 4.14.y, thanks.
>>
>> can you *please* slow a little down?
>
>True. It will really help if you can have some sort of fixed schedule
>for stable release, like maybe stablerc is ready on Thursday or Friday
>and release the stable on Monday. Having a weekend in stablerc will be
>helpful for people like me who only get the time in weekends for
>upstream or stable kernel.

Any sort of schedule will never work for everyone (for example, if it's
part of your paid job - you don't necessarily want to review stuff over
the weekend).

--
Thanks,
Sasha
