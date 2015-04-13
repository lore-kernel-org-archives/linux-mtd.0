Received: from mail-ie0-f182.google.com ([209.85.223.182])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhVBd-0008V4-Fe
 for linux-mtd@lists.infradead.org; Mon, 13 Apr 2015 03:37:26 +0000
Received: by iejt8 with SMTP id t8so55295584iej.2
 for <linux-mtd@lists.infradead.org>; Sun, 12 Apr 2015 20:37:00 -0700 (PDT)
Message-ID: <552B39D8.6060308@gmail.com>
Date: Sun, 12 Apr 2015 23:36:56 -0400
From: nick <xerofoify@gmail.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 4/4] UBI: Implement bitrot checking
References: <1427631197-23610-1-git-send-email-richard@nod.at>	<1427631197-23610-5-git-send-email-richard@nod.at>	<20150412190119.7f0f7c64@bbrezillon>	<552AA6B7.3070806@nod.at>	<20150412212050.2949b6f5@bbrezillon>	<552ACD28.8000409@nod.at>
 <20150412232448.13600654@bbrezillon> <552AE4E0.1010605@nod.at>
In-Reply-To: <552AE4E0.1010605@nod.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 2015-04-12 05:34 PM, Richard Weinberger wrote:
>>> >> While I agree that consuming memory is not very nice I don't think that 125KiB
>>> >> is a big deal.
>> > 
>> > Hm, a few weeks ago, when I suggested to store information about PEBs in
>> > order to better choose the next block to be checked for bitrot, one of
>> > your argument to reject that approach was the memory consumption of
>> > such a design.
>> > In my case the only thing I needed was the following structure (one
>> > instance per PEB):
>> > 
>> > struct ubi_peb_statistics {
>> > 	struct list_head node;
>> > 	int pnum;
>> > 	int bitflips;
>> > 	int last_full_read; /* in seconds */
>> > 	int last_partial_write; /* in seconds */
>> > };
>> > 
>> > which is 24 bytes large.
>> > 
>> > I definitely understand the memory consumption argument, but that's not
>> > something you can change depending on who's proposing the solution :-).
> Yeah, but this structure remains in memory forever, right?
> In the bitrot case we allocate the memory only temporary.
> 
> That said, my arguments are not perfect nor irreversible,
> it can happen that I mess up or was simply wrong.
> Just beat me down with my own arguments when I deserve it.
> 
> Thanks,
> //richard
Richard and others,
This seems to be like the way we are handling page tables in the kernel. Further more due
to this if this is overall a good idea otherwise, I would recommend looking into the ratio
of storing the structure as a percent of overall memory on various systems to see if that
much memory is using storing the PEBs this way. Generally if it's over 2% of total memory
I would recommend finding a different solution, on the high end page structures take 1.5%
of overall memory on the high end for all systems I am currently aware of. Another area to
compare for doing something like is the driver core or slabs that need to be there for a 
useable system i.e. the one for task_structs and therefore are always in kernel memory.
Just a option for a MTD newcomer,
Nick
