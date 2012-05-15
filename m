Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUMCV-0006wG-88
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 18:10:24 +0000
Message-ID: <4FB29BF9.7050200@nod.at>
Date: Tue, 15 May 2012 20:10:01 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Subodh Nijsure <snijsure@grid-net.com>
Subject: Re: [RFC v4] UBI: Fastmap support (aka checkpointing)
References: <1337101871-31181-1-git-send-email-richard@nod.at>
 <4FB296EA.5090104@grid-net.com>
In-Reply-To: <4FB296EA.5090104@grid-net.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 Heinz.Egger@linutronix.de, linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Subodh,

Am 15.05.2012 19:48, schrieb Subodh Nijsure:
> Hello Richard,
>
> On 05/15/2012 10:11 AM, Richard Weinberger wrote:
>> v1: https://lwn.net/Articles/481612/
>> v2: https://lwn.net/Articles/496586/
>> v3: Didn't release it to linux-mtd
> Will kernel that has older UBI drivers be able to mount and update the
> UBI volumes that have been created with checkpointing feature?

Of course!

> Say I have bootrom that has 3.0.X kernel that has no knowledge of UBI
> checkpointing, and my flash /dev/mtd2 has UBI volume with checkpointing
> enabled. Will this bootrom be able to attach /dev/mtd2 and mount UBI
> volume and read/write files on it?

Sure!
Your bootrom will scan the UBI volume and detect two unknown internal
volumes with compat=delete in their volume headers.
So, it will delete the two fastmap volumes and continue scanning.
It can alter the volume and so on.

Thanks,
//richard
